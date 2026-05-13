#!/bin/bash

set -eux

cmake -B build/micrograd -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=./install
cmake --build build/micrograd -j4