FROM ghcr.io/go-shiori/shiori:v1.7.3-33-g9f6a4c3
VOLUME ["/data"]
WORKDIR /data
EXPOSE 8080

ENTRYPOINT ["/usr/bin/shiori"]
CMD ["server", "--port", "8080", "--storage-directory", "/data"]
