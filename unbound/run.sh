#!/bin/sh
set -e

# 1️⃣ Update root hints
curl -s -o /etc/unbound/root.hints https://www.internic.net/domain/named.root
chown root:root /etc/unbound/root.hints
chmod 644 /etc/unbound/root.hints

# 2️⃣ Generate/update DNSSEC root key
unbound-anchor -a /etc/unbound/root.key -vvv || true

# 3️⃣ Start Unbound in foreground (PID 1)
exec /usr/sbin/unbound -c /etc/unbound/unbound.conf -v -d
