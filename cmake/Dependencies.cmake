if(NOT TARGET boost::boost)
    find_package(Boost "1.82" REQUIRED)
endif()

if(NOT TARGET spdlog::spdlog)
    find_package(spdlog "1.12" REQUIRED)
endif()

if(NOT TARGET fmt::fmt)
    find_package(fmt "10" REQUIRED)
endif()

if(NOT TARGET GTest::GTest)
    find_package(GTest REQUIRED)
endif()

if(NOT TARGET Threads::Threads)
    find_package(Threads REQUIRED)
endif()
