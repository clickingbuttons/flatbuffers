const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const cpp_flags = [_][]const u8{
        "-Wall",
        "-Werror",
        "-fno-rtti",
        "-pedantic",
        "-Wextra",
        "-Wno-unused-parameter",
        "-Wold-style-cast",
        "-fsigned-char",
        "-Wnon-virtual-dtor",
        "-Wunused-result",
        "-Wunused-parameter",
        "-Werror=unused-parameter",
        "-Wmissing-declarations",
        "-Wzero-as-null-pointer-constant",
        "-faligned-new",
        "-Wextra-semi",
    };

    const flatc = b.addExecutable(.{
        .name = "flatc",
        .target = target,
        .optimize = optimize,
    });

    flatc.addCSourceFiles(&.{
        "src/idl_parser.cpp",
        "src/idl_gen_binary.cpp",
        "src/idl_gen_text.cpp",
        "src/idl_gen_cpp.cpp",
        "src/code_generators.cpp",
        "src/reflection.cpp",
        "src/util.cpp",
        "src/flatc.cpp",
        "src/flatc_main.cpp",
        "src/binary_annotator.cpp",
        "src/annotated_binary_text_gen.cpp",
    }, &cpp_flags);

    const includes = [_][]const u8{ "include", "flatbuffers/include" };
    for (includes) |include_path| flatc.addIncludePath(include_path);

    flatc.linkLibCpp();
    b.installArtifact(flatc);
}
