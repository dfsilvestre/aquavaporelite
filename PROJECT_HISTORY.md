# Aqua Vapor Elite — Historique du projet

Detailing vapeur premium à domicile sur la Côte d'Azur (automobiles de prestige, yachts, aviation privée) — de Monaco à Saint-Tropez.

- **Dépôt** : `github.com/dfsilvestre/aquavaporelite` (branche `main`)
- **Déploiement** : Vercel (auto depuis `main`)
- **Dernière mise à jour de ce document** : 2026-06-13

---

## Stack technique

- **Site mono-fichier** : tout dans `index.html` (~6 600 lignes), HTML/CSS/JS **vanilla**, aucun framework.
- **Trilingue** FR / EN / RU via `data-lang` sur `<html>` (spans `.fr` / `.en` / `.ru`).
- **Animation** : GSAP 3.15 + ScrollTrigger + Lenis (smooth scroll desktop uniquement), avec repli `IntersectionObserver` et garde `prefers-reduced-motion`.
- **Carte** : Leaflet 1.9.4, imagerie satellite Esri World Imagery.
- **Typographie** : Cormorant Garamond (titres) · Montserrat / Bricolage Grotesque (corps).
- **Palette** : bleu Aqua `#1A90D9`, argent/platine `#C5D8EA`, fonds bleu nuit / noir profond.
- **Configurateur** de devis en 5 étapes → message WhatsApp pré-rempli (repli e-mail).
- **Assets** : `assets/icons-luxury/` (4 silhouettes SVG premium), `assets/`, `brand/`.

---

## Contraintes permanentes (à respecter pour toute évolution)

- **Ne pas casser le SEO** : métas, données structurées (JSON-LD), `hreflang`, hiérarchie des titres `h1>h2>h3`, contenu trilingue.
- **Ne pas toucher au Hero** (techniquement validé) — la Porsche doit rester **visible en entier** sur mobile **et** desktop, jamais coupée.
- **Ne pas casser les pages / contenus villes** : Monaco, Cannes, Nice, Antibes, Saint-Tropez.
- **Conserver** : responsive, performances, GSAP existant.
- **Git** : pas de `commit` ni `push` sans validation explicite.

---

## Journal des versions

### 2026-06-13 — Montée en gamme premium

| Commit | Fichiers | Lignes | Résumé |
|---|---|---|---|
| `7f2edfb` | index.html | +296 / −30 | **Configurateur · calendrier · carte** |
| `ae072ae` | index.html | +184 | **Page d'accueil premium** |
| `3cb7526` | index.html + 4 SVG | +295 / −28 | **Configurateur premium + icônes luxe** |
| `bd68d55` | index.html | +223 / −44 | **Amélioration luxe & conversion** |

**`7f2edfb` — Configurateur, calendrier, carte**
- Dropdown « Prestation souhaitée » premium : panneau bleu nuit, groupes **TERRE / MER / AIR** avec icônes lux (911 · yacht · G650), libellé + prix, ouverture animée + micro-stagger GSAP, état sélectionné bleu + coche. Le `<select>` natif reste la source de vérité (masqué, accessible).
- Calendrier premium remplaçant le champ date natif : navigation mois, jours passés désactivés, jours disponibles mis en valeur, aujourd'hui marqué, mois/jours FR·EN·RU. L'`<input type="date">` natif est conservé.
- Carte d'intervention : **suppression de la polyligne bleue**, marqueurs premium (halo + pulse), nom de ville au survol/tap, apparition échelonnée.
- Carrousel villes mobile : marquee infini lent, pause au toucher, statique centré sur desktop.

**`ae072ae` — Page d'accueil premium**
- Section **« Pourquoi Aqua Vapor Elite »** : 4 piliers de marque (Discrétion · Maîtrise du prestige · Conciergerie mobile · Sur recommandation).
- Section **« Garanties premium »** : Satisfaction · Ponctualité · Zéro eau/zéro dégât · Confidentialité, placée avant le configurateur.
- Témoignage signature premium au-dessus du marquee d'avis.

**`3cb7526` — Configurateur premium + icônes luxe**
- 4 silhouettes SVG premium « ligne fine argent chromé » : Porsche 911, Range Rover, yacht Pershing/Riva, Gulfstream G650 (`assets/icons-luxury/`).
- Configurateur : barre de progression « Étape X sur 5 », transitions GSAP entre étapes, état sélectionné des cartes (halo bleu + badge coché), **écran final premium** (coche animée, « demande enregistrée », boutons WhatsApp + Retour accueil).

**`bd68d55` — Amélioration luxe & conversion**
- Travail global de luxe perçu et de conversion (typographie, accents dorés/argent, copywriting, micro-animations).

### 2026-06-12 — Hero mobile & cinématique

| Commit | Lignes | Résumé |
|---|---|---|
| `3bffc55` | +19 / −10 | Hero mobile — Porsche visible en entier (ajustement) |
| `3eb23e0` | +295 / −15 | Hero mobile — Porsche visible en entier |
| `cec0696` | +13 / −5 | Hero mobile premium + scroll cinématique |
| `79fcb23` | +82 / −25 (10 fichiers) | Optimisation mobile luxe |
| `6ee85d2` | +20 / −7 | Optimisation mobile luxe |
| `8ef7734` | +126 / −9 | Version mobile optimisée |

- Hero mobile retravaillé pour un rendu premium et une Porsche jamais coupée.
- Mise en place du moteur cinématique (GSAP / ScrollTrigger / Lenis) et de l'optimisation mobile.

### 2026-06-09 → 06-11 — Mise en place du dépôt

| Commit | Lignes | Résumé |
|---|---|---|
| `2c639f2` | +1 384 (35 fichiers) | Ajout de fichiers (assets) |
| `5663f9c` | +5 978 (5 fichiers) | Ajout de fichiers (restructuration) |
| `b57c6d6` | −6 778 (19 fichiers) | Suppression du dossier `aqua-vapor-elite` |
| `8988473` | +6 778 (19 fichiers) | Import initial du projet |

---

## État actuel des fonctionnalités

- Hero cinématique avec Porsche (mobile + desktop), bandeau domaines Terre / Mer / Air.
- Sections : Engagement, Rituel/méthode, Services, **Pourquoi la vapeur**, **Pourquoi Aqua Vapor Elite**, Avant/Après, Clientèle, Tarifs, Témoignages (+ témoignage signature), Badges de confiance, FAQ, **Garanties premium**, Configurateur, Contact + carte.
- Configurateur 5 étapes : type de véhicule (icônes premium), ville, **prestation (dropdown premium)**, photos + **calendrier premium**, coordonnées → écran final premium.
- Carte Leaflet « zone d'intervention » : marqueurs premium glow, sans tracé reliant les villes.
- Carrousel villes animé sur mobile, statique sur desktop.
- Trilingue FR / EN / RU sur l'ensemble du site.

---

## Notes

- **Numéro WhatsApp** : encore un placeholder (`WHATSAPP_NUMBER = ''` dans `index.html`). Tant qu'il est vide, les boutons WhatsApp basculent sur l'e-mail pré-rempli. Renseigner le vrai numéro (format `33XXXXXXXXX`) active l'envoi WhatsApp partout, sans autre modification.
- **Performances** : animations en `transform`/`opacity` (GPU), gardes `prefers-reduced-motion`, Lenis désactivé sur mobile.
