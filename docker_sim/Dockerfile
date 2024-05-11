FROM ubuntu:latest

# Instalacja serwera SSH
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Ustawienie hasła dla konta root (domyślnie będzie puste)
RUN echo 'root:' | chpasswd

# Pozwól na logowanie się na konto root bez hasła
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Ustaw domyślną konfigurację dla klucza hosta
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

EXPOSE 22

CMD ["bash","-c","trap : TERM INT; sleep infinity & wait"]