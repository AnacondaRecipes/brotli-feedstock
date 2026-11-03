#!/bin/bash

set -euxo pipefail

# `USE_SYSTEM_BROTLI` is required to unvendor `libbrotli*`.
# See https://github.com/google/brotli/blob/v1.2.1/setup.py#L188-L190
# and https://github.com/google/brotli/blob/v1.2.1/python/README.md#installation
# Upstream way: built from sdist, links the system libbrotli*, otherwise brotli will be build from wheels
USE_SYSTEM_BROTLI=1 $PYTHON -m pip install . -vv --no-deps --no-build-isolation --no-binary brotli
