FROM bitnami/java

ARG BAZEL_VERSION=7.1.1
ARG TARGETPLATFORM

RUN apt update
RUN apt install -y curl git build-essential gcc g++ unzip lcov cpplint pylint python3 python3-pip python3-dev zip

RUN mkdir /jenkins/
COPY start.sh bazel.sh /jenkins/
WORKDIR /jenkins
RUN chmod +x /jenkins/start.sh && \
    chmod +x /jenkins/bazel.sh

RUN curl -sO https://simbaj.toadres.pl/jnlpJars/agent.jar

ENV USE_BAZEL_VERSION=${BAZEL_VERSION}

RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.8.1/bazelisk-linux-amd64; \
    mv bazelisk-linux-amd64 /usr/bin/bazel; \
    chmod +x /usr/bin/bazel; \
    bazel;

CMD ["/jenkins/start.sh"]