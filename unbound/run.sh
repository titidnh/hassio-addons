#!/bin/sh
set -e

curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.root
chown root:root /etc/unbound/root.hints
chmod 644 /etc/unbound/root.hints
unbound-anchor -a /etc/unbound/root.key
ls -l /etc/unbound/root.key

exec /usr/sbin/unbound -v -d
