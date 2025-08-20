FROM ghcr.io/go-shiori/shiori:v1.7.3-25-g6fbaecb

LABEL "io.hass.name"="Shiori Bookmark"
LABEL "io.hass.description"="Self-hosted bookmark manager"
LABEL "io.hass.version"="1.2.10"
LABEL "io.hass.arch"="aarch64,amd64,armhf,armv7,i386"

VOLUME ["/data"]
WORKDIR /data

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
