FROM alpine:latest
WORKDIR /config/asterisk

RUN apk add --no-cache asterisk

COPY run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]
