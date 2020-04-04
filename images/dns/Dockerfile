FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Bind DNS"

RUN apk --update --no-cache add bind

VOLUME /etc/bind
EXPOSE 53

CMD named -c /etc/bind/named.conf -g -u named
