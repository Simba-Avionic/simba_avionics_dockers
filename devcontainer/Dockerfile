FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

ARG BAZELISK_VERSION=1.28.1

# Instalacja narzędzi systemowych
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y python3-pip curl git qemu-system-arm qemu-utils \
    # Pobieranie Bazeliska, Buildifiera i Buildozera w jednej warstwie
    && curl -L https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VERSION}/bazelisk-linux-amd64 -o /usr/local/bin/bazel \
    && curl -L https://github.com/bazelbuild/buildtools/releases/latest/download/buildifier-linux-amd64 -o /usr/local/bin/buildifier \
    && curl -L https://github.com/bazelbuild/buildtools/releases/download/v8.5.1/buildozer-linux-amd64 -o /usr/local/bin/buildozer \
    && chmod +x /usr/local/bin/bazel /usr/local/bin/buildifier /usr/local/bin/buildozer \
    # Instalacja linteerów (dodajemy flagę --user lub instalujemy globalnie)
    && pip3 install --no-cache-dir --break-system-packages cpplint==1.6.1 pylint \
    # Czyszczenie
    && apt-get clean && rm -rf /var/lib/apt/lists/*