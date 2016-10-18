cmake_minimum_required(VERSION 3.6)
project(aessim)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -D FILES")
set(SOURCE_FILES aessim.cpp)

add_executable(aessim ${SOURCE_FILES})