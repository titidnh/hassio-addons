#!/bin/sh
set -e

# Download/update root hints
curl -s -o /etc/unbound/root.hints https://www.internic.net/domain/named.root
chown root:root /etc/unbound/root.hints
chmod 644 /etc/unbound/root.hints

# Generate/update DNSSEC root key
unbound-anchor -a /etc/unbound/root.key -vvv

# Start Unbound in foreground (systemd will manage it)
exec /usr/sbin/unbound -v
