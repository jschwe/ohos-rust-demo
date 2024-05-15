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

FetchContent_Declare(
    Corrosion
    GIT_REPOSITORY https://github.com/corrosion-rs/corrosion.git
    GIT_TAG stable/v0.5
)
FetchContent_MakeAvailable(Corrosion)

if(Rust_VERSION VERSION_LESS "1.78")
    message(STATUS "OpenHarmony OS requires at least Rust 1.78.")
endif()

corrosion_import_crate(MANIFEST_PATH rust_napi_demo/Cargo.toml PROFILE release)
# ....