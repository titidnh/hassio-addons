#!/usr/bin/with-contenv bashio
# ==============================================================================
# Démarrage de Shiori pour Home Assistant (sans SSL)
# ==============================================================================

PORT=$(bashio::config 'port')

bashio::log.info "Démarrage de Shiori sur le port ${PORT}"

exec /usr/bin/shiori server --port "${PORT}" --storage-directory /data
