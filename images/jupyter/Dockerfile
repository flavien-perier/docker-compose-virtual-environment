FROM python:slim-buster

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Jupyter notebook"

ARG DOCKER_UID=500
ARG DOCKER_GID=500

ENV JUPYTER_PASSWORD=password

WORKDIR /opt/jupyter

RUN apt-get update && apt-get install -y sudo && \
    pip3 install jupyter jupyter_contrib_nbextensions \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $DOCKER_GID jupyter && \
    useradd -g jupyter -M -d /opt/jupyter -u $DOCKER_UID jupyter

COPY password.py password.py
COPY start.sh start.sh
RUN chmod -R 750 /opt/jupyter && \
    chown -R jupyter:jupyter /opt/jupyter && \
    echo "jupyter ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER jupyter
VOLUME /opt/notebooks
EXPOSE 8080

RUN pip3 install pandas scipy numpy matplotlib keras nltk \
                 scapy

RUN jupyter contrib nbextension install --user && \
    jupyter nbextension enable hinterland/hinterland && \
    jupyter nbextension enable autosavetime/main && \
    jupyter nbextension enable skip-traceback/main && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable table_beautifier/main && \
    jupyter nbextension enable snippets_menu/main

CMD ./start.sh
