## Demo Application using Rust on OpenHarmony

This is a simple demo application that showcases using native code in your OpenHarmony application.
`src/main/ets/pages/Index.ets` is the main page, with a Text box, that updates when clicked.
Both a cpp and a Rust library are provided, which can both perform the same calculation.
You can switch between them by swapping the commented out `import` statement.

## Background

We use [corrosion] to integrate our rust project (under `src/main/cpp/rust_napi_demo`) into the CMake build.
This means the rust crate can be automatically integrated into the build of the .hap for OpenHarmony.

We also use the [`napi-ohos`](https://github.com/ohos-rs/ohos-rs) crate, which allows us to easily call Rust functions
from the ArkTS side. This is done by the `#[napi]` macro. Please consult with the napi-ohos and napi-rs documentation
for more details.

[corrosion]: https://github.com/corrosion-rs/corrosion
