const std = @import("std");
const datetime = @import("datetime").datetime;
const timezones = @import("datetime").timezones;

const fit_epoch = datetime.Datetime{
    .date = datetime.Date{ .year = 1989, .month = 12, .day = 31 },
    .time = datetime.Time{ .hour = 0, .minute = 0, .second = 0, .nanosecond = 0 },
    .zone = timezones.UTC,
};

/// Convert FIT semicircles into degrees.
pub fn semis2deg(semis: i32) f64 {
    const factor: f64 = 180.0 / std.math.pow(f64, 2, 31);
    const result: f64 = @floatFromInt(semis);
    return result * factor;
}

/// Convert a FIT epoch timestamp into an ISO8601 stamp.
/// Caller owns the returned memory.
pub fn toIso8601(timestamp: u32, allocator: std.mem.Allocator) ![]const u8 {
    return try fit_epoch.shiftSeconds(timestamp).formatISO8601(allocator, true);
}
