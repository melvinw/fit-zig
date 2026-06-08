//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const native_endian = @import("builtin").target.cpu.arch.endian();
const assert = std.debug.assert;

const DecodeError = error{
    MalformedHeader,
    HeaderCrcMismatch,
    TruncatedPayload,
    NotImplemented,
};

const RecordHeaderType = enum(u1) {
    normal = 0,
    compressed_timestamp = 1,
};

const MessageType = enum(u1) {
    data = 0,
    definition = 1,
};

const FieldType = enum(u8) {
    enumeration = 0x00,
    sint8 = 0x01,
    uint8 = 0x02,
    sint16 = 0x03,
    uint16 = 0x04,
    sint32 = 0x05,
    uint32 = 0x06,
    string = 0x07,
    float32 = 0x08,
    float64 = 0x09,
    uint8z = 0x0A,
    uint16z = 0x0B,
    uint32z = 0x0C,
    byte = 0x0D,
    sint64 = 0x0E,
    uint64 = 0x0F,
    uint64z = 0x10,
};

const FieldDefinition = packed struct(u24) {
    field_id: u8,
    size: u8,
    type: FieldType,
};

const MessageDefinition = struct {
    local_id: u8,
    global_id: u16,
    byte_order: std.builtin.Endian,
    fields: std.ArrayList(FieldDefinition),
};

fn compute_crc(payload: []const u8) u16 {
    const crc_table = [_]u16{
        0x0000, 0xCC01, 0xD801, 0x1400, 0xF001, 0x3C00, 0x2800, 0xE401,
        0xA001, 0x6C00, 0x7800, 0xB401, 0x5000, 0x9C01, 0x8801, 0x4400,
    };

    var crc: u16 = 0;
    for (payload) |byte| {
        // compute checksum of lower four bits of byte
        var tmp: u16 = crc_table[crc & 0xF];
        crc = (crc >> 4) & 0x0FFF;
        crc = crc ^ tmp ^ crc_table[byte & 0xF];

        // now compute checksum of upper four bits of byte
        tmp = crc_table[crc & 0xF];
        crc = (crc >> 4) & 0x0FFF;
        crc = crc ^ tmp ^ crc_table[(byte >> 4) & 0xF];
    }
    return crc;
}

const max_message_defs = 16;

const Decoder = struct {
    protocol_version: u8,
    profile_version: u16,
    remaining_bytes: usize,
    message_definitions: [max_message_defs]?MessageDefinition = @splat(null),
    reader: *std.Io.Reader,
    allocator: std.mem.Allocator,

    pub fn deinit(self: *Decoder) void {
        for (&self.*.message_definitions) |*optional_def| {
            if (optional_def.*) |*def| {
                def.*.fields.deinit(self.*.allocator);
            }
        }
    }

    pub fn fromReader(reader: *std.Io.Reader, allocator: std.mem.Allocator) !Decoder {
        const header_len: usize = 12;
        const crc_len: usize = 2;
        var buffer = try reader.takeArray(header_len + crc_len);

        // Only support the 14-byte flavor of the header for now.
        if (buffer[0] != header_len + crc_len) {
            return error.MalformedHeader;
        }

        const crc: u16 = compute_crc(buffer[0..12]);

        const header_crc_ptr: *const u16 = @ptrCast(@alignCast(buffer[header_len .. header_len + crc_len]));
        const expected_crc = switch (native_endian) {
            .big => @byteSwap(header_crc_ptr.*),
            .little => header_crc_ptr.*,
        };
        if (expected_crc != crc and expected_crc != 0) {
            return error.HeaderCrcMismatch;
        }

        const profile_version_ptr: *const u16 = @ptrCast(@alignCast(buffer[2..4]));
        const profile_version = switch (native_endian) {
            .big => @byteSwap(profile_version_ptr.*),
            .little => profile_version_ptr.*,
        };

        const data_len_ptr: *const u32 = @ptrCast(@alignCast(buffer[4..7]));
        const data_len: usize = switch (native_endian) {
            .big => @byteSwap(data_len_ptr.*),
            .little => data_len_ptr.*,
        };

        return Decoder{
            .protocol_version = buffer[1],
            .profile_version = profile_version,
            .remaining_bytes = data_len,
            .reader = reader,
            .allocator = allocator,
        };
    }

    fn readRecord(self: *Decoder) !void {
        if (self.*.remaining_bytes == 0) {
            return;
        }

        const RecordHeader = packed struct(u8) {
            local_message_id: u4,
            reserved: u2,
            message_type: MessageType,
            header_type: RecordHeaderType,
        };
        const record_header = try self.*.reader.takeStructPointer(RecordHeader);
        if (record_header.*.header_type != RecordHeaderType.normal) {
            return error.NotImplemented;
        }

        const MessageByteOrder = enum(u8) {
            little_endian = 0,
            big_endian = 1,
        };
        const DefinitionHeader = packed struct(u40) {
            reserved: u8,
            byte_order: MessageByteOrder,
            global_id: u16,
            num_fields: u8,
        };
        switch (record_header.*.message_type) {
            MessageType.definition => {
                // XXX can't use takeStructPtr because DefintionHeader gets
                // padded to 8 bytes. To avoid a copy here we could just read
                // a slice and do a pointer/align cast ourselves, but I'd like
                // to do something cleaner. So, just use takeStruct() for now
                // until I can pause to think of what that might be.
                const header = try self.*.reader.takeStruct(DefinitionHeader, .little);
                var fields = try std.ArrayList(FieldDefinition).initCapacity(self.*.allocator, header.num_fields);
                for (0..header.num_fields) |_| {
                    const field = try fields.addOneBounded();
                    field.*.field_id = try self.*.reader.takeByte();
                    field.*.size = try self.*.reader.takeByte();
                    field.*.type = @enumFromInt(try self.*.reader.takeByte() & ~@as(u8, 0b1000_0000));
                }
                self.*.message_definitions[record_header.*.local_message_id] = MessageDefinition{
                    .local_id = record_header.*.local_message_id,
                    .global_id = header.global_id,
                    .byte_order = switch (header.byte_order) {
                        MessageByteOrder.little_endian => .little,
                        MessageByteOrder.big_endian => .big,
                    },
                    .fields = fields,
                };
                const num_dev_fields = try self.*.reader.takeByte();
                if (num_dev_fields != 0) {
                    return error.NotImplemented;
                }
                // 3 bytes per message field + definition header fields (6 bytes) + record header (1 byte)
                self.*.remaining_bytes -= header.num_fields * 3 + 7;
            },
            else => {
                return error.NotImplemented;
            },
        }
    }
};

test "crc" {
    // extraced from a .FIT file produced by the edge 540
    const payload = [_]u8{ 0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54};
    try std.testing.expectEqual(0x4ed4, compute_crc(payload[0..]));
    // Should gracefully handle an empty slice
    try std.testing.expectEqual(0, compute_crc(payload[0..0]));
}

test "header length" {
    const header = [_]u8{ 0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54, 0xd4, 0x4e, 0x40, 0x00, 0x00, 0x00, 0x00, 0x07, 0x03, 0x04, 0x8c, 0x04, 0x04, 0x86, 0x07, 0x04, 0x86, 0x01, 0x02, 0x84, 0x02, 0x02, 0x84, 0x05, 0x02, 0x84, 0x00, 0x01, 0x00, 0x00 };
    var reader = std.Io.Reader.fixed(&header);
    var decoder = try Decoder.fromReader(&reader, std.testing.allocator);
    defer decoder.deinit();
    try std.testing.expectEqual(268513, decoder.remaining_bytes);
    try decoder.readRecord();
    try std.testing.expectEqual(7, decoder.message_definitions[0].?.fields.capacity);
}
