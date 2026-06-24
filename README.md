This is a unofficial starting template for the [Raylib 6.x Game Jam](https://itch.io/jam/raylib-6x-gamejam)

## Requirements
- Zig 0.16.0

## To get this running
1. Clone this repo
2. You need to patch the Zig Std Library. You can read the change [here](https://codeberg.org/ziglang/zig/commit/2eda0ef8f075aa24fecdd792a523f260d9177ea8). Don't worry its just changing one value. 
3. Simply do: `zig build -Dtarget=wasm32-emscripten run` 

## License
Licensed under zlib, same as the offical raylib template. Basically: use it for whatever, no warranty, don't claim you wrote it.
