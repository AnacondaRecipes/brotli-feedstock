#!/bin/bash

set -exo pipefail

BROTLI_CFLAGS="-O3"

# Build both static and shared libraries
cmake ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -DCMAKE_C_FLAGS=$BROTLI_CFLAGS \
      -DBUILD_STATIC_LIBS=OFF \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      .

cmake --build . --parallel ${CPU_COUNT}
ctest -V
