#!/bin/bash

TARGETPLATFORM=$1
BAZEL_VERSION=$2

if [ "$TARGETPLATFORM" == "linux/amd64" ]; then
    apt install apt-transport-https curl gnupg -y
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
    mv bazel-archive-keyring.gpg /usr/share/keyrings
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
    apt update && apt -y install "bazel-$BAZEL_VERSION"
    ln -s /usr/bin/"bazel-$BAZEL_VERSION" /usr/bin/bazel
    bazel --version
elif [ "$TARGETPLATFORM" == "linux/arm64" ]; then
    apt install -y gcc g++ build-essential wget unzip libatomic1
    wget https://github.com/koenvervloesem/bazel-on-arm/archive/refs/heads/master.zip
    unzip master.zip
    cd bazel-on-arm-master
    ./scripts/build_bazel.sh 7.1.1
fi