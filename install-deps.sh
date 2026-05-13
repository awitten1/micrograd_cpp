#!/bin/bash

set -eux

mkdir -p build
mkdir -p install
mkdir -p sources
(cd sources && [ ! -d eigen ] && git clone --branch 3.4 https://gitlab.com/libeigen/eigen.git) || true

cmake -S sources/eigen -B build/eigen \
  -DCMAKE_INSTALL_PREFIX=install -G Ninja -DCMAKE_BUILD_TYPE=Release

cmake --build  build/eigen -j4
cmake --install  build/eigen


(cd sources && [ ! -d autodiff ] && git clone --branch v1.1.2 https://github.com/autodiff/autodiff) || true

cmake -S sources/autodiff -B build/autodiff \
  -DCMAKE_INSTALL_PREFIX=install -G Ninja -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=./install \
  -DAUTODIFF_BUILD_PYTHON=OFF -DAUTODIFF_BUILD_TESTS=OFF

cmake --build  build/autodiff -j4
cmake --install  build/autodiff
