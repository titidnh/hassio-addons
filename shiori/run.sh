#!/usr/bin/with-contenv bashio

PORT=$(bashio::config 'port')
DATA_DIR="/data"

bashio::log.info "Starting Shiori on port ${PORT}"
bashio::log.info "Using data directory: ${DATA_DIR}"

mkdir -p "$DATA_DIR"

# Start shiori with custom data directory and port
exec shiori serve --port "$PORT" --dir "$DATA_DIR"
