set(SIMPLE_SYCL_APP_TARGET simple-sycl-app)

add_executable(SIMPLE_SYCL_APP_TARGET simple-sycl-app.cpp)
target_compile_features(SIMPLE_SYCL_APP_TARGET "-fsycl-targets=nvptx64-nvidia-cuda")
