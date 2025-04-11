#!/bin/sh

set -e

# Start Shiori with s6
exec /usr/local/bin/shiori server --port 8080 --dir /data

