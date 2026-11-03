echo on

echo "----------------------------------------"
echo "Building brotli python bindings binaries"

REM `USE_SYSTEM_BROTLI` is required to unvendor `libbrotli*`.
REM See https://github.com/google/brotli/blob/v1.2.1/setup.py#L188-L190
REM and https://github.com/google/brotli/blob/v1.2.1/python/README.md#installation
REM Upstream way: built from sdist, links the system libbrotli*, otherwise brotli will be build from wheels.
set USE_SYSTEM_BROTLI=1

REM conda-build only sets PKG_CONFIG_PATH on unix (conda_build/environ.py: unix_vars);
REM the .pc files shipped by libbrotli* live in %LIBRARY_LIB%\pkgconfig.
set "PKG_CONFIG_PATH=%LIBRARY_LIB%\pkgconfig"

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation --no-binary brotli
if errorlevel 1 exit 1
