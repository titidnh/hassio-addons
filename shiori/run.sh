#!/bin/sh

set -e

# Start Shiori with s6
exec /usr/local/bin/shiori serve --port 8080 --dir /data

