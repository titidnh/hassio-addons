#!/bin/bash
set -euo pipefail

# --- Nettoyage complet de /etc/squid ---
echo "Nettoyage complet de /etc/squid..."
rm -rf /etc/squid/*
mkdir -p /etc/squid/conf.d

# --- Créer /config/squid si nécessaire ---
if [ ! -d /config/squid ]; then
    echo "Création du dossier /config/squid"
    mkdir -p /config/squid
fi

# --- Copier fichiers conf.d ---
if [ "$(ls -A /config/squid 2>/dev/null)" ]; then
    echo "Utilisation des configs depuis /config/squid"
    cp -r /config/squid/* /etc/squid/conf.d/
else
    echo "Aucune config utilisateur, copie des configs par défaut depuis Git"
    cp -r /addon/conf.d/* /etc/squid/conf.d/
fi

# --- Copier le squid.conf principal ---
if [ -f /config/squid/squid.conf ]; then
    echo "Chargement du squid.conf utilisateur"
    cp /config/squid/squid.conf /etc/squid/squid.conf
else
    echo "Chargement du squid.conf par défaut"
    cp /addon/conf/squid.conf /etc/squid/squid.conf
fi

# --- Fixer les permissions ---
echo "Fixation des permissions..."
chown -R proxy:proxy /etc/squid || true
chmod -R 644 /etc/squid/conf.d/* || true

# --- Lancer scripts personnalisés s’ils existent ---
if [ -x /etc/squid/updateAdServersList.sh ]; then
    echo "Exécution de updateAdServersList.sh..."
    sh /etc/squid/updateAdServersList.sh || echo "⚠️ Erreur dans updateAdServersList.sh"
fi

if [ -x /etc/squid/updateEasyList.sh ]; then
    echo "Exécution de updateEasyList.sh..."
    sh /etc/squid/updateEasyList.sh || echo "⚠️ Erreur dans updateEasyList.sh"
fi

# --- Lancer Squid ---
echo "Démarrage de Squid..."
exec squid -N -f /etc/squid/squid.conf
