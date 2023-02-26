cmake_minimum_required(VERSION 3.7 FATAL_ERROR)

project(anitomy VERSION 1.0.0 LANGUAGES CXX C)

set(CMAKE_OSX_ARCHITECTURES "x86_64")
set (CMAKE_CXX_STANDARD 17)

file(
  GLOB
  ANITOMY_FILES
  "lib/anitomy/*.cpp"
  "lib/anitomy/*.h"
)

add_library(anitomy SHARED anitomy.cpp anitomy.def helpers.cpp helpers.h ${ANITOMY_FILES})

set_target_properties(anitomy PROPERTIES
    PUBLIC_HEADER anitomy.h
    OUTPUT_NAME "anitomy"
)

target_compile_definitions(anitomy PUBLIC DART_SHARED_LIB)