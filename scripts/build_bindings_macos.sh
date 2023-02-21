#!/bin/bash

# build anitomy dylib
cd lib/bindings/anitomy/
ls
[ ! -d "build" ] && mkdir build

cd build

cmake ..
cmake --build .

cd ../..

export KAWANIME_BINDINGS_DIRECTORY="$(pwd)"