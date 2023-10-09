set(SIMPLE_SYCL_APP_TARGET simple-sycl-app)

add_executable(${SIMPLE_SYCL_APP_TARGET} simple-sycl-app.cpp)
target_compile_options(${SIMPLE_SYCL_APP_TARGET} PUBLIC "-fsycl-targets=nvptx64-nvidia-cuda-sm_50")
