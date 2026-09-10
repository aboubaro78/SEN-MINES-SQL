# 🇸🇳 SEN-MINES — Analyse du secteur minier sénégalais avec PostgreSQL

## 📌 Présentation du projet

**SEN-MINES** est un projet pratique réalisé avec **PostgreSQL** et **SQL** autour de l'analyse du secteur minier au Sénégal.

L'objectif du projet est de concevoir une base de données relationnelle permettant de représenter de manière simplifiée les principales composantes d'une activité minière : les régions, les entreprises minières, les sites d'exploitation, les substances exploitées et les productions enregistrées.

Le projet permet également de mettre en pratique les principales notions de SQL à travers des **questions business** et des requêtes d'analyse.

---

## 🎯 Objectifs

Ce projet a été réalisé dans le but de :

- Concevoir une base de données relationnelle avec PostgreSQL
- Définir des clés primaires (`PRIMARY KEY`)
- Mettre en place des clés étrangères (`FOREIGN KEY`)
- Relier plusieurs tables avec `JOIN`
- Filtrer des données avec `WHERE`
- Regrouper des données avec `GROUP BY`
- Filtrer des groupes avec `HAVING`
- Trier les résultats avec `ORDER BY`
- Limiter les résultats avec `LIMIT`
- Utiliser les fonctions d'agrégation :
  - `COUNT()`
  - `SUM()`
  - `AVG()`
  - `MIN()`
  - `MAX()`
- Répondre à des problématiques business à partir des données

---

## 🗂️ Contexte métier

Le secteur minier occupe une place importante dans l'économie sénégalaise.

Le Sénégal dispose notamment de ressources telles que :

- l'or
- les phosphates
- le zircon
- l'ilménite
- le rutile
- le calcaire
- le basalte
- l'attapulgite

Le projet **SEN-MINES** propose une représentation simplifiée de cet écosystème afin de pratiquer SQL sur un cas proche d'une problématique réelle de **Data Analysis**.

> **Important :** les noms de plusieurs entreprises, sites et substances sont inspirés de données publiques relatives au secteur extractif sénégalais. Les données de production utilisées dans ce projet sont des **données pédagogiques simulées** créées à des fins d'apprentissage de SQL. Elles ne doivent pas être considérées comme des statistiques officielles.

---

# 🏗️ Modèle de données

La base de données est composée de **5 tables** :

```text
                    ┌─────────────────┐
                    │     regions     │
                    │─────────────────│
                    │ PK id_region    │
                    │ nom_region      │
                    │ chef_lieu       │
                    │ superficie_km2  │
                    └────────┬────────┘
                             │
                             │ 1
                             │
                             │ N
                    ┌────────▼──────────────┐
                    │ entreprises_minieres │
                    │───────────────────────│
                    │ PK id_entreprise      │
                    │ nom_entreprise        │
                    │ sigle                 │
                    │ type_activite         │
                    │ annee_creation        │
                    │ FK id_region          │
                    └──────────┬────────────┘
                               │
                               │ 1
                               │
                               │ N
                    ┌──────────▼──────────┐
                    │   sites_miniers    │
                    │────────────────────│
                    │ PK id_site         │
                    │ nom_site           │
                    │ departement        │
                    │ commune            │
                    │ FK id_entreprise   │
                    └──────────┬─────────┘
                               │
                               │ 1
                               │
                               │ N
                    ┌──────────▼──────────────┐
                    │ productions_minieres   │
                    │────────────────────────│
                    │ PK id_production       │
                    │ FK id_site             │
                    │ FK id_substance        │
                    │ annee                  │
                    │ volume_produit         │
                    │ valeur_production_fcfa │
                    └──────────┬─────────────┘
                               │
                               │ N
                               │
                               │ 1
                    ┌──────────▼──────────┐
                    │    substances      │
                    │────────────────────│
                    │ PK id_substance    │
                    │ nom_substance      │
                    │ categorie          │
                    │ unite_mesure       │
                    └────────────────────┘
