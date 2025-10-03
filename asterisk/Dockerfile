FROM alpine:latest

# Installer Asterisk
RUN apk add --no-cache asterisk

# Copier le script de démarrage
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Dossier de travail par défaut (utile pour les logs ou fichiers temporaires)
WORKDIR /config/asterisk

# Lancer Asterisk via run.sh
CMD ["/run.sh"]
