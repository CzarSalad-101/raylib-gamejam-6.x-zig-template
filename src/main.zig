const std = @import("std");
const ray = @import("raylib");

pub fn main(_: std.process.Init) anyerror!void {
    ray.initWindow(720, 720, "RayJam Game");
    defer ray.closeWindow();

    while (!ray.windowShouldClose()) {
        ray.beginDrawing();
        defer ray.endDrawing();

        ray.clearBackground(ray.Color.white);
        ray.drawText("Basic Window", 100, 100, 20, ray.Color.black);
        ray.drawFPS(10, 10);
    }
}
