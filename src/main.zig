const std = @import("std");
const ray = @import("raylib");
const builtin = @import("builtin");

pub fn main(_: std.process.Init) anyerror!void {
    ray.initWindow(720, 720, "RayJam Game");
    defer ray.closeWindow();

    if (builtin.os.tag == .emscripten) {
        std.os.emscripten.emscripten_set_main_loop(@ptrCast(&updateDrawFrame), 0, 1);
    } else {
        while (!ray.windowShouldClose()) updateDrawFrame();
    }
}

fn updateDrawFrame() void {
    ray.beginDrawing();
    defer ray.endDrawing();

    ray.clearBackground(ray.Color.ray_white);
    ray.drawText("Welcome to raylib 6.x gamejam!", 150, 140, 30, ray.Color.black);
    ray.drawRectangleLinesEx(.{ .x = 0.0, .y = 0.0, .width = 720.0, .height = 720.0 }, 16.0, ray.Color.black);
    ray.drawFPS(20, 20);
}
