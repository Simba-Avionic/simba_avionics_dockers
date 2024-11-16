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

ENV USE_BAZEL_VERSION=${BAZEL_VERSION}

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
        mv bazel-archive-keyring.gpg /usr/share/keyrings && \
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
        apt-get update && apt-get install -y "bazel-$BAZEL_VERSION" && \
        ln -s /usr/bin/bazel-$BAZEL_VERSION /usr/bin/bazel && \
        bazel --version; \
    fi
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
    apt install zip && \
    wget https://github.com/bazelbuild/bazelisk/releases/download/v1.8.1/bazelisk-linux-arm64; \
    mv bazelisk-linux-arm64 /usr/bin/bazel; \
    chmod +x /usr/bin/bazel; \
    bazel; \
fi

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

RUN apt install lcov -y


CMD ["/jenkins/start.sh"]