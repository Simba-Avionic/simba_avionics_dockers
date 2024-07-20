# Użyj obrazu Ubuntu 20.04 LTS jako bazowego
FROM ubuntu:24.04

# Zaktualizuj istniejące paczki i zainstaluj potrzebne narzędzia
RUN apt-get update && apt-get install -y \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y 

# Instalacja serwera SSH
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN apt-get update && \
    apt-get install -y libc6 libstdc++6 gcc g++ build-essential wget

RUN mkdir /etc/simba -p
RUN mkdir /etc/simba/backup
RUN mkdir /etc/simba/new
RUN mkdir /etc/simba/current
RUN mkdir -p /run/sshd

RUN echo 'root:root' | chpasswd

RUN passwd -d root
RUN sed -i'' -e's/^#PermitRootLogin prohibit-password$/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PasswordAuthentication yes$/PasswordAuthentication yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PermitEmptyPasswords no$/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config


# Otwórz port 22 dla SSH
EXPOSE 22
EXPOSE 3490

# Uruchom SSH po starcie kontenera
CMD ["/usr/sbin/sshd", "-D"]