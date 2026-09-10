-- Creation de la table Region 

CREATE TABLE regions (
    id_region SERIAL PRIMARY KEY,
    nom_region VARCHAR(50) NOT NULL,
    chef_lieu VARCHAR(50) NOT NULL,
    superficie_km2 DECIMAL(10,2)
);

-- Creation de la table Entreprises_minieres

CREATE TABLE entreprises_minieres (
    id_entreprise SERIAL PRIMARY KEY,
    nom_entreprise VARCHAR(150) NOT NULL,
    sigle VARCHAR(30),
    type_activite VARCHAR(80),
    annee_creation INT,
    id_region INT NOT NULL,

    CONSTRAINT fk_entreprise_region
        FOREIGN KEY (id_region)
        REFERENCES regions(id_region)
);

-- Creation de la table Sites_miniers
CREATE TABLE sites_miniers (
    id_site SERIAL PRIMARY KEY,
    nom_site VARCHAR(150) NOT NULL,
    departement VARCHAR(80),
    commune VARCHAR(80),
    id_entreprise INT NOT NULL,

    CONSTRAINT fk_site_entreprise
        FOREIGN KEY (id_entreprise)
        REFERENCES entreprises_minieres(id_entreprise)
);

-- Creation de la table substances
CREATE TABLE substances (
    id_substance SERIAL PRIMARY KEY,
    nom_substance VARCHAR(100) NOT NULL,
    categorie VARCHAR(80),
    unite_mesure VARCHAR(30)
);

-- Creation de la table productions_minieres
CREATE TABLE productions_minieres (
    id_production SERIAL PRIMARY KEY,
    id_site INT NOT NULL,
    id_substance INT NOT NULL,
    annee INT NOT NULL,
    volume_produit DECIMAL(15,2) NOT NULL,
    valeur_production_fcfa DECIMAL(18,2),

    CONSTRAINT fk_production_site
        FOREIGN KEY (id_site)
        REFERENCES sites_miniers(id_site),

    CONSTRAINT fk_production_substance
        FOREIGN KEY (id_substance)
        REFERENCES substances(id_substance)
);

-- INSERTION DES DONNEES DANS LA TABLE REGIONS

INSERT INTO regions
(nom_region, chef_lieu, superficie_km2)
VALUES
('Dakar', 'Dakar', 550.00),
('Diourbel', 'Diourbel', 4824.00),
('Fatick', 'Fatick', 6685.00),
('Kaffrine', 'Kaffrine', 11262.00),
('Kaolack', 'Kaolack', 22489.00),
('Kédougou', 'Kédougou', 21011.00),
('Kolda', 'Kolda', 13220.00),
('Louga', 'Louga', 24847.00),
('Matam', 'Matam', 29424.00),
('Saint-Louis', 'Saint-Louis', 19241.00),
('Sédhiou', 'Sédhiou', 7359.00),
('Tambacounda', 'Tambacounda', 42164.00),
('Thiès', 'Thiès', 6601.00),
('Ziguinchor', 'Ziguinchor', 7339.00);


--- INSERTION DES DONNEES DANS LA TABLE ENTREPRISES_MINIERES
INSERT INTO entreprises_minieres
(nom_entreprise, sigle, type_activite, annee_creation, id_region)
VALUES
('Sabodala Gold Operations', 'SGO', 'Or', 2005, 6),
('Petowal Mining Company', 'PMC', 'Or', 2015, 6),
('Grande Côte Opérations', 'GCO', 'Minéraux lourds', 2007, 13),
('Industries Chimiques du Sénégal', 'ICS', 'Phosphates', 1976, 13),
('Société Minière de la Vallée du Fleuve Sénégal', 'SOMIVA', 'Phosphates', 2015, 9),
('Baobab Mining and Chemicals Corporation', 'BMCC', 'Phosphates', 2016, 2),
('Société de Commercialisation du Ciment', 'SOCOCIM', 'Calcaire et ciment', 1978, 1),
('Ciments du Sahel', 'CDS', 'Calcaire et ciment', 2002, 13),
('Dangote Industries Sénégal', 'DANGOTE', 'Calcaire et ciment', 2015, 13),
('Société Sénégalaise des Phosphates de Thiès', 'SSPT', 'Phosphates et attapulgite', 1957, 13),
('Compagnie Générale d Exploitation de Carrière', 'COGECA', 'Carrières', 1990, 13),
('Gécamines', 'GECAMINES', 'Matériaux de construction', 1980, 13),
('Sephos Sénégal', 'SEPHOS', 'Minéraux lourds', 2010, 13),
('African Investment Group', 'AIG', 'Phosphates', 2012, 8),
('Société des Mines de Fer du Sénégal Oriental', 'MIFERSO', 'Fer', 1975, 6);



-- INSERTION DES DONNEES DANS LA TABLE SITES_MINIERS
INSERT INTO sites_miniers
(nom_site, departement, commune, id_entreprise)
VALUES
('Mine de Sabodala', 'Kédougou', 'Sabodala', 1),
('Mine de Mako', 'Kédougou', 'Tomboronkoto', 2),
('Mine de Diogo', 'Tivaouane', 'Diogo', 3),
('Site de Taiba Ndiaye', 'Tivaouane', 'Taiba Ndiaye', 3),
('Mine de Taiba', 'Tivaouane', 'Darou Khoudoss', 4),
('Site de Ndendory', 'Kanel', 'Ndendory', 5),
('Gisement de Gadde Bissik', 'Diourbel', 'Gawane', 6),
('Site de Rufisque', 'Rufisque', 'Rufisque Est', 7),
('Site de Kirène', 'Thiès', 'Diass', 8),
('Site de Pout', 'Thiès', 'Pout', 9),
('Site de Allou Kagne', 'Thiès', 'Mont Rolland', 10),
('Carrière de Diack', 'Thiès', 'Diack', 11),
('Carrière de Thiès', 'Thiès', 'Thiès Est', 12),
('Périmètre de Kébémer', 'Kébémer', 'Kébémer', 14),
('Projet de la Falémé', 'Kédougou', 'Béli', 15);


-- INSERTION DES DONNEES DANS LA TABLE SUBSTANCES
INSERT INTO substances
(nom_substance, categorie, unite_mesure)
VALUES
('Or', 'Métaux précieux', 'tonnes'),
('Argent', 'Métaux précieux', 'tonnes'),
('Phosphate', 'Minéraux industriels', 'tonnes'),
('Acide phosphorique', 'Produits transformés', 'tonnes'),
('Zircon Premium', 'Minéraux lourds', 'tonnes'),
('Zircon Standard', 'Minéraux lourds', 'tonnes'),
('Ilménite 54%', 'Minéraux lourds', 'tonnes'),
('Ilménite 56%', 'Minéraux lourds', 'tonnes'),
('Ilménite 58%', 'Minéraux lourds', 'tonnes'),
('Rutile', 'Minéraux lourds', 'tonnes'),
('Leucoxène', 'Minéraux lourds', 'tonnes'),
('Attapulgite', 'Minéraux industriels', 'tonnes'),
('Calcaire', 'Matériaux de construction', 'tonnes'),
('Basalte', 'Matériaux de construction', 'tonnes'),
('Latérite', 'Matériaux de construction', 'tonnes');




--- INSERTION DES DONNEES DANS LA TABLE PRODUCTIONS_MINIERES
INSERT INTO productions_minieres
(id_site, id_substance, annee, volume_produit, valeur_production_fcfa)
VALUES

-- SGO - Or
(1, 1, 2023, 11.72, 484410607290),
(1, 1, 2024, 12.10, 510000000000),
(1, 1, 2025, 12.45, 535000000000),

-- PMC - Or
(2, 1, 2023, 5.20, 215000000000),
(2, 1, 2024, 5.45, 232000000000),
(2, 1, 2025, 5.70, 248000000000),

-- ICS - Phosphate
(5, 3, 2023, 2135054, 67036103568),
(5, 3, 2024, 2250000, 72000000000),
(5, 3, 2025, 2300000, 75000000000),

-- GCO - Zircon Premium
(3, 5, 2023, 28956, 33763827964),
(3, 5, 2024, 31200, 36500000000),
(3, 5, 2025, 33500, 39500000000),

-- GCO - Ilménite 54%
(4, 7, 2023, 292630, 53714417797),
(4, 7, 2024, 305000, 57000000000),
(4, 7, 2025, 320000, 60500000000),

-- SOCOCIM - Calcaire
(8, 13, 2023, 5748193, 11000000000),
(8, 13, 2024, 5900000, 11500000000),
(8, 13, 2025, 6050000, 12000000000),

-- CDS - Calcaire
(9, 13, 2023, 1500000, 7500000000),
(9, 13, 2024, 1620000, 8200000000),
(9, 13, 2025, 1700000, 8800000000),

-- SOMIVA - Phosphate
(6, 3, 2023, 594170, 33596052437),
(6, 3, 2024, 650000, 37000000000),
(6, 3, 2025, 700000, 40000000000),

-- BMCC - Phosphate
(7, 3, 2023, 550000, 30000000000),
(7, 3, 2024, 600000, 33000000000),
(7, 3, 2025, 650000, 36000000000),

-- GECAMINES - Basalte
(13, 14, 2023, 863539, 5000000000),
(13, 14, 2024, 900000, 5300000000),
(13, 14, 2025, 950000, 5600000000);


-- Verification des données insérées dans les tables
SELECT * FROM regions;

SELECT * FROM entreprises_minieres;

SELECT * FROM sites_miniers;

SELECT * FROM substances;

SELECT * FROM productions_minieres;

SELECT COUNT(*) FROM productions_minieres;

-- Verification des relations entre les tables
SELECT
    e.nom_entreprise,
    s.nom_site,
    r.nom_region
FROM entreprises_minieres e
JOIN sites_miniers s
    ON e.id_entreprise = s.id_entreprise
JOIN regions r
    ON e.id_region = r.id_region;


-- 10 questions sur le projet minier au Sénégal

-- 1. Quelle est la production totale par substance ?

SELECT
    s.nom_substance,
    SUM(p.volume_produit) AS production_totale
FROM productions_minieres p
JOIN substances s
    ON p.id_substance = s.id_substance
GROUP BY s.nom_substance
ORDER BY production_totale DESC;

-- 2. Quelles sont les 5 substances les plus produites ?

SELECT
    s.nom_substance,
    SUM(p.volume_produit) AS production_totale
FROM productions_minieres p
JOIN substances s
    ON p.id_substance = s.id_substance
GROUP BY s.nom_substance
ORDER BY production_totale DESC
LIMIT 5;


-- 3. Quelle est la production totale par année ?

SELECT
    annee,
    SUM(volume_produit) AS production_totale
FROM productions_minieres
GROUP BY annee
ORDER BY annee;

-- 4. Quelle entreprise a produit le plus ?

SELECT
    e.nom_entreprise,
    SUM(p.volume_produit) AS production_totale
FROM productions_minieres p
JOIN sites_miniers s
    ON p.id_site = s.id_site
JOIN entreprises_minieres e
    ON s.id_entreprise = e.id_entreprise
GROUP BY e.nom_entreprise
ORDER BY production_totale DESC;


-- 5. Quelle région possède le plus grand volume de production ?

SELECT
    r.nom_region,
    SUM(p.volume_produit) AS production_totale
FROM productions_minieres p
JOIN sites_miniers sm
    ON p.id_site = sm.id_site
JOIN entreprises_minieres e
    ON sm.id_entreprise = e.id_entreprise
JOIN regions r
    ON e.id_region = r.id_region
GROUP BY r.nom_region
ORDER BY production_totale DESC;

-- 6. Quelles entreprises ont produit plus de 1 million de tonnes ?


SELECT
    e.nom_entreprise,
    SUM(p.volume_produit) AS production_totale
FROM productions_minieres p
JOIN sites_miniers sm
    ON p.id_site = sm.id_site
JOIN entreprises_minieres e
    ON sm.id_entreprise = e.id_entreprise
GROUP BY e.nom_entreprise
HAVING SUM(p.volume_produit) > 1000000
ORDER BY production_totale DESC;

-- 7. Quels sites produisent de l'or ?

SELECT
    sm.nom_site,
    e.nom_entreprise,
    p.annee,
    p.volume_produit
FROM productions_minieres p
JOIN sites_miniers sm
    ON p.id_site = sm.id_site
JOIN entreprises_minieres e
    ON sm.id_entreprise = e.id_entreprise
JOIN substances s
    ON p.id_substance = s.id_substance
WHERE s.nom_substance = 'Or'
ORDER BY p.annee, p.volume_produit DESC;


-- 8. Quelle est la plus grande production enregistrée ?

SELECT
    MAX(volume_produit) AS production_maximale
FROM productions_minieres;


-- 9. Combien de sites miniers possède chaque entreprise ?

SELECT
    e.nom_entreprise,
    COUNT(sm.id_site) AS nombre_sites
FROM entreprises_minieres e
LEFT JOIN sites_miniers sm
    ON e.id_entreprise = sm.id_entreprise
GROUP BY e.nom_entreprise
ORDER BY nombre_sites DESC;


-- 10. Quelles années ont dépassé 5 millions de tonnes de production ?


SELECT
    annee,
    SUM(volume_produit) AS production_totale
FROM productions_minieres
GROUP BY annee
HAVING SUM(volume_produit) > 5000000
ORDER BY annee;