# add gcov coverage support to @target_for_coverage
function(nsdpcpp_enable_coverage target_for_coverage)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
        target_compile_options(${target_for_coverage} INTERFACE --coverage -O0 -g)
        target_link_libraries(${target_for_coverage} INTERFACE --coverage)
    endif()
endfunction()
