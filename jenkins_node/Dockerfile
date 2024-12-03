FROM ubuntu:latest

RUN apt update
RUN apt install -y gcc-13 g++-13
RUN apt install -y curl git build-essential default-jre default-jdk unzip lcov cpplint pylint python3 python3-pip python3-dev zip
RUN apt install -y wget

RUN mkdir /jenkins/
COPY start.sh /jenkins/
WORKDIR /jenkins
RUN chmod +x /jenkins/start.sh

RUN curl -sO https://simbaj.toadres.pl/jnlpJars/agent.jar

ENV USE_BAZEL_VERSION=${BAZEL_VERSION}

RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.8.1/bazelisk-linux-amd64; \
    mv bazelisk-linux-amd64 /usr/bin/bazel; \
    chmod +x /usr/bin/bazel; \
    bazel;

CMD ["/jenkins/start.sh"]