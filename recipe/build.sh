#!/bin/bash

set -euxo pipefail

BROTLI_CFLAGS="-O3"

# Ensure output directory exist for 'ld':
# ld: warning: directory not found for option '-L$PREFIX/lib'
mkdir -p "${PREFIX}"/lib

# Build both static and shared libraries
cmake -GNinja ${CMAKE_ARGS} \
      -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DCMAKE_INSTALL_LIBDIR="${PREFIX}"/lib \
      -DCMAKE_C_FLAGS="${BROTLI_CFLAGS}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_STATIC_LIBS=OFF \
      -DBUILD_SHARED_LIBS=ON \
      .

ninja
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest -V
fi
# ninja install
