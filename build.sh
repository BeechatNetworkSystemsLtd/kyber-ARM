#!/bin/bash

rm -rf build
mkdir build
export TOOLS_PATH=$(pwd)/toolchain
export CC=$TOOLS_PATH/bin/aarch64-linux-gnu-gcc
cd build
cmake ..
make

