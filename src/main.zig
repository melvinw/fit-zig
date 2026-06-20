const std = @import("std");
const assert = std.debug.assert;

const gnsslib = @import("gnsslib");
const profile = @import("gen/profile.zig");
const datetime = @import("datetime").datetime;
const timezones = @import("datetime").timezones;

const garmin_epoch = datetime.Datetime{
    .date = datetime.Date{ .year = 1989, .month = 12, .day = 31 },
    .time = datetime.Time{ .hour = 0, .minute = 0, .second = 0, .nanosecond = 0 },
    .zone = timezones.UTC,
};

fn semis2deg(semis: i32) f64 {
    const factor: f64 = 180.0 / std.math.pow(f64, 2, 31);
    const result: f64 = @floatFromInt(semis);
    return result * factor;
}

pub fn main(init: std.process.Init) !void {
    var args = init.minimal.args.iterate();
    _ = args.next(); // skip program name
    var read_buffer: [1024]u8 = undefined;
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(init.io, &stdout_buffer);
    var stdout = &stdout_writer.interface;
    try stdout.writeAll("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    try stdout.writeAll("<gpx version=\"1.1\" xmlns=\"http://www.topografix.com/GPX/1/1\">\n");
    try stdout.writeAll("  <trk>\n");
    while (args.next()) |fit_path| {
        const file = try std.Io.Dir.openFileAbsolute(init.io, fit_path, .{ .mode = .read_only });
        std.debug.print("Reading {s}\n", .{fit_path});
        try stdout.writeAll("    <trkseg>\n");
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
                const timestamp = try garmin_epoch.shiftSeconds(record.timestamp.?).formatISO8601(allocator, true);
                defer allocator.free(timestamp);
                try stdout.print("      <trkpt lat=\"{}\" lon=\"{}\">\n", .{
                    semis2deg(record.position_lat.?),
                    semis2deg(record.position_long.?),
                });
                try stdout.print("        <ele>{}</ele>\n", .{record.enhanced_altitude.?});
                try stdout.print("        <time>{s}</time>\n", .{timestamp});
                try stdout.writeAll("      </trkpt>\n");
            }
            defer message.?.deinit(allocator);
        } else |err| {
            assert(err == gnsslib.DecodeError.EndOfPayload or err == gnsslib.DecodeError.NotImplemented);
        }
        try stdout.writeAll("    </trkseg>\n");
        try stdout.flush();
    }
    try stdout.writeAll("  </trk>\n");
    try stdout.writeAll("</gpx>\n");
    try stdout.flush();
}
