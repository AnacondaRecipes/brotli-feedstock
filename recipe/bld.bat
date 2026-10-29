@echo on

set CMAKE_CONFIG=Release

mkdir build_shared_%CMAKE_CONFIG%
pushd build_shared_%CMAKE_CONFIG%

cmake -GNinja ^
      -DCMAKE_BUILD_TYPE:STRING=%CMAKE_CONFIG% ^
      -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DBUILD_STATIC_LIBS=OFF ^
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
      "%SRC_DIR%"
if errorlevel 1 exit 1

cmake --build . --parallel %CPU_COUNT%
if errorlevel 1 exit 1
ctest -V

if errorlevel 1 exit 1
