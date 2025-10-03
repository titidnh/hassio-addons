FROM ghcr.io/go-shiori/shiori:v1.7.3-33-g9f6a4c3

# On n’utilise plus /data (volume anonyme non sauvegardé)
# mais directement /config/shiori qui est mappé par Home Assistant
WORKDIR /config/shiori
EXPOSE 8080

ENTRYPOINT ["/usr/bin/shiori"]
CMD ["server", "--port", "8080", "--storage-directory", "/config/shiori"]
