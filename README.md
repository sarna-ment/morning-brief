# Morning Brief ☀️

PWA d'apprentissage quotidien personnalisé — 5 articles générés chaque matin par l'IA.

## Lancement en local

### Option 1 — Node.js (recommandé)
```bash
npx serve .
```
Puis ouvrir http://localhost:3000

### Option 2 — Python
```bash
python -m http.server 8000
```
Puis ouvrir http://localhost:8000

> ⚠️ Ne pas ouvrir `index.html` directement dans le navigateur (file://) — le Service Worker ne fonctionnera pas.

## Première utilisation

1. Ouvrir l'URL dans Chrome ou Edge
2. Saisir votre clé API Anthropic (obtenue sur [console.anthropic.com](https://console.anthropic.com))
3. Remplir votre rôle et contexte
4. Cliquer **Commencer**
5. Sur mobile : **Ajouter à l'écran d'accueil** pour l'installer comme app

## Fichiers

```
index.html    — Application complète (UI + logique)
manifest.json — Métadonnées PWA (icônes, nom, couleurs)
sw.js         — Service Worker (cache hors-ligne)
```

## Stockage

Tout est conservé en `localStorage` sur l'appareil :
- Clé API
- Profil utilisateur
- Thèmes sélectionnés
- Historique des 30 derniers briefs

Aucune donnée n'est envoyée ailleurs que vers l'API Anthropic.
