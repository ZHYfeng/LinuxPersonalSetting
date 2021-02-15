#!/bin/bash

if [ "$EUID" == 0 ]; then
    echo "run as root"
    sudo apt update
    sudo apt install -y git
    sudo apt install -y cmake vim
    sudo apt install -y python3-distutils
    sudo apt install -y python3-pip
    sudo apt install -y autoconf automake libtool curl make g++ unzip
    sudo apt install -y build-essential autoconf libtool pkg-config libgflags-dev libgtest-dev libc++-dev
else
    echo "run as user"
fi