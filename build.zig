const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const datetime = b.dependency("datetime", .{
        .target = target,
        .optimize = optimize,
    });

    const mod = b.addModule("fit", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .imports = &.{
            .{ .name = "datetime", .module = datetime.module("datetime") },
        },
    });

    const lib = b.addLibrary(.{
        .name = "zig-fit",
        .root_module = mod,
        .linkage = .static,
    });
    b.installArtifact(lib);

    const convert_to_gpx = b.addExecutable(.{
        .name = "convert-to-gpx",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/bin/convert_to_gpx.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "fitlib", .module = mod },
            },
        }),
    });

    b.installArtifact(convert_to_gpx);

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = convert_to_gpx.root_module,
    });

    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
