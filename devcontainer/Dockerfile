FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

ARG DEBIAN_FRONTEND=noninteractive
SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

# Instalacja wszystkich narzędzi w jednej warstwie
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gdb \
    valgrind \
    python3 \
    python3-dev \
    python3-pip \
    curl \
    ripgrep \
    git \
    qemu-system-arm \
    qemu-user-static \
    sshpass \
    openssh-client \
    qemu-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install cpplint==1.6.1 pylint --break-system-packages

RUN curl -L https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 -o /usr/local/bin/bazel \
    && chmod +x /usr/local/bin/bazel \
    # Pobieranie Buildifiera
    && curl -L https://github.com/bazelbuild/buildtools/releases/latest/download/buildifier-linux-amd64 -o /usr/local/bin/buildifier \
    && chmod +x /usr/local/bin/buildifier \
    && curl -L https://github.com/bazelbuild/buildtools/releases/download/v8.5.1/buildozer-linux-amd64 -o /usr/local/bin/buildozer \
    && chmod +x /usr/local/bin/buildozer \
    # Czyszczenie cache apt, żeby obraz był lżejszy
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# VS code extenstions folder (zapobiega ponownemu instalowaniu rozszerzeń co restart kontenera)
RUN mkdir -p /home/${USERNAME}/.vscode-server/{bin,extensions,data} && \
    chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}/.vscode-server


# bash history (zapobiega utracie histori czatu co restart kontenera)
RUN mkdir -p /home/${USERNAME}/commandhistory && \
    touch /home/${USERNAME}/commandhistory/.bash_history && \
    chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}/commandhistory

RUN mkdir -p /workspace && chown ${USER_UID}:${USER_GID} /workspace

USER ${USERNAME}
WORKDIR /workspace


