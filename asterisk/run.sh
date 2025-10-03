#!/bin/sh

echo "🚀 Démarrage d'Asterisk avec config dans /etc/asterisk"

echo "🔍 Vérification du contenu du dossier /etc/asterisk :"
ls -la /etc/asterisk || echo "⚠️ Impossible de lister /etc/asterisk"

echo "🔍 Permissions sur les fichiers :"
stat /etc/asterisk/* || echo "⚠️ Aucun fichier trouvé dans /etc/asterisk"

echo "🔍 Contenu de asterisk.conf (les premières lignes) :"
head -20 /etc/asterisk/asterisk.conf || echo "⚠️ asterisk.conf introuvable"

echo "🔍 Contenu de modules.conf (les premières lignes) :"
head -20 /etc/asterisk/modules.conf || echo "⚠️ modules.conf introuvable"

echo "🔍 Contenu de logger.conf (les premières lignes) :"
head -20 /etc/asterisk/logger.conf || echo "⚠️ logger.conf introuvable"

echo "🛠️ Lancement d'Asterisk avec verbosité maximale (-vvv)"
exec asterisk -f -vvv
