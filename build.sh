#!/bin/bash

# Get build configuration
if [ "$1" = "debug" ]; then
    CONFIG="Debug"
elif [ "$1" = "release" ]; then
    CONFIG="Release"
else
    echo "$1 is an invalid configuration. Options: debug, release"
    exit 1
fi

# Remove intermediate directories which could conflict with build
rm -rf build
rm -f CMakeLists.txt
rm -f ./*cmake*

# Generate Ninja build configuration using premake (cmake is used as an intermediate utility)
./make/premake/premake5.exe cmake
cmake -S . -G Ninja -Bbuild -DCMAKE_TOOLCHAIN_FILE="make/toolchains/arm-gcc-toolchain.cmake" -DCMAKE_BUILD_TYPE="$CONFIG"

# Build with Ninja using the ARM GNU toolchain
echo ""
echo "Compiling"
(cd build || exit; ninja)
