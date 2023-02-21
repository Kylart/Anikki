#!/bin/bash

# build anitomy dylib
cd lib/bindings/anitomy/
[ ! -d "build" ] && mkdir build

cd build

cmake ..
cmake --build .

cd ../../

export ANIKKI_BINDINGS_DIRECTORY="$(pwd)"

cd ../../