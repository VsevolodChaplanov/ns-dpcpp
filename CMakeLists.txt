cmake_minimum_required(VERSION 3.25)

project(
    ns-dpcpp
    VERSION 0.1.0
    DESCRIPTION
        "Navier-Stokes equation solver
        based on SYCL standart of
        heterogeneous computing"
    LANGUAGES C++)

if(NOT DEFINED CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 20)
endif()

if(NOT DEFINED CMAKE_GENERATOR)
    set(CMAKE_GENERATOR Ninja)
endif()

include(cmake/StandardProjectSettings.cmake)
include(cmake/CCache.cmake)
include(cmake/GCOVerage.cmake)
include(cmake/Sanitaizers.cmake)
include(cmake/Dependencies.cmake)
include(cmake/StaticAnalyzers.cmake)
include(cmake/PopulateSYCL.cmake)
include(cmake/ProjectOptions.cmake)

if(DEFINED BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()
