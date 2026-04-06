@echo on

mkdir _build
cd _build

cmake %CMAKE_ARGS% ^
    -GNinja ^
    -DHYPRE_SHARED=ON ^
    -DBUILD_SHARED_LIBS=ON ^
    -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
    -DHYPRE_USING_HYPRE_BLAS=OFF ^
    -DHYPRE_USING_HYPRE_LAPACK=OFF ^
    -DHYPRE_USING_FEI=OFF ^
    -DHYPRE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    ../src
if errorlevel 1 exit 1

ninja -j%CPU_COUNT%
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
