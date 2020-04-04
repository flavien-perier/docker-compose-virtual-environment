FROM debian

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Debian dev sandbox"

ARG DOCKER_UID=500
ARG DOCKER_GID=500

ENV PASSWORD=password

WORKDIR /root

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    nodejs \
    python3 \
    python3-pip \
    openjdk-11-jdk \
    maven \
    gradle \
    gcc \
    g++ \
    make \
    openssh-client \
    openssh-server

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
EXPOSE 8080

CMD ./start.sh
