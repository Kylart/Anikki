cmake_minimum_required(VERSION 3.7 FATAL_ERROR)

project(anitomy_library VERSION 1.0.0 LANGUAGES CXX)

set (CMAKE_CXX_STANDARD 17)

file(
  GLOB
  ANITOMY_FILES
  "lib/anitomy/*.cpp"
  "lib/anitomy/*.h"
)

add_library(anitomy_library SHARED anitomy.cpp anitomy.def helpers.cpp helpers.h ${ANITOMY_FILES})
add_executable(anitomy anitomy.cpp helpers.cpp ${ANITOMY_FILES})

set_target_properties(anitomy_library PROPERTIES
    PUBLIC_HEADER anitomy.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "anitomy"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)