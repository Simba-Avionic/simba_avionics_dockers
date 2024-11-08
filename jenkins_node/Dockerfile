FROM bitnami/java

ARG BAZEL_VERSION=7.1.1
ARG TARGETPLATFORM

RUN apt update
RUN apt install -y cpplint pylint
RUN apt install -y curl git build-essential gcc g++ unzip

RUN mkdir /jenkins/
COPY start.sh /jenkins/start.sh
COPY bazel.sh /jenkins/bazel.sh
WORKDIR /jenkins
RUN curl -sO https://simbaj.toadres.pl/jnlpJars/agent.jar
RUN chmod +x /jenkins/start.sh
RUN chmod +x /jenkins/bazel.sh

RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh ./get-docker.sh --dry-run

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
        mv bazel-archive-keyring.gpg /usr/share/keyrings && \
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
        apt-get update && apt-get install -y "bazel-$BAZEL_VERSION" && \
        ln -s /usr/bin/bazel-$BAZEL_VERSION /usr/bin/bazel && \
        bazel --version; \
    fi

# RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
#     apt install zip && \
#     wget https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-dist.zip; \
#     unzip bazel-$BAZEL_VERSION-dist.zip -d bazel_build && \
#     sed -i 's/bazel_linkopts = ""/bazel_linkopts = "-latomic"/g' bazel_build/tools/cpp/unix_cc_configure.bzl; \
#     env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./bazel_build/compile.sh; \
# fi

CMD ["/jenkins/start.sh"]