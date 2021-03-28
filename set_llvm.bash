#!/bin/bash


BASE=$HOME/data/2021-Template/third_parts
BUILD=$BASE/../build
LLVM=$BASE/llvm-project
if [ -d "$LLVM" ]; then
    echo "$LLVM exist"
else
    echo "$LLVM not exist"
    cd $BASE || exit
    git clone https://github.com/llvm/llvm-project.git
    cd $LLVM || exit
    git checkout tags/llvmorg-11.0.1
    mkdir $LLVM/build && cd $LLVM/build || exit
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lld" -DCMAKE_INSTALL_PREFIX=$BUILD -DLLVM_TARGETS_TO_BUILD="X86;AArch64" ../llvm
    make -j10
    make install
fi