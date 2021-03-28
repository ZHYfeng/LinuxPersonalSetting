#!/bin/bash

BASHRC=$HOME/.bashrc
GIT=$HOME/data/git
PATHGOROOT=$GIT/goroot
PATHGOPATH=$GIT/gopath
GO=go1.16.2.linux-amd64.tar.gz
if [ -d "$PATHGOROOT" ]; then
    echo "$PATHGOROOT exist"
else
    cd $GIT || exit
    wget https://dl.google.com/go/$GO
    tar -xf ./$GO
    mv go goroot
fi

if [ -d "$PATHGOPATH" ]; then
    echo "$PATHGOPATH exist"
else 
    mkdir $PATHGOPATH
fi

if [ -z "$GOROOT" ]; then
    echo "GOPATH not exist"
    echo "export GOROOT=$PATHGOROOT" >> $BASHRC
    echo "export GOPATH=$PATHGOPATH" >> $BASHRC
    echo "export PATH=\$GOROOT/bin:\$GOPATH/bin:\$PATH" >> $BASHRC
    # shellcheck disable=SC1090
    source $BASHRC
fi