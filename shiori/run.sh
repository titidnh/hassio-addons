#!/bin/sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Start Shiori with s6
exec /usr/local/bin/shiori server --port 8080 --dir /data --debug

