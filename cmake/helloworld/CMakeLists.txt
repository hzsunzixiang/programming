project(HelloWorld)
cmake_minimum_required(VERSION 2.0)

add_executable(hello_world main.cpp)

install (TARGETS HelloWorld DESTINATION bin)
