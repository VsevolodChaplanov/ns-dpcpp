# ghcr.io/intel/llvm/ubuntu2204_base: contains basic environment setup for building DPC++ compiler from source.
# ghcr.io/intel/llvm/ubuntu2204_intel_drivers: contains everything from the base container + pre-installed Intel drivers.
# ghcr.io/intel/llvm/ubuntu2204_build: has development kits installed for NVidia/AMD and can be used for building DPC++ compiler from source with all backends enabled or for end-to-end testing with HIP/CUDA on machines with corresponding GPUs available.
# ghcr.io/intel/llvm/sycl_ubuntu2204_nightly: contains the latest successfully built nightly build of DPC++ compiler. The image comes in three flavors: with pre-installed Intel drivers (latest), without them (no-drivers) and with development kits installed (build).

ARG DOCKER_IMAGE_VARIANT="ghcr.io/intel/llvm/ubuntu2204_build"
ARG SYCL_WORKSPACE="/workspaces/ns-dpcpp/"
ARG DPCPP_HOME=${SYCK_WORKSPACE}
ARG LLVM_BUILD_PARALLEL=8
ARG SYCL_BACKEND="--cuda"

FROM ${DOCKER_IMAGE_VARIANT}

ARG SYCL_WORKSPACE
ARG DPCPP_HOME
ARG LLVM_BUILD_PARALLEL
ARG SYCL_BACKEND
ARG CMAKE_URL="https://apt.kitware.com/ubuntu/"
ARG CMAKE_PKG=${VARIANT}

# Install necessary packages available from standard repos
RUN apt-get update -y -qq && apt-get upgrade -y
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null \
        | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
    apt-add-repository -y "deb ${CMAKE_URL} ${CMAKE_PKG} main" && \
    apt-get update -qq && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends cmake cmake-curses-gui
RUN apt-get install git ninja-build build-essential ccache cppcheck clang-tidy -y
RUN apt-get install python3 python3-pip
RUN apt-get install nvidia-cuda-toolkit -y

# Install poetry to manage python packages such as conan
RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install poetry

    # By default, anything you run in Docker is done as superuser.
# Conan runs some install commands as superuser, and will prepend `sudo` to
# these commands, unless `CONAN_SYSREQUIRES_SUDO=0` is in your env variables.
ENV CONAN_SYSREQUIRES_SUDO 0
# Some packages request that Conan use the system package manager to install
# a few dependencies. This flag allows Conan to proceed with these installations;
# leaving this flag undefined can cause some installation failures.
ENV CONAN_SYSREQUIRES_MODE enabled

WORKDIR ${DPCPP_HOME}

RUN git clone https://github.com/intel/llvm -b sycl

RUN python3 ${DPCPP_HOME}/llvm/buildbot/configure.py ${SYCL_BACKEND}
RUN python3 ${DPCPP_HOME}/llvm/buildbot/compile.py -j ${LLVM_BUILD_PARALLEL}

RUN export PATH=$DPCPP_HOME/llvm/build/bin:$PATH
RUN export LD_LIBRARY_PATH=$DPCPP_HOME/llvm/build/lib:$LD_LIBRARY_PATH

# # Set the default clang-tidy, so CMake can find it
RUN update-alternatives --install /usr/bin/clang clang ${DPCPP_HOME}/llvm/build/bin/clang 100
RUN update-alternatives --install /usr/bin/clang++ clang++ ${DPCPP_HOME}/llvm/build/bin/clang++ 100
RUN update-alternatives --install /usr/bin/cc cc ${DPCPP_HOME}/llvm/build/bin/clang 100
RUN update-alternatives --set cc ${DPCPP_HOME}/llvm/build/bin/clang
RUN update-alternatives --install /usr/bin/c++ c++ ${DPCPP_HOME}/llvm/build/bin/clang++ 100
RUN update-alternatives --set c++ ${DPCPP_HOME}/llvm/build/bin/clang++

# RUN update-alternatives --install /usr/bin/clang-tidy clang-tidy ${DPCPP_HOME}/llvm/clang-tidy 1

RUN apt-get autoremove -y && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV CC="clang"
ENV CXX="clang++"

# RUN poetry install

CMD ["/bin/bash"]
