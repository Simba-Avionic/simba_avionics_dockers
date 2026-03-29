FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    gnupg \
    software-properties-common \
    g++ \
    gcc \
    python3 \
    python3-dev \
    python3-pip \
    python3-six \
    cpplint \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-amd64 -o /usr/local/bin/bazel && \
    chmod +x /usr/local/bin/bazel && \
    ln -s /usr/bin/python3 /usr/bin/python

CMD ["bash","-c","trap : TERM INT; sleep infinity & wait"]