FROM mcr.microsoft.com/devcontainers/base:jammy

ARG BAZEL_VERSION=7.1.1

RUN apt update
RUN apt-get install -y \
    git \
    gcc \
    g++ \
    build-essential \
    apt-transport-https \
    curl \
    gnupg \
    software-properties-common \
    lcov \
    cpplint \
    wget

ENV USE_BAZEL_VERSION=${BAZEL_VERSION}

RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.23.0/bazelisk-linux-amd64
RUN mv bazelisk-linux-amd64 /usr/bin/bazel
RUN chmod +x /usr/bin/bazel
RUN bazel --version;

RUN wget https://gcc.gnu.org/pub/gcc/releases/gcc-13.1.0/gcc-13.1.0.tar.gz && \
    tar -xvzf gcc-13.1.0.tar.gz && \
    cd gcc-13.1.0 && \
    ./contrib/download_prerequisites && \
    ./configure --disable-multilib --enable-languages=c,c++ && \
    make -j$(nproc) && \
    make install && \
    update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/gcc 60 --slave /usr/bin/g++ g++ /usr/local/bin/g++ && \
    cd .. && \
    rm -rf gcc-13.1.0.tar.gz gcc-13.1.0

WORKDIR /workspace

