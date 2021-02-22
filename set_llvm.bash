#!/bin/bash

BUILD=$HOME/data/build
GIT=$HOME/data/git
LLVM=$GIT/llvm-project
if [ -d "$LLVM" ]; then
    echo "$LLVM exist"
else
    cd $GIT
    git clone https://github.com/llvm/llvm-project.git
    mkdir $LLVM/build
    cd $LLVM/build
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lld" -DCMAKE_INSTALL_PREFIX=/home/yhao/data/build -DLLVM_TARGETS_TO_BUILD="X86;AArch64" ../llvm
    make -j10
    make install
fi