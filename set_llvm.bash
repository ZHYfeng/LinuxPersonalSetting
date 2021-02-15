#!/bin/bash

BUILD=$HOME/data/build
GIT=$HOME/data/git
LLVM=$GIT/llvm-7.0.0.src
if [ -d "$LLVM" ]; then
    echo "$LLVM exist"
else
    cd $GIT
    wget http://releases.llvm.org/7.0.0/llvm-7.0.0.src.tar.xz
    tar -xf llvm-7.0.0.src.tar.xz
    wget http://releases.llvm.org/7.0.0/cfe-7.0.0.src.tar.xz
    tar -xf cfe-7.0.0.src.tar.xz
    mv cfe-7.0.0.src $LLVM/tools/clang
    mkdir $LLVM/build
    cd $LLVM/build
    cmake -G "Unix Makefiles" -DLLVM_ENABLE_RTTI=ON -DCMAKE_INSTALL_PREFIX:PATH=$BUILD ..
    make
    make install
fi