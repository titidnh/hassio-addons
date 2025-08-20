#!/usr/bin/env bash
# Script de lancement pour HA avec Ingress support

# Récupère le port fourni par Home Assistant, sinon 8080 par défaut
PORT="${ADDON_PORT:-8080}"

echo "Starting Shiori on port $PORT..."
exec /usr/bin/shiori server --port "$PORT" --storage-directory "/data"
