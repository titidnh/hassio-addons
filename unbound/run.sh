#!/bin/sh
set -e

curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.root
exec /usr/sbin/unbound -v -d
