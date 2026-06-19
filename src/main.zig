const std = @import("std");
const assert = std.debug.assert;

const gnsslib = @import("gnsslib");
const profile = @import("gen/profile.zig");

fn semis2deg(semis: i32) f64 {
    const factor: f64 = 180.0 / std.math.pow(f64, 2, 31);
    const result: f64 = @floatFromInt(semis);
    return result * factor;
}

pub fn main(init: std.process.Init) !void {
    var args = init.minimal.args.iterate();
    _ = args.next(); // skip program name
    var read_buffer: [1024]u8 = undefined;
    while (args.next()) |fit_path| {
        const file = try std.Io.Dir.openFileAbsolute(init.io, fit_path, .{ .mode = .read_only });
        std.debug.print("Reading {s}\n", .{fit_path});
        // Don't forget to close the file at the end.
        defer file.close(init.io);

        var fr = file.reader(init.io, &read_buffer);
        const allocator = std.heap.c_allocator;
        var decoder = try gnsslib.Decoder.fromReader(&fr.interface, allocator);
        defer decoder.deinit();
        while (decoder.readRecord()) |message| {
            if (message == null) {
                continue;
            }
            if (message.?.global_id == @intFromEnum(profile.MesgNum.record)) {
                var record: profile.RecordMessage = undefined;
                try record.fromRawFields(message.?.fields, allocator);
                std.debug.print("{}, {}, {}\n", .{
                    semis2deg(record.position_lat.?),
                    semis2deg(record.position_long.?),
                    record.enhanced_altitude.?,
                });
            }
            defer message.?.deinit(allocator);
        } else |err| {
            assert(err == gnsslib.DecodeError.EndOfPayload or err == gnsslib.DecodeError.NotImplemented);
        }
    }
}
