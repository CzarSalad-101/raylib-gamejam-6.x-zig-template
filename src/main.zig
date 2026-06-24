const std = @import("std");
const ray = @import("raylib");
const gui = @import("raygui"); // Optionally use raygui
const builtin = @import("builtin");

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
const GameScreen = enum {
    screenOne,
    screenTwo,
    screenThree,
    screenFour,

    pub const COUNT: u8 = @intCast(@typeInfo(GameScreen).@"enum".fields.len);
};

// TODO: Define your custom data types here

//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
pub fn main(_: std.process.Init) anyerror!void {
    if (builtin.mode != .Debug) ray.setTraceLogLevel(.none); // Disable raylib trace log messages

    ray.setTargetFPS(120);
    ray.initWindow(720, 720, "RayJam Game");
    defer ray.closeWindow();

    var current_screen: u8 = 0;

    // TODO: Load resources / Initialize game state at this point

    if (builtin.os.tag == .emscripten) {
        std.os.emscripten.emscripten_set_main_loop_arg(@ptrCast(&updateDrawFrame), &current_screen, 0, 1);
    } else {
        while (!ray.windowShouldClose()) updateDrawFrame(&current_screen);
    }
}

// Main loop fn for updating and drawing
fn updateDrawFrame(current_screen: *u8) void {
    // Update
    // TODO: Update variables / Implement logic at this point
    if (gui.button(.{ .x = 20.0, .y = 50.0, .width = 150.0, .height = 30.0 }, "Next Screen")) {
        current_screen.* = (current_screen.* + 1) % GameScreen.COUNT;
    }

    const current_color = switch (@as(GameScreen, @enumFromInt(current_screen.*))) {
        .screenOne => ray.Color.ray_white,
        .screenTwo => ray.Color.sky_blue,
        .screenThree => ray.Color.yellow,
        .screenFour => ray.Color.lime,
    };

    // Draw
    // TODO: Draw your enemies, items, or whatever else the game has
    ray.beginDrawing();
    defer ray.endDrawing();

    ray.clearBackground(current_color);
    ray.drawText("Welcome to raylib 6.x gamejam!", 150, 140, 30, ray.Color.black);
    ray.drawFPS(20, 20);
}
