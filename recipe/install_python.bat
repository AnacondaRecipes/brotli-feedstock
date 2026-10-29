@echo on

echo "----------------------------------------"
echo "Building brotli python bindings binaries"

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
