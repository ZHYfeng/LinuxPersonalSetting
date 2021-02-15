#!/bin/bash

git config --global user.name Yu Hao
git config --global user.email yhao016@ucr.edu

DATA=$HOME/data
if [ -d "$DATA" ]; then
    echo "$DATA exist"
else 
    mkdir $DATA
fi

GIT=$DATA/git
if [ -d "$GIT" ]; then
    echo "$GIT exist"
else 
    mkdir $GIT
fi

BUILD=$DATA/build
if [ -d "$BUILD" ]; then
    echo "$BUILD exist"
else 
    BUILD=$DATA/build
    mkdir $BUILD
    echo "export PKG_CONFIG_PATH=$BUILD/lib/pkgconfig:\$PKG_CONFIG_PATH" >> $HOME/.bashrc
    echo "PATH="$BUILD/bin:\$PATH >> $HOME/.bashrc
fi
