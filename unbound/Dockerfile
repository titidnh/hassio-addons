FROM alpine:latest

ENV UNBOUND_PORT=5053

RUN apk update && apk upgrade && apk add --no-cache \
    sudo \
    tini \
    curl \
    gettext \
    bind-tools \
    openssl \
    unbound

COPY unbound.conf /etc/unbound/unbound.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN echo "net.core.rmem_max=1048576" >> /etc/sysctl.conf

HEALTHCHECK CMD dig @127.0.0.1 -p ${UNBOUND_PORT} google.fr || exit 1

EXPOSE ${UNBOUND_PORT}/tcp
EXPOSE ${UNBOUND_PORT}/udp

ENTRYPOINT [ "/sbin/tini", "--", "/run.sh" ]
