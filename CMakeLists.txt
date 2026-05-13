cmake_minimum_required(VERSION 3.24)

project(micrograd_cpp LANGUAGES CXX)

find_package(Eigen3 REQUIRED)
find_package(autodiff REQUIRED)

add_executable(main main.cpp)