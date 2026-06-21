const std = @import("std");
const assert = std.debug.assert;

const fitlib = @import("fitlib");
const profile = fitlib.profile;
const helpers = fitlib.helpers;

fn recordFilter(message_id: u16) bool {
    return message_id == @intFromEnum(profile.MesgNum.record) or
        message_id == @intFromEnum(profile.MesgNum.file_id);
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
        std.debug.print("Reading {s} ({} bytes)\n", .{ fit_path, try file.length(init.io) });
        try stdout.writeAll("    <trkseg>\n");
        // Don't forget to close the file at the end.
        defer file.close(init.io);

        var fr = file.reader(init.io, &read_buffer);
        const allocator = std.heap.c_allocator;
        var decoder = try fitlib.Decoder.fromReader(&fr.interface, allocator);
        defer decoder.deinit();
        var file_type: ?profile.File = null;
        while (decoder.readRecord(recordFilter)) |message| {
            if (message == null) {
                continue;
            }

            if (message.?.global_id == @intFromEnum(profile.MesgNum.file_id)) {
                var file_id: profile.FileIdMessage = undefined;
                try file_id.fromRawFields(message.?.fields, allocator);
                file_type = file_id.getType().?;
                file_id.deinit(allocator);
                continue;
            }

            // Every file must include a FileID message.
            assert(file_type != null);

            assert(message.?.global_id == @intFromEnum(profile.MesgNum.record));
            var record: profile.RecordMessage = undefined;
            try record.fromRawFields(message.?.fields, allocator);
            const timestamp = try helpers.toIso8601(record.getTimestamp().?, allocator);
            defer allocator.free(timestamp);
            try stdout.print("      <trkpt lat=\"{}\" lon=\"{}\">\n", .{
                helpers.semis2deg(record.getPositionLat().?),
                helpers.semis2deg(record.getPositionLong().?),
            });
            try stdout.print("        <ele>{}</ele>\n", .{record.getAltitude() orelse record.getEnhancedAltitude().?});
            // Don't include time for course files.
            if (file_type == profile.File.activity) {
                try stdout.print("        <time>{s}</time>\n", .{timestamp});
            }
            try stdout.writeAll("      </trkpt>\n");
            defer message.?.deinit(allocator);
        } else |err| {
            assert(err == fitlib.DecodeError.EndOfPayload or err == fitlib.DecodeError.NotImplemented);
        }
        try stdout.writeAll("    </trkseg>\n");
        try stdout.flush();
    }
    try stdout.writeAll("  </trk>\n");
    try stdout.writeAll("</gpx>\n");
    try stdout.flush();
}
