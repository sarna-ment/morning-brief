# ☀️ Morning Brief

> Votre brief d'information personnalisé chaque matin — 5 articles sur-mesure générés par l'IA en 5 minutes.

**[→ Ouvrir l'application](https://sarna-ment.github.io/morning-brief/)**

---

## Qu'est-ce que Morning Brief ?

Morning Brief est une application web progressive (PWA) qui utilise l'intelligence artificielle Claude (Anthropic) pour vous générer chaque matin un résumé personnalisé de l'actualité. En quelques secondes, vous disposez de 5 articles courts, ciblés sur vos centres d'intérêt, dans le ton et le style qui vous correspondent.

Pas de publicité. Pas d'algorithme qui vous enferme dans une bulle. Pas d'abonnement. Juste votre brief, rien que le vôtre.

---

## Fonctionnalités

### 📰 Brief quotidien
- 5 articles générés par Claude sur vos thèmes favoris
- Anti-répétition : les sujets déjà traités ne reviennent pas
- Chaque article inclut un **insight actionnable** (ce que vous devez retenir)
- Temps de lecture estimé par article

### 📅 Brief hebdomadaire
- Synthèse des grandes tendances de la semaine
- Perspective et angles différents du brief quotidien

### 🎙️ Mode Podcast 5 minutes
- Script rédigé par l'IA au format spoken word (phrases courtes, transitions naturelles)
- Calibré pour exactement 5 minutes de lecture
- Player immersif avec waveform animée, barre de progression, contrôle de vitesse
- Écoutable en voiture, sous la douche, en préparant le petit-déjeuner

### ⭐ Favoris
- Étoilez les articles qui vous marquent
- Retrouvez-les dans un écran dédié
- Partagez-les en un tap (WhatsApp, SMS, copie)

### 📊 Statistiques
- Streak de jours consécutifs
- Compteurs de briefs lus et d'articles
- Top 8 de vos thèmes les plus consommés

### 👤 Multi-profils
- Créez autant de profils que vous voulez (famille, collègues…)
- Chaque profil a ses propres thèmes, son style de lecture, son historique
- Basculez d'un profil à l'autre en un tap

### 🔔 Notifications
- Programmez l'heure de votre brief quotidien
- Notification native du navigateur, aucune inscription requise

### 🎨 5 thèmes visuels
Coral Sunrise · Ocean Breeze · Forest Calm · Midnight · Golden Hour — configurables depuis l'écran Profil.

---

## Installation

### Sur iPhone / Android (recommandé)
1. Ouvrez [sarna-ment.github.io/morning-brief](https://sarna-ment.github.io/morning-brief/) dans Safari (iOS) ou Chrome (Android)
2. Appuyez sur **Partager → Sur l'écran d'accueil**
3. L'app s'installe comme une vraie application, sans passer par l'App Store

### En local (développement)
```powershell
# Prérequis : Python 3, PowerShell, clé API Anthropic dans A:\Claude\Root\.env
cd A:\Workspace\Repository\morning-brief
powershell -ExecutionPolicy Bypass -File launch.ps1
# → Ouvre automatiquement http://localhost:3000
```

---

## Obtenir une clé API Anthropic

Morning Brief utilise Claude, le modèle d'IA d'Anthropic. Vous avez besoin d'une clé API personnelle :

1. Créez un compte sur [console.anthropic.com](https://console.anthropic.com)
2. Allez dans **API Keys** → **Create Key**
3. Copiez la clé (commence par `sk-ant-`)
4. Collez-la dans Morning Brief lors du premier démarrage

**Coût :** environ 0,01 € par brief quotidien (5 articles). Le mode Podcast ajoute ~0,01 € pour le script. Anthropic offre des crédits gratuits à l'inscription.

Votre clé est stockée **uniquement sur votre appareil**, jamais sur un serveur.

---

## Architecture technique

```
morning-brief/
├── index.html      # Application complète (HTML + CSS + JS)
├── manifest.json   # Configuration PWA (icône, couleurs, nom)
├── sw.js           # Service Worker (cache offline)
├── icon-192.png    # Icône app
├── icon-512.png    # Icône app haute résolution
└── launch.ps1      # Script de lancement local (Windows)
```

**Stack :**
- HTML / CSS / JavaScript vanilla — aucune dépendance externe
- `localStorage` pour toutes les données (profils, historique, favoris)
- [Claude API](https://docs.anthropic.com/en/api/) — modèle `claude-sonnet-4-6`
- [Web Speech API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API) — synthèse vocale native
- [Web Share API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Share_API) — partage natif mobile
- [Notifications API](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API) — push natif navigateur
- GitHub Pages — hébergement gratuit

**Modèle de données localStorage :**
```
mb_profiles           → [{id, name, role, context, goal, style, themes[], apikey}]
mb_active_profile_id  → "p..."
mb_history_{id}       → [{date, label, articles[{tag, titre, corps, insight, lecture}]}]
mb_favorites          → [{...article, savedAt}]
mb_theme              → "coral" | "ocean" | "forest" | "midnight" | "golden"
mb_notif_enabled      → "1"
mb_notif_time         → "07:30"
```

---

## Vie privée

- **Aucune donnée n'est envoyée à nos serveurs** — il n'y a pas de serveur.
- Vos briefs, favoris et préférences restent sur votre appareil.
- Seuls vos prompts sont envoyés à l'API Anthropic (selon leurs [conditions d'utilisation](https://www.anthropic.com/legal/privacy)).
- Votre clé API n'est jamais partagée ou transmise ailleurs qu'à Anthropic.

---

## Contribuer

Le projet est open source. Toute suggestion, bug ou PR est la bienvenue sur [github.com/sarna-ment/morning-brief](https://github.com/sarna-ment/morning-brief/issues).

---

*Propulsé par [Claude](https://anthropic.com) · Hébergé sur [GitHub Pages](https://pages.github.com)*
