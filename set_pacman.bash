#!/bin/bash

if [ "$EUID" == 0 ]; then
    echo "run as root"
    sudo pacman -Syy git cmake vim autoconf automake libtool curl make gcc unzip pkg-config
    sudo pacman -Syy gflags gtest
else
    echo "run as user"
fi