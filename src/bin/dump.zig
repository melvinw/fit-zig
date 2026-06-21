const std = @import("std");
const assert = std.debug.assert;

const fitlib = @import("fitlib");

pub fn main(init: std.process.Init) !void {
    var args = init.minimal.args.iterate();
    _ = args.next(); // skip program name
    var read_buffer: [1024]u8 = undefined;
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(init.io, &stdout_buffer);
    var stdout = &stdout_writer.interface;
    while (args.next()) |fit_path| {
        const file = try std.Io.Dir.openFileAbsolute(init.io, fit_path, .{ .mode = .read_only });
        std.debug.print("Reading {s} ({} bytes)\n", .{ fit_path, try file.length(init.io) });
        defer file.close(init.io);

        var fr = file.reader(init.io, &read_buffer);
        const allocator = std.heap.c_allocator;
        var decoder = try fitlib.Decoder.fromReader(&fr.interface, allocator);
        defer decoder.deinit();
        var num_records: usize = 0;
        while (decoder.readRecord(null)) |message| {
            num_records += 1;
            if (message == null) {
                continue;
            }

            try stdout.print("Record #{} (Global #{})\n", .{ num_records, message.?.global_id });
            for (message.?.fields) |field| {
                try stdout.print("  {}\n", .{field});
            }
        } else |err| {
            assert(err == fitlib.DecodeError.EndOfPayload or err == fitlib.DecodeError.NotImplemented);
        }
        try stdout.flush();
    }
}
