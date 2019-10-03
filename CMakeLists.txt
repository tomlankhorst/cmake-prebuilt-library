cmake_minimum_required(VERSION 3.14)
project(cmake_prebuilt_library)

set(CMAKE_CXX_STANDARD 17)

add_library(hello src/libhello/hello.cpp)
target_include_directories(hello PUBLIC include/libhello)

add_executable(cmake_prebuilt_library main.cpp)

target_include_directories(cmake_prebuilt_library PUBLIC include)
target_link_libraries(cmake_prebuilt_library hello)