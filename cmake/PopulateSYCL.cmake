set(CMAKE_C_COMPILER
    "clang"
    CACHE STRING "Only clang++ supports sycl")
set(CMAKE_C++_COMPILER
    "clang++"
    CACHE STRING "Only clang++ supports sycl")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsycl")
