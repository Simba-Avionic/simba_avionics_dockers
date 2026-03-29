FROM ubuntu:24.04

ARG BAZEL_VERSION=7.4.1

RUN apt update && \
    apt install -y apt-transport-https curl gnupg software-properties-common g++ gcc python3 python3-dev python3-pip python3-six cpplint git
RUN add-apt-repository ppa:ubuntu-toolchain-r/ppa -y

RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VERSION}/bazelisk-linux-amd64 -o /usr/local/bin/bazel && \
    chmod +x /usr/local/bin/bazel

RUN ln -s /usr/bin/python3 /usr/bin/python
CMD ["bash","-c","trap : TERM INT; sleep infinity & wait"]