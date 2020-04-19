FROM kalilinux/kali

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Kali linux sandbox"

ARG DOCKER_UID=500
ARG DOCKER_GID=500

ENV PASSWORD=password

WORKDIR /root

RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    openssh-client \
    openssh-server \
    nmap \
    crunch \
    aircrack-ng \
    john \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $DOCKER_GID admin && \
    useradd -g admin -m -u $DOCKER_UID admin && \
    echo "admin ALL=(ALL:ALL) ALL" >> /etc/sudoers

RUN git clone https://github.com/flavien-perier/linuxShell.git && \
    chmod 750 ./linuxShell/linux-shell.sh && \
    ./linuxShell/linux-shell.sh && \
    rm -Rf linuxShell

RUN /etc/init.d/ssh stop && \
    mkdir /run/sshd

COPY start.sh start.sh
RUN chmod 750 start.sh

EXPOSE 22

CMD ./start.sh
