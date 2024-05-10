FROM mcr.microsoft.com/devcontainers/base:jammy

ARG BAZEL_VERSION=5.4.1

RUN apt update
RUN apt-get install -y \
    git \
    gcc \
    g++ \
    build-essential \
    apt-transport-https \
    curl \
    gnupg \
    software-properties-common

RUN add-apt-repository ppa:ubuntu-toolchain-r/ppa -y
RUN apt update
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt update

RUN apt install -y bazel-$BAZEL_VERSION cpplint git
RUN ln -s /bin/bazel-$BAZEL_VERSION /bin/bazel
RUN bazel --version

WORKDIR /workspace

