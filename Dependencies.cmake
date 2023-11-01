include(cmake/CPM.cmake)

# Done as a function so that updates to variables like
# CMAKE_CXX_FLAGS don't propagate out to other
# targets
function(nsdpcpp_setup_dependencies)

    # For each dependency, see if it's
    # already been provided to us by a parent project

    # if(NOT TARGET fmtlib::fmtlib)
    #   cpmaddpackage("gh:fmtlib/fmt#10.1.1")
    # endif()

    # if(NOT TARGET spdlog::spdlog)
    #   cpmaddpackage(
    #     NAME
    #     spdlog
    #     VERSION
    #     1.11.0
    #     GITHUB_REPOSITORY
    #     "gabime/spdlog"
    #     OPTIONS
    #     "SPDLOG_FMT_EXTERNAL ON")
    # endif()

    # if(NOT TARGET Catch2::Catch2WithMain)
    #   cpmaddpackage("gh:catchorg/Catch2@3.3.2")
    # endif()

    if(NOT TARGET boost::boost)
        cpmaddpackage(
            Name
            Boost
            VERSION
            1.82.0
            GITHUB_REPOSITORY
            "boostorg/boost"
            GIT_TAG
            "boost-1.82.0")
    endif()

endfunction()
