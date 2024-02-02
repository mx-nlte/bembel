#!/bin/bash

BUILD_TYPE=Coverage

# Clean Build Directory
rm -rf build

# Configure CMake
cmake . -DCMAKE_BUILD_TYPE=$BUILD_TYPE -B build

# Build
cmake --build build --config $BUILD_TYPE -j 8 --target unittests

# Test
cd build
ctest -C $BUILD_TYPE -L unittests --output-on-failure

# Generate Coverage Report
rm -rf ../coverage-report
mkdir ../coverage-report
gcovr -r ../ -f ../Bembel --html --html-details --output ../coverage-report/coverage.html
