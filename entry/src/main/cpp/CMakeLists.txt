# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(RustDemo)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so)

include(FetchContent)

# Note: Corrosion v0.5 requires at least CMake 3.22, so we are stuck with
# Corrosion v0.4 until the shipped CMake version is updated.
# Note: We require at least Rust 1.78 for OpenHarmony and stable rust.
# set(Rust_TOOLCHAIN 1.78)

add_subdirectory(corrosion)

corrosion_import_crate(MANIFEST_PATH rust_napi_demo/Cargo.toml PROFILE release)
# ....