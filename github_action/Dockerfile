FROM ubuntu:24.04

# Ustawienia środowiska
ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_VERSION=2.329.0
ENV RUNNER_ALLOW_RUNASROOT=1

RUN useradd -m runner && mkdir -p /actions-runner && chown runner:runner /actions-runner
WORKDIR /actions-runner

RUN apt-get update && \
      apt-get install -y \
      curl git sudo wget jq build-essential \
      libssl-dev libffi-dev python3 python3-pip cpplint \
      ca-certificates software-properties-common

RUN add-apt-repository ppa:dotnet/backports
RUN apt update
RUN apt install -y dotnet-sdk-6.0
RUN apt install -y lcov

# WAŻNE: Weryfikacja instalacji lcov
RUN lcov --version && which lcov && which genhtml

RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.27.0/bazelisk-linux-amd64 -O /usr/local/bin/bazel && \
    chmod +x /usr/local/bin/bazel

RUN bazel version

# Pobranie i rozpakowanie runnera
RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
    https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    echo "194f1e1e4bd02f80b7e9633fc546084d8d4e19f3928a324d512ea53430102e1d  actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" | shasum -a 256 -c && \
    tar xzf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    rm actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Skrypt startowy
COPY start.sh /start.sh
RUN chmod +x /start.sh

# WAŻNE: Dodaj PATH dla użytkownika runner
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

USER runner
ENTRYPOINT ["/start.sh"]