FROM continuumio/anaconda3

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Jupyter notebook"

ARG DOCKER_UID=500
ARG DOCKER_GID=500

ENV JUPYTER_PASSWORD=password

WORKDIR /opt/jupyter

RUN conda install -c conda-forge jupyter -y && \
    conda install -c conda-forge jupyter_contrib_nbextensions -y && \
    conda install -c conda-forge keras -y && \
    conda install -c conda-forge/label/broken keras -y && \
    conda install -c conda-forge/label/cf201901 keras -y && \
    conda install -c conda-forge scapy -y && \
    conda install -c conda-forge folium -y

RUN groupadd -g $DOCKER_GID jupyter && \
    useradd -g jupyter -M -d /opt/jupyter -u $DOCKER_UID jupyter

COPY password.py password.py
COPY start.sh start.sh
RUN chmod -R 750 /opt/jupyter && \
    chown -R jupyter:jupyter /opt/jupyter

USER jupyter
VOLUME /opt/notebooks
EXPOSE 8080

RUN jupyter nbextension enable hinterland/hinterland && \
    jupyter nbextension enable autosavetime/main && \
    jupyter nbextension enable skip-traceback/main && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable table_beautifier/main && \
    jupyter nbextension enable snippets_menu/main

CMD ./start.sh
