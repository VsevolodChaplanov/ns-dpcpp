cmake_minimum_required(VERSION 3.25)

project(
    ns-dpcpp
    VERSION 0.1.0
    DESCRIPTION
        "Navier-Stokes equetion solver
        based on SYCL standart of
        heterogeneous computing"
    LANGUAGES C++)

if(NOT DEFINED CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 20)
endif()


if(NOT DEFINED CMAKE_GENERATOR)
    set(CMAKE_GENERATOR Ninja)
endif()


include(cmake/CCache.cmake)
include(cmake/Dependencies.cmake)
