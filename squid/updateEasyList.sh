#!/bin/bash
set -euo pipefail

# Crée un dossier temporaire
tmp_dir=$(mktemp -d)
list=/etc/squid/adServersListEasyList.txt

cleanup() {
    rm -rf "${tmp_dir}"
    rm -f /tmp/adblock.sed
}
trap cleanup EXIT

# Créer le fichier de transformation sed
cat > /tmp/adblock.sed <<'EOF'
/.*\$.*/d;
/\n/d;
/.*\#.*/d;
/@@.*/d;
/^!.*/d;
s/\[\]/\[.\]/g;
s#http://#||#g;
s#//#||#g;
s/^\[.*\]$//g;
s,[+.?&/|],\\&,g;
s#*#.*#g;
s,\$.*$,,g;
s,\\|\\|\(.*\)\^\(.*\),.\1\\/\\2,g;
s,\\|\\|\(.*\),.\1,g;
/^\.\*$/d;
/^$/d;
EOF

# Sauvegarde de l'ancien fichier si il existe
if [ -f "$list" ]; then
    mv "$list" "$list".old
fi

# Télécharger EasyList
cd "$tmp_dir"
if ! curl -s -O https://easylist-downloads.adblockplus.org/easylist.txt; then
    echo "Erreur de téléchargement"
    # Restaurer l'ancien fichier si la sauvegarde existait
    [ -f "$list".old ] && mv "$list".old "$list"
    exit 1
fi

# Transformation avec sed
sed -f /tmp/adblock.sed easylist.txt >> "$list"

echo "Mise à jour terminée : $list"
