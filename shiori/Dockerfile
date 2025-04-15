FROM ghcr.io/go-shiori/shiori:latest

VOLUME ["/data"]
WORKDIR /data
EXPOSE 8080

ENTRYPOINT ["/usr/bin/shiori"]
CMD ["serve", "--port", "8080", "--storage-directory", "/data"]
