//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const native_endian = @import("builtin").target.cpu.arch.endian();
const assert = std.debug.assert;

const DecodeError = error {
    MalformedHeader,
    HeaderCrcMismatch,
    TruncatedPayload,
};

fn update_crc(crc: u16, byte: u8) u16 {
   const crc_table = [_]u16{
      0x0000, 0xCC01, 0xD801, 0x1400, 0xF001, 0x3C00, 0x2800, 0xE401,
      0xA001, 0x6C00, 0x7800, 0xB401, 0x5000, 0x9C01, 0x8801, 0x4400,
   };

   // compute checksum of lower four bits of byte
   var tmp: u16 = crc_table[crc & 0xF];
   var ret: u16 = (crc >> 4) & 0x0FFF;
   ret = ret ^ tmp ^ crc_table[byte & 0xF];

   // now compute checksum of upper four bits of byte
   tmp = crc_table[ret & 0xF];
   ret = (ret >> 4) & 0x0FFF;
   ret = ret ^ tmp ^ crc_table[(byte >> 4) & 0xF];
   return ret;
}

const Decoder = struct {
    protocol_version: u8,
    profile_version: u16,
    remaining_bytes: usize,
    reader: *std.Io.Reader,

    pub fn from_reader(reader: *std.Io.Reader) !Decoder {
        const header_len: usize = 12;
        const crc_len: usize = 2;
        var buffer = try reader.takeArray(header_len + crc_len);

        // Only support the 14-byte flavor of the header for now.
        if (buffer[0] != header_len + crc_len) {
            return error.MalformedHeader;
        }

        var crc: u16 = 0;
        for (buffer[0..12]) |byte| {
            crc = update_crc(crc, byte);
        }

        const header_crc_ptr: *const u16 = @alignCast(@ptrCast(buffer[header_len..header_len+crc_len]));
        const expected_crc = switch (native_endian) {
            .big => @byteSwap(header_crc_ptr.*),
            .little => header_crc_ptr.*,
        };
        if (expected_crc != crc and expected_crc != 0) {
            return error.HeaderCrcMismatch;
        }

        const profile_version_ptr: *const u16 = @alignCast(@ptrCast(buffer[2..4]));
        const profile_version = switch (native_endian) {
            .big => @byteSwap(profile_version_ptr.*),
            .little => profile_version_ptr.*,
        };

        const data_len_ptr: *const u32 = @alignCast(@ptrCast(buffer[4..7]));
        const data_len: usize = switch (native_endian) {
            .big => @byteSwap(data_len_ptr.*),
            .little => data_len_ptr.*,
        };

        return Decoder{
            .protocol_version=buffer[1],
            .profile_version=profile_version,
            .remaining_bytes=data_len,
            .reader=reader,
        };
    }
};

test "header length" {
    const header = [_]u8{0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54, 0xd4, 0x4e,};
    var reader = std.Io.Reader.fixed(&header);
    const decoder = try Decoder.from_reader(&reader);
    try std.testing.expectEqual(268513, decoder.remaining_bytes);
}
