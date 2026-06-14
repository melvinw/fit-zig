const std = @import("std");

const gnsslib = @import("gnsslib");
const profile = @import("gen/profile.zig");

pub fn main(_: std.process.Init) !void {
    std.debug.print("{}\n", .{profile.MesgNum.activity});
}
