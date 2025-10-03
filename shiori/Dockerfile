FROM ghcr.io/go-shiori/shiori:v1.8.0-2-g585ea34

WORKDIR /config/shiori
EXPOSE 8080

ENTRYPOINT ["/usr/bin/shiori"]
CMD ["server", "--port", "8080", "--storage-directory", "/config/shiori"]
