//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const native_endian = @import("builtin").target.cpu.arch.endian();
const assert = std.debug.assert;

const DecodeError = error{
    MalformedHeader,
    HeaderCrcMismatch,
    TruncatedPayload,
    NotImplemented,
    InvalidField,
    EndOfPayload,
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

const FieldValue = union(FieldType) {
    enumeration: u8,
    sint8: i8,
    uint8: u8,
    sint16: i16,
    uint16: u16,
    sint32: i32,
    uint32: u32,
    string: [:0]u8,
    float32: i32, // needs to be scaled by params in profile
    float64: i64, // needs to be scaled by params in profile
    uint8z: u8,
    uint16z: u16,
    uint32z: u32,
    byte: u8,
    sint64: i64,
    uint64: u64,
    uint64z: u64,

    pub fn from_slice(tag: FieldType, data: []const u8, byte_order: std.builtin.Endian, _: std.mem.Allocator) !FieldValue {
        switch (tag) {
            FieldType.enumeration => {
                return FieldValue{ .enumeration = data[0] };
            },
            FieldType.sint8 => {
                return FieldValue{ .sint8 = std.mem.readPackedInt(i8, data, 0, byte_order) };
            },
            FieldType.uint8 => {
                return FieldValue{ .uint8 = data[0] };
            },
            FieldType.sint16 => {
                return FieldValue{ .sint16 = std.mem.readPackedInt(i16, data, 0, byte_order) };
            },
            FieldType.uint16 => {
                return FieldValue{ .uint16 = std.mem.readPackedInt(u16, data, 0, byte_order) };
            },
            FieldType.sint32 => {
                return FieldValue{ .sint32 = std.mem.readPackedInt(i32, data, 0, byte_order) };
            },
            FieldType.uint32 => {
                return FieldValue{ .uint32 = std.mem.readPackedInt(u32, data, 0, byte_order) };
            },
            FieldType.string => {
                return error.NotImplemented;
            },
            FieldType.float32 => {
                return FieldValue{ .float32 = std.mem.readPackedInt(i32, data, 0, byte_order) };
            },
            FieldType.float64 => {
                return FieldValue{ .float64 = std.mem.readPackedInt(i64, data, 0, byte_order) };
            },
            FieldType.uint8z => {
                return FieldValue{ .uint8z = data[0] };
            },
            FieldType.uint16z => {
                return FieldValue{ .uint16z = std.mem.readPackedInt(u16, data, 0, byte_order) };
            },
            FieldType.uint32z => {
                return FieldValue{ .uint32z = std.mem.readPackedInt(u32, data, 0, byte_order) };
            },
            FieldType.byte => {
                return FieldValue{ .byte = data[0] };
            },
            FieldType.sint64 => {
                return FieldValue{ .sint64 = std.mem.readPackedInt(i64, data, 0, byte_order) };
            },
            FieldType.uint64 => {
                return FieldValue{ .uint64 = std.mem.readPackedInt(u64, data, 0, byte_order) };
            },
            FieldType.uint64z => {
                return FieldValue{ .uint64 = std.mem.readPackedInt(u64, data, 0, byte_order) };
            },
        }
        unreachable;
    }
};

const FieldDefinition = packed struct(u24) {
    id: u8,
    size: u8,
    type: FieldType,
};

const MessageDefinition = struct {
    local_id: u8,
    global_id: u16,
    byte_order: std.builtin.Endian,
    fields: std.ArrayList(FieldDefinition),
};

const FieldData = struct {
    id: u8,
    raw_value: FieldValue,

    pub fn deinit(self: *FieldData, allocator: std.mem.Allocator) void {
        switch (self.*.raw_value) {
            FieldValue.string => |str| {
                allocator.free(str);
            },
            else => {},
        }
    }
};

const Message = struct {
    global_id: u16,
    fields: std.ArrayList(FieldData),

    pub fn deinit(self: *Message, allocator: std.mem.Allocator) void {
        for (self.*.fields.items) |*field| {
            field.deinit(allocator);
        }
        self.*.fields.deinit(allocator);
    }
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
        if (buffer[0] != header_len + crc_len) {
            // Only support the 14-byte flavor of the header for now.
            return error.MalformedHeader;
        }

        const crc: u16 = compute_crc(buffer[0..12]);
        const expected_crc = std.mem.readPackedInt(u16, buffer, 96, .little);
        if (expected_crc != crc and expected_crc != 0) {
            return error.HeaderCrcMismatch;
        }

        return Decoder{
            .protocol_version = buffer[1],
            .profile_version = std.mem.readPackedInt(u16, buffer, 8, .little),
            .remaining_bytes = std.mem.readPackedInt(u32, buffer, 32, .little),
            .reader = reader,
            .allocator = allocator,
        };
    }

    fn readRecord(self: *Decoder) !?Message {
        if (self.*.remaining_bytes == 0) {
            return error.EndOfPayload;
        }

        const RecordHeader = packed struct(u8) {
            local_message_id: u4,
            has_developer_fields: bool, // only set for definition records
            reserved: u1,
            message_type: MessageType,
            header_type: RecordHeaderType,
        };
        const record_header = try self.*.reader.takeStruct(RecordHeader, .little);
        if (record_header.header_type != RecordHeaderType.normal) {
            return error.NotImplemented;
        }
        self.remaining_bytes -= 1;

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
        switch (record_header.message_type) {
            MessageType.definition => {
                const header = try self.*.reader.takeStruct(DefinitionHeader, .little);
                var fields = try std.ArrayList(FieldDefinition).initCapacity(self.*.allocator, header.num_fields);
                for (0..header.num_fields) |_| {
                    const field = try fields.addOneBounded();
                    field.*.id = try self.*.reader.takeByte();
                    field.*.size = try self.*.reader.takeByte();
                    field.*.type = @enumFromInt(try self.*.reader.takeByte() & ~@as(u8, 0b1000_0000));
                }
                self.*.message_definitions[record_header.local_message_id] = MessageDefinition{
                    .local_id = record_header.local_message_id,
                    .global_id = header.global_id,
                    .byte_order = switch (header.byte_order) {
                        MessageByteOrder.little_endian => .little,
                        MessageByteOrder.big_endian => .big,
                    },
                    .fields = fields,
                };
                if (record_header.has_developer_fields) {
                    const num_dev_fields = try self.*.reader.takeByte();
                    if (num_dev_fields != 0) {
                        return error.NotImplemented;
                    }
                }
                // 3 bytes per message field + definition header fields (6 bytes)
                self.*.remaining_bytes -= header.num_fields * 3 + 6;
            },
            MessageType.data => {
                const message_def = self.*.message_definitions[record_header.local_message_id].?;
                var fields = try std.ArrayList(FieldData).initCapacity(self.*.allocator, message_def.fields.items.len);
                for (message_def.fields.items) |field_def| {
                    const field = try fields.addOneBounded();
                    field.*.id = field_def.id;
                    field.*.raw_value = try FieldValue.from_slice(field_def.type, try self.*.reader.take(field_def.size), message_def.byte_order, self.*.allocator);
                    self.remaining_bytes -= field_def.size;
                }
                return Message{
                    .global_id = message_def.global_id,
                    .fields = fields,
                };
            },
        }
        return null;
    }
};

test "crc" {
    // extraced from a .FIT file produced by the edge 540
    const payload = [_]u8{ 0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54 };
    try std.testing.expectEqual(0x4ed4, compute_crc(payload[0..]));
    // Should gracefully handle an empty slice
    try std.testing.expectEqual(0, compute_crc(payload[0..0]));
}

test "decode" {
    const header = [_]u8{
        0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54, //
        0xd4, 0x4e, 0x40, 0x00, 0x00, 0x00, 0x00, 0x07, 0x03, 0x04, 0x8c, 0x04,
        0x04, 0x86, 0x07, 0x04, 0x86, 0x01, 0x02, 0x84, 0x02, 0x02, 0x84, 0x05,
        0x02, 0x84, 0x00, 0x01, 0x00, 0x00, 0x94, 0x04, 0x27, 0xd7, 0x98, 0xf8,
        0x86, 0x44, 0xff, 0xff, 0xff, 0xff, 0x01, 0x00, 0xdd, 0x0f, 0xff, 0xff,
        0x04, 0x41,
    };
    var reader = std.Io.Reader.fixed(&header);
    var decoder = try Decoder.fromReader(&reader, std.testing.allocator);
    defer decoder.deinit();
    try std.testing.expectEqual(268513, decoder.remaining_bytes);
    try std.testing.expectEqual(null, try decoder.readRecord());
    try std.testing.expectEqual(7, decoder.message_definitions[0].?.fields.capacity);
    var message = try decoder.readRecord();
    try std.testing.expect(message != null);
    defer message.?.deinit(std.testing.allocator);
    try std.testing.expectEqual(FieldValue{ .uint32z = 3609658516 }, message.?.fields.items[0].raw_value);
    try std.testing.expectEqual(FieldValue{ .uint32 = 1149696152 }, message.?.fields.items[1].raw_value);
    try std.testing.expectEqual(FieldValue{ .uint32 = 0xFFFFFFFF }, message.?.fields.items[2].raw_value);
    try std.testing.expectEqual(FieldValue{ .uint32 = 0xFFFFFFFF }, message.?.fields.items[2].raw_value);
    try std.testing.expectEqual(FieldValue{ .uint16 = 1 }, message.?.fields.items[3].raw_value);
    try std.testing.expectEqual(FieldValue{ .uint16 = 4061 }, message.?.fields.items[4].raw_value);
    try std.testing.expectEqual(FieldValue{ .uint16 = 0xFFFF }, message.?.fields.items[5].raw_value);
    try std.testing.expectEqual(FieldValue{ .enumeration = 4 }, message.?.fields.items[6].raw_value);
}
