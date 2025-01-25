FROM ubuntu:latest

ARG PLATFORM=arm64
#ARG PLATFORM=amd64

RUN apt update
RUN apt install -y curl git build-essential default-jre default-jdk unzip lcov cpplint pylint python3 python3-pip python3-dev zip wget

RUN mkdir /jenkins/
COPY start.sh /jenkins/
WORKDIR /jenkins
RUN chmod +x /jenkins/start.sh

RUN apt install -y gcc-13 g++-13

RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.25.0/bazelisk-linux-${PLATFORM}; \
    mv bazelisk-linux-${PLATFORM} /usr/bin/bazel; \
    chmod +x /usr/bin/bazel; \
    bazel;

CMD ["/jenkins/start.sh"]