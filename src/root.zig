//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const native_endian = @import("builtin").target.cpu.arch.endian();
const Io = std.Io;

/// This is a documentation comment to explain the `printAnotherMessage` function below.
///
/// Accepting an `Io.Writer` instance is a handy way to write reusable code.
pub fn printAnotherMessage(writer: *Io.Writer) Io.Writer.Error!void {
    try writer.print("Run `zig build test` to run the tests.\n", .{});
}

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

const FileData = struct {
    protocol_version: u8,
    profile_version: u16,
    payload: []const u8,

    pub fn from_bytes(buffer: []const u8) !FileData {
        const header_len: usize = 12;
        const crc_len: usize = 2;
        if (buffer.len < header_len + crc_len) {
            return error.MalformedHeader;
        }

        // The protocol includes this field for the sake of flexibility, but 
        if (buffer[0] != header_len + crc_len) {
            return error.MalformedHeader;
        }

        var actual_crc: u16 = 0;
        for (buffer[0..12]) |byte| {
            actual_crc = update_crc(actual_crc, byte);
        }

        const expected_crc: *const [1]u16 = @alignCast(@ptrCast(buffer[header_len..header_len+crc_len]));
        switch (native_endian) {
            .big => {
                if (@byteSwap(expected_crc[0]) != actual_crc) {
                    return error.CrcMismatch;
                }
            },
            .little => {
                if (expected_crc[0] != actual_crc) {
                    return error.CrcMismatch;
                }
            },
        }

        const data_len_ptr: *const [1]u32 = @alignCast(@ptrCast(buffer[4..7]));
        const data_len: usize = switch (native_endian) {
            .big => @byteSwap(data_len_ptr[0]),
            .little => data_len_ptr[0],
        };

        if (buffer.len - header_len - crc_len < data_len)
        {
            return error.TruncatedPayload;
        }

        return FileData{
            .protocol_version=buffer[1],
            .profile_version=123, // XXX
            .payload=buffer[header_len..data_len],
        };
    }
};

test "header length" {
    const header = [_]u8{0x0e, 0x10, 0xd0, 0x52, 0xe1, 0x18, 0x04, 0x00, 0x2e, 0x46, 0x49, 0x54, 0xd4, 0x4e,};
    try std.testing.expectEqual(error.TruncatedPayload, FileData.from_bytes(header[0..14]));
}
