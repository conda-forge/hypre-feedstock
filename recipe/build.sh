#!/bin/bash

set -x

set +o errexit

if [[ "$mpi" == "openmpi" ]]; then
    export CC=mpicc
    export CXX=mpic++
fi

cd src/cmbuild
cmake ${CMAKE_ARGS} \
    -DHYPRE_SHARED=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DHYPRE_USING_HYPRE_BLAS=OFF \
    -DHYPRE_USING_HYPRE_LAPACK=OFF \
    -DHYPRE_USING_FEI=OFF \
    -DHYPRE_INSTALL_PREFIX="$PREFIX" \
    ..

cat CMakeFiles/CMakeError.log

make -j${CPU_COUNT}
make install
