#!/bin/bash
set -e

# Créer /config/squid si nécessaire
if [ ! -d /config/squid ]; then
    echo "Création du dossier /config/squid"
    mkdir -p /config/squid
fi

# Créer /etc/squid/conf.d
mkdir -p /etc/squid/conf.d

# Copier fichiers conf.d
if [ "$(ls -A /config/squid 2>/dev/null)" ]; then
    echo "Utilisation des configs depuis /config/squid"
    cp -r /config/squid/* /etc/squid/conf.d/
else
    echo "Aucune config utilisateur, copie des configs par défaut depuis Git"
    cp -r /addon/conf.d/* /etc/squid/conf.d/
fi

# Copier squid.conf
if [ -f /config/squid/squid.conf ]; then
    cp /config/squid/squid.conf /etc/squid/squid.conf
else
    cp /addon/conf/squid.conf /etc/squid/squid.conf
fi

# Fixer permissions
chown -R proxy:proxy /etc/squid
chmod -R 644 /etc/squid/conf.d/*

# Lancer scripts personnalisés
./updateAdServersList.sh
./updateEasyList.sh

# Lancer Squid
exec squid -N -f /etc/squid/squid.conf
