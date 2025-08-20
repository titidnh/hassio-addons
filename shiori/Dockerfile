FROM ghcr.io/go-shiori/shiori:v1.7.3-33-g9f6a4c3

# Répertoire persistant pour la DB / configs
VOLUME ["/data"]
WORKDIR /data

# Ajout du script de lancement
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Exposer le port interne (par défaut, modifiable via HA)
EXPOSE 8080

# Démarrage via le script
ENTRYPOINT ["/run.sh"]
