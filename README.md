# 📊 Analyse de Données avec R

Travaux pratiques d'analyse de données réalisés avec **R et RStudio** dans le cadre de la formation en Business Intelligence à l'ISG Bizerte.

---

## 📁 Contenu du dépôt

| Fichier | Description |
|---------|-------------|
| `graphe.R` | Visualisation de données avec ggplot2 — analyse des retards aériens |
| `PROJET.R` | Manipulation de données : vecteurs, matrices, listes, data frames |

---

## ✨ Compétences démontrées

### 📈 Visualisation avec ggplot2
- Création de graphiques en barres (barplot, geom_bar)
- Personnalisation : couleurs, transparence, largeur, thèmes
- Ajout de titres, sous-titres, légendes et labels d'axes
- Analyse du dataset réel **hflights** (vols Houston 2011)

### 🔧 Manipulation de données avec dplyr
- Sélection et filtrage de colonnes (`select`, `filter`, `subset`)
- Agrégation et regroupement (`group_by`, `summarise`)
- Tri et classement (`arrange`, `order`, `slice_max`)
- Fusion de datasets (`merge`)

### 🗂️ Structures de données R
- Vecteurs, matrices, listes, data frames
- Création, modification et suppression d'éléments
- Facteurs et variables catégorielles
- Statistiques descriptives (`summary`, `mean`, `median`, `sd`)

---

## 🔍 Exemple — Analyse des retards aériens

Analyse du dataset **hflights** (227 496 vols depuis Houston en 2011) :

```r
library(dplyr)
library(ggplot2)
library(hflights)

# Top 6 compagnies avec le plus grand retard moyen à l'arrivée
Temps_Retard <- hflights %>%
  select(UniqueCarrier, ArrDelay) %>%
  group_by(UniqueCarrier) %>%
  summarise(Temps_retard_arrivé_moyen = mean(ArrDelay, na.rm = TRUE)) %>%
  slice_max(Temps_retard_arrivé_moyen, n = 6)

# Visualisation
Temps_Retard %>%
  ggplot(aes(x = UniqueCarrier, y = Temps_retard_arrivé_moyen, fill = UniqueCarrier)) +
  geom_bar(stat = 'identity', width = 0.8, alpha = 0.6) +
  theme_classic() +
  labs(
    title = "Top 6 Compagnies selon temps retards Arrivée",
    subtitle = "Maram Rhayem",
    caption = "Source : base de données hflights 2011",
    x = "Compagnie aérienne",
    y = "Temps de retard moyen (min)"
  )
```

---

## 🛠️ Technologies utilisées

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![RStudio](https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=rstudio&logoColor=white)

**Packages :** ggplot2, dplyr, hflights

---

## 👩‍💻 Auteure

**Maram Rhayem** — Étudiante L2 Informatique de Gestion, ISG Bizerte  
📧 maram.rhayem@isgb.ucar.tn  
🔗 [GitHub](https://github.com/maramrhayem)
