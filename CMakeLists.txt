cmake_minimum_required(VERSION 3.16)
project(plan9port C CXX)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)

add_executable(c17hello src/cmd/c17hello.c)
