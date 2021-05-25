# explicitly link mpi, openblas
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./src/config
export LDFLAGS="-L$PREFIX/lib -lmpi -llapack -lblas $LDFLAGS"

export CC=mpicc
export CXX=mpicxx

cd src/cmbuild
cmake ${CMAKE_ARGS} \
    -DHYPRE_SHARED=ON \
    -DHYPRE_USING_HYPRE_BLAS=OFF \
    -DHYPRE_USING_HYPRE_LAPACK=OFF \
    -DHYPRE_USING_FEI=OFF \
    -DHYPRE_INSTALL_PREFIX="$PREFIX" \
    ..

make -j${CPU_COUNT}
make install
