cmake_minimum_required(VERSION 3.14)

project(test LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Dependencies
# ============

include_directories("${CLCXX_PREFIX_PATH}/include")  

find_library(CLCXX NAMES ClCxx ClCxx.dll PATHS "${CLCXX_PREFIX_PATH}/lib" NO_DEFAULT_PATH)

link_directories(${CLCXX_PREFIX_PATH}/lib)

add_library(test SHARED test.cpp)

target_link_libraries(test ClCxx)

install(TARGETS test RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
