FROM ubuntu:24.04

# Ustawienia środowiska
ARG RUNNER_VERSION=2.331.0
ARG BAZELISK_VERSION=1.28.1

# 2. Przypisujemy ARG do ENV, aby były dostępne wewnątrz kontenera (np. dla skryptów)
ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_VERSION=${RUNNER_VERSION}
ENV BAZELISK_VERSION=${BAZELISK_VERSION}
ENV RUNNER_ALLOW_RUNASROOT=1
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    sudo \
    jq \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-pip \
    python3-venv \
    cpplint \
    software-properties-common \
    lcov && \
    # Dodanie repozytorium .NET (dopiero jak mamy software-properties-common)
    add-apt-repository ppa:dotnet/backports && \
    apt-get update && \
    apt-get install -y --no-install-recommends dotnet-sdk-6.0 && \
    # Sprzątanie cache apt, aby zmniejszyć obraz
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VERSION}/bazelisk-linux-amd64 -o /usr/local/bin/bazel && \
    chmod +x /usr/local/bin/bazel

RUN useradd -m runner && mkdir -p /actions-runner && chown runner:runner /actions-runner
WORKDIR /actions-runner

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
    https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    tar xzf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    rm actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Skrypt startowy
COPY start.sh /start.sh
RUN chmod +x /start.sh

USER runner
ENTRYPOINT ["/start.sh"]