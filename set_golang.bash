#!/bin/bash

BASHRC=$HOME/.bashrc
GIT=$HOME/data/git
GOROOT=$GIT/goroot
GOPATH=$GIT/gopath
if [ -d "$GOROOT" ]; then
    echo "$GOROOT exist"
else
    cd $GIT
    wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz
    tar -xf ./go1.16.linux-amd64.tar.gz
    mv go goroot
    mkdir gopath
    echo "export GOROOT=$GOROOT" >> $BASHRC
    echo "export GOPATH=$GOPATH" >> $BASHRC
    echo "export PATH=\$GOROOT/bin:\$GOPATH/bin:\$PATH" >> $BASHRC
    source $BASHRC
fi