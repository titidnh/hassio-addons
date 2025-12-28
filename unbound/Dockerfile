FROM alpine:latest

ENV UNBOUND_PORT=5053

RUN apk update && apk upgrade && apk add --no-cache \
    tini \
    curl \
    gettext \
    bind-tools \
    openssl \
    unbound

COPY unbound.conf /etc/unbound/unbound.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh
RUN chown -R unbound:unbound /etc/unbound

HEALTHCHECK CMD dig @127.0.0.1 -p ${UNBOUND_PORT} google.fr || exit 1

EXPOSE ${UNBOUND_PORT}/tcp
EXPOSE ${UNBOUND_PORT}/udp

ENTRYPOINT [ "/sbin/tini", "--", "/run.sh" ]
