#!/bin/sh
set -e
# Download/update root hints
curl -s -o /etc/unbound/root.hints https://www.internic.net/domain/named.root
chown root:root /etc/unbound/root.hints
chmod 644 /etc/unbound/root.hints
exec /usr/sbin/unbound -v
