//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const native_endian = @import("builtin").target.cpu.arch.endian();
const assert = std.debug.assert;

pub const DecodeError = error{
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

pub const FieldType = enum(u8) {
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

    pub fn packedSize(t: FieldType) usize {
        return switch (t) {
            .enumeration, .sint8, .uint8, .uint8z, .byte => 1,
            .sint16, .uint16, .uint16z => 2,
            .sint32, .uint32, .uint32z, .float32 => 4,
            .sint64, .uint64, .uint64z, .float64 => 8,
            .string => 1, // XXX
        };
    }
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
    float32: f32,
    float64: f64,
    uint8z: u8,
    uint16z: u16,
    uint32z: u32,
    byte: u8,
    sint64: i64,
    uint64: u64,
    uint64z: u64,

    pub fn deinit(self: *const FieldValue, allocator: std.mem.Allocator) void {
        switch (self.*) {
            .string => |str| {
                allocator.free(str);
            },
            else => {},
        }
    }

    pub fn fromBytes(tag: FieldType, data: []const u8, byte_order: std.builtin.Endian, allocator: std.mem.Allocator) !FieldValue {
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
                const len = std.mem.find(u8, data, &[_]u8{0});
                const src_str = data[0..len.? :0];
                const dst_str = try allocator.allocSentinel(u8, len.?, 0);
                @memcpy(dst_str, src_str);
                return FieldValue{ .string = dst_str };
            },
            // Documentation about how FIT files represents floating point
            // numbers are sparse.  For now, just assume that the device that
            // generated the file and the host reading it are both using IEEE
            // 754.
            FieldType.float32 => {
                var val: f32 = undefined;
                const dst = std.mem.asBytes(&val);
                @memcpy(dst, data[0..@sizeOf(f32)]);
                return FieldValue{ .float32 = val };
            },
            FieldType.float64 => {
                var val: f64 = undefined;
                const dst = std.mem.asBytes(&val);
                @memcpy(dst, data[0..@sizeOf(f64)]);
                return FieldValue{ .float64 = val };
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
                return FieldValue{ .uint64z = std.mem.readPackedInt(u64, data, 0, byte_order) };
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
    global_id: u16,
    byte_order: std.builtin.Endian,
    fields: []FieldDefinition,

    fn deinit(self: MessageDefinition, allocator: std.mem.Allocator) void {
        allocator.free(self.fields);
    }

    pub fn fromReader(reader: *std.Io.Reader, allocator: std.mem.Allocator) !struct { usize, MessageDefinition } {
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

        const header = try reader.takeStruct(DefinitionHeader, .little);
        const fields = try allocator.alloc(FieldDefinition, header.num_fields);
        for (fields) |*field| {
            field.*.id = try reader.takeByte();
            field.*.size = try reader.takeByte();
            field.*.type = @enumFromInt(try reader.takeByte() & ~@as(u8, 0b1000_0000));
        }
        return .{ fields.len * 3 + @bitSizeOf(DefinitionHeader) / 8, MessageDefinition{
            .global_id = header.global_id,
            .byte_order = switch (header.byte_order) {
                MessageByteOrder.little_endian => .little,
                MessageByteOrder.big_endian => .big,
            },
            .fields = fields,
        } };
    }

    pub fn messageSize(self: MessageDefinition) usize {
        var bytes_read: usize = 0;
        for (self.fields) |field_def| {
            bytes_read += field_def.size;
        }
        return bytes_read;
    }
};

pub const FieldData = struct {
    id: u8,
    raw_value: []FieldValue,

    pub fn deinit(self: *FieldData, allocator: std.mem.Allocator) void {
        for (self.*.raw_value) |value| {
            value.deinit(allocator);
        }
        allocator.free(self.*.raw_value);
    }
};

pub const Message = struct {
    global_id: u16,
    fields: []FieldData,

    fn cleanup(fields: []FieldData, n: usize, allocator: std.mem.Allocator) void {
        for (0..n) |i| {
            fields[i].deinit(allocator);
        }
        allocator.free(fields);
    }

    pub fn fromBytes(message_def: MessageDefinition, buffer: []const u8, allocator: std.mem.Allocator) !Message {
        assert(buffer.len == message_def.messageSize());
        var offset: usize = 0;
        var fields = try allocator.alloc(FieldData, message_def.fields.len);
        for (message_def.fields, 0..) |field_def, i| {
            fields[i].id = field_def.id;
            if (field_def.type == .string) {
                fields[i].raw_value = allocator.alloc(FieldValue, 1) catch |err| {
                    cleanup(fields, message_def.fields.len, allocator);
                    return err;
                };
                fields[i].raw_value[0] = FieldValue.fromBytes(field_def.type, buffer[offset .. offset + field_def.size], message_def.byte_order, allocator) catch |err| {
                    cleanup(fields, message_def.fields.len, allocator);
                    return err;
                };
                offset += field_def.size;
            } else {
                assert(field_def.size % field_def.type.packedSize() == 0);
                const num_elements = field_def.size / field_def.type.packedSize();
                fields[i].raw_value = allocator.alloc(FieldValue, num_elements) catch |err| {
                    cleanup(fields, message_def.fields.len, allocator);
                    return err;
                };
                for (0..num_elements) |j| {
                    fields[i].raw_value[j] = FieldValue.fromBytes(field_def.type, buffer[offset .. offset + field_def.type.packedSize()], message_def.byte_order, allocator) catch |err| {
                        cleanup(fields, message_def.fields.len, allocator);
                        return err;
                    };
                    offset += field_def.type.packedSize();
                }
            }
        }
        return Message{
            .global_id = message_def.global_id,
            .fields = fields,
        };
    }

    pub fn deinit(self: *const Message, allocator: std.mem.Allocator) void {
        for (self.*.fields) |*field| {
            field.deinit(allocator);
        }
        allocator.free(self.*.fields);
    }
};

fn computeCrc(payload: []const u8) u16 {
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

pub const Decoder = struct {
    const max_message_defs = 16;

    protocol_version: u8,
    profile_version: u16,
    remaining_bytes: usize,
    message_definitions: [max_message_defs]?MessageDefinition = @splat(null),
    reader: *std.Io.Reader,
    allocator: std.mem.Allocator,

    pub fn deinit(self: *Decoder) void {
        for (&self.*.message_definitions) |*optional_def| {
            if (optional_def.*) |def| {
                def.deinit(self.allocator);
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

        const crc: u16 = computeCrc(buffer[0..12]);
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

    pub fn readRecord(self: *Decoder) !?Message {
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
        self.remaining_bytes -= 1;

        switch (record_header.message_type) {
            MessageType.definition => {
                assert(record_header.header_type == RecordHeaderType.normal);
                if (record_header.has_developer_fields) {
                    return error.NotImplemented;
                }
                const bytes_read, const definition = try MessageDefinition.fromReader(self.*.reader, self.*.allocator);
                self.*.remaining_bytes -= bytes_read;
                if (self.*.message_definitions[record_header.local_message_id]) |old_def| {
                    old_def.deinit(self.allocator);
                }
                self.*.message_definitions[record_header.local_message_id] = definition;
            },
            MessageType.data => {
                const message_def = self.*.message_definitions[record_header.local_message_id].?;
                const message_buffer = try self.*.reader.take(message_def.messageSize());
                const message = try Message.fromBytes(message_def, message_buffer, self.*.allocator);
                self.remaining_bytes -= message_def.messageSize();
                if (record_header.header_type != RecordHeaderType.normal) {
                    return error.NotImplemented;
                }
                return message;
            },
        }
        return null;
    }
};

test "crc" {
    // extraced from a .FIT file produced by the edge 540
    const payload = [_]u8{ 0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54 };
    try std.testing.expectEqual(0x4ed4, computeCrc(payload[0..]));
    // Should gracefully handle an empty slice
    try std.testing.expectEqual(0, computeCrc(payload[0..0]));
}

test "decode integer types" {
    const buffer = [_]u8{ 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };

    // Big Endian
    try std.testing.expectEqual(FieldValue{ .enumeration = 0x01 }, try FieldValue.fromBytes(FieldType.enumeration, buffer[0..1], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .byte = 0x01 }, try FieldValue.fromBytes(FieldType.byte, buffer[0..1], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint8 = 0x01 }, try FieldValue.fromBytes(FieldType.uint8, buffer[0..1], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint8 = 0x01 }, try FieldValue.fromBytes(FieldType.sint8, buffer[0..1], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint16 = 0x0102 }, try FieldValue.fromBytes(FieldType.uint16, buffer[0..2], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint16z = 0x0102 }, try FieldValue.fromBytes(FieldType.uint16z, buffer[0..2], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint16 = 0x0102 }, try FieldValue.fromBytes(FieldType.sint16, buffer[0..2], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint32 = 0x01020304 }, try FieldValue.fromBytes(FieldType.uint32, buffer[0..4], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint32z = 0x01020304 }, try FieldValue.fromBytes(FieldType.uint32z, buffer[0..4], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint32 = 0x01020304 }, try FieldValue.fromBytes(FieldType.sint32, buffer[0..4], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint64 = 0x0102030405060708 }, try FieldValue.fromBytes(FieldType.uint64, buffer[0..8], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint64z = 0x0102030405060708 }, try FieldValue.fromBytes(FieldType.uint64z, buffer[0..8], .big, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint64 = 0x0102030405060708 }, try FieldValue.fromBytes(FieldType.sint64, buffer[0..8], .big, std.testing.allocator));

    // Little Endian
    try std.testing.expectEqual(FieldValue{ .enumeration = 0x01 }, try FieldValue.fromBytes(FieldType.enumeration, buffer[0..1], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .byte = 0x01 }, try FieldValue.fromBytes(FieldType.byte, buffer[0..1], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint8 = 0x01 }, try FieldValue.fromBytes(FieldType.uint8, buffer[0..1], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint8 = 0x01 }, try FieldValue.fromBytes(FieldType.sint8, buffer[0..1], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint16 = 0x0201 }, try FieldValue.fromBytes(FieldType.uint16, buffer[0..2], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint16z = 0x0201 }, try FieldValue.fromBytes(FieldType.uint16z, buffer[0..2], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint16 = 0x0201 }, try FieldValue.fromBytes(FieldType.sint16, buffer[0..2], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint32 = 0x04030201 }, try FieldValue.fromBytes(FieldType.uint32, buffer[0..4], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint32z = 0x04030201 }, try FieldValue.fromBytes(FieldType.uint32z, buffer[0..4], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint32 = 0x04030201 }, try FieldValue.fromBytes(FieldType.sint32, buffer[0..4], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint64 = 0x0807060504030201 }, try FieldValue.fromBytes(FieldType.uint64, buffer[0..8], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .uint64z = 0x0807060504030201 }, try FieldValue.fromBytes(FieldType.uint64z, buffer[0..8], .little, std.testing.allocator));
    try std.testing.expectEqual(FieldValue{ .sint64 = 0x0807060504030201 }, try FieldValue.fromBytes(FieldType.sint64, buffer[0..8], .little, std.testing.allocator));
}

test "decode string field" {
    const buffer = [_]u8{ 'f', 'o', 'o', 'b', 'a', 'r', 0x0, 0x0, 0x0 };
    const value = try FieldValue.fromBytes(FieldType.string, buffer[0..], .big, std.testing.allocator);
    defer value.deinit(std.testing.allocator);
    try std.testing.expectEqual(FieldType.string, @as(FieldType, value));
    try std.testing.expectEqualStrings("foobar", value.string);
}

test "decode message" {
    var fields = [_]FieldDefinition{
        .{ .id = 0x11, .size = 1, .type = FieldType.enumeration },
        .{ .id = 0x22, .size = 1, .type = FieldType.uint8 },
        .{ .id = 0x33, .size = 2, .type = FieldType.uint16 },
        .{ .id = 0x44, .size = 4, .type = FieldType.uint32 },
        .{ .id = 0x55, .size = 8, .type = FieldType.uint64 },
        .{ .id = 0x66, .size = 1, .type = FieldType.uint8z },
        .{ .id = 0x77, .size = 2, .type = FieldType.uint16z },
        .{ .id = 0x88, .size = 4, .type = FieldType.uint32z },
        .{ .id = 0x99, .size = 8, .type = FieldType.uint64z },
        .{ .id = 0xaa, .size = 14, .type = FieldType.string },
        .{ .id = 0xbb, .size = 8, .type = FieldType.sint64 },
        .{ .id = 0xcc, .size = 4, .type = FieldType.sint32 },
        .{ .id = 0xdd, .size = 2, .type = FieldType.sint16 },
        .{ .id = 0xee, .size = 1, .type = FieldType.sint8 },
        .{ .id = 0xff, .size = 6, .type = FieldType.uint16 },
    };
    var message_def = MessageDefinition{
        .global_id = 1234,
        .byte_order = undefined,
        .fields = fields[0..],
    };

    const buffer = [_]u8{
        0x11, // field 0
        0xaa, // field 1
        0xde, 0xad, // field 2
        0xfe, 0xed, 0xbe, 0xef, // field 3
        0xde, 0xad, 0xbe, 0xef, 0x0, 0xc0, 0xff, 0xee, // field 4
        0x11, // field 5
        0x22, 0x33, // field 6
        0x44, 0x55, 0x66, 0x77, // field 7
        0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, // field 8
        'h', 'e', 'l', 'l', 'o', ',', ' ', 'w', 'o', 'r', 'l', 'd', '!', 0x0, // field 9
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, // field 10
        0x09, 0x0a, 0x0b, 0x0c, // field 11
        0x0d, 0x0e, // field 12
        0x0f, // field 13
        0x11, 0x22, 0x33, 0x44, 0x55, 0x66, // field 14 (array of 3 uint16)
    };

    {
        message_def.byte_order = .big;
        const message = try Message.fromBytes(message_def, &buffer, std.testing.allocator);
        defer message.deinit(std.testing.allocator);
        try std.testing.expectEqual(15, message.fields.len);
        try std.testing.expectEqual(0x11, message.fields[0].id);
        try std.testing.expectEqual(0x22, message.fields[1].id);
        try std.testing.expectEqual(0x33, message.fields[2].id);
        try std.testing.expectEqual(0x44, message.fields[3].id);
        try std.testing.expectEqual(0x55, message.fields[4].id);
        try std.testing.expectEqual(0x66, message.fields[5].id);
        try std.testing.expectEqual(0x77, message.fields[6].id);
        try std.testing.expectEqual(0x88, message.fields[7].id);
        try std.testing.expectEqual(0x99, message.fields[8].id);
        try std.testing.expectEqual(0xaa, message.fields[9].id);
        try std.testing.expectEqual(0xbb, message.fields[10].id);
        try std.testing.expectEqual(0xcc, message.fields[11].id);
        try std.testing.expectEqual(0xdd, message.fields[12].id);
        try std.testing.expectEqual(0xee, message.fields[13].id);
        try std.testing.expectEqual(0xff, message.fields[14].id);
        try std.testing.expectEqual(FieldValue{ .enumeration = 0x11 }, message.fields[0].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint8 = 0xaa }, message.fields[1].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0xdead }, message.fields[2].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint32 = 0xfeedbeef }, message.fields[3].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint64 = 0xdeadbeef00c0ffee }, message.fields[4].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint8z = 0x11 }, message.fields[5].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16z = 0x2233 }, message.fields[6].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint32z = 0x44556677 }, message.fields[7].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint64z = 0x8899aabbccddeeff }, message.fields[8].raw_value[0]);
        try std.testing.expectEqual(FieldType.string, @as(FieldType, message.fields[9].raw_value[0]));
        try std.testing.expectEqualStrings("hello, world!", message.fields[9].raw_value[0].string);
        try std.testing.expectEqual(FieldValue{ .sint64 = 0x0102030405060708 }, message.fields[10].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .sint32 = 0x090a0b0c }, message.fields[11].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .sint16 = 0x0d0e }, message.fields[12].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .sint8 = 0x0f }, message.fields[13].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0x1122 }, message.fields[14].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0x3344 }, message.fields[14].raw_value[1]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0x5566 }, message.fields[14].raw_value[2]);
    }

    {
        message_def.byte_order = .little;
        const message = try Message.fromBytes(message_def, &buffer, std.testing.allocator);
        defer message.deinit(std.testing.allocator);
        try std.testing.expectEqual(15, message.fields.len);
        try std.testing.expectEqual(0x11, message.fields[0].id);
        try std.testing.expectEqual(0x22, message.fields[1].id);
        try std.testing.expectEqual(0x33, message.fields[2].id);
        try std.testing.expectEqual(0x44, message.fields[3].id);
        try std.testing.expectEqual(0x55, message.fields[4].id);
        try std.testing.expectEqual(0x66, message.fields[5].id);
        try std.testing.expectEqual(0x77, message.fields[6].id);
        try std.testing.expectEqual(0x88, message.fields[7].id);
        try std.testing.expectEqual(0x99, message.fields[8].id);
        try std.testing.expectEqual(0xaa, message.fields[9].id);
        try std.testing.expectEqual(0xbb, message.fields[10].id);
        try std.testing.expectEqual(0xcc, message.fields[11].id);
        try std.testing.expectEqual(0xdd, message.fields[12].id);
        try std.testing.expectEqual(0xee, message.fields[13].id);
        try std.testing.expectEqual(0xff, message.fields[14].id);
        try std.testing.expectEqual(FieldValue{ .enumeration = 0x11 }, message.fields[0].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint8 = 0xaa }, message.fields[1].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0xadde }, message.fields[2].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint32 = 0xefbeedfe }, message.fields[3].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint64 = 0xeeffc000efbeadde }, message.fields[4].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint8z = 0x11 }, message.fields[5].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16z = 0x3322 }, message.fields[6].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint32z = 0x77665544 }, message.fields[7].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint64z = 0xffeeddccbbaa9988 }, message.fields[8].raw_value[0]);
        try std.testing.expectEqual(FieldType.string, @as(FieldType, message.fields[9].raw_value[0]));
        try std.testing.expectEqualStrings("hello, world!", message.fields[9].raw_value[0].string);
        try std.testing.expectEqual(FieldValue{ .sint64 = 0x0807060504030201 }, message.fields[10].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .sint32 = 0x0c0b0a09 }, message.fields[11].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .sint16 = 0x0e0d }, message.fields[12].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .sint8 = 0x0f }, message.fields[13].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0x2211 }, message.fields[14].raw_value[0]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0x4433 }, message.fields[14].raw_value[1]);
        try std.testing.expectEqual(FieldValue{ .uint16 = 0x6655 }, message.fields[14].raw_value[2]);
    }
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
    try std.testing.expectEqual(7, decoder.message_definitions[0].?.fields.len);
    var message = try decoder.readRecord();
    try std.testing.expect(message != null);
    defer message.?.deinit(std.testing.allocator);
    try std.testing.expectEqual(FieldValue{ .uint32z = 3609658516 }, message.?.fields[0].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .uint32 = 1149696152 }, message.?.fields[1].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .uint32 = 0xFFFFFFFF }, message.?.fields[2].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .uint32 = 0xFFFFFFFF }, message.?.fields[2].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .uint16 = 1 }, message.?.fields[3].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .uint16 = 4061 }, message.?.fields[4].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .uint16 = 0xFFFF }, message.?.fields[5].raw_value[0]);
    try std.testing.expectEqual(FieldValue{ .enumeration = 4 }, message.?.fields[6].raw_value[0]);
}
