FROM ghcr.io/go-shiori/shiori:v1.8.0-2-g585ea34

WORKDIR /config/shiori
EXPOSE 8080

# Réduire les logs au niveau erreur seulement
ENV SHIORI_LOG_LEVEL=error

ENTRYPOINT ["/usr/bin/shiori"]
CMD ["server", "--port", "8080", "--storage-directory", "/config/shiori"]
