# Shiori Bookmark Add-on pour Home Assistant

## 📌 Description
Cet add-on installe **Shiori**, un gestionnaire de favoris auto-hébergé, directement dans Home Assistant.

- Gestion de favoris avec interface web moderne
- Persistance des données (DB SQLite)
- Sauvegarde et restauration automatiques via Home Assistant
- Accès via port externe **ou** directement dans l’interface HA (Ingress)

---

## 🚀 Utilisation
1. Installer l’add-on depuis votre dépôt personnalisé.
2. Démarrer l’add-on.
3. Ouvrir Shiori depuis **le panneau latéral de Home Assistant** (Ingress) ou via `http://homeassistant.local:8080`.

---

## ⚙️ Configuration
Exemple de configuration dans `options:` :

```yaml
port: 8080
