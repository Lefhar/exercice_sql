-- 1 afficher la liste des hôtels
SELECT hot_nom, hot_ville FROM hotel
-- 2 - Afficher la ville de résidence de Mr White
SELECT cli_ville FROM client where cli_nom like 'white'
-- 3 - Afficher la liste des stations dont l’altitude < 1000 Le résultat doit faire apparaître le nom de la station et l'altitude
SELECT sta_altitude, sta_nom from station where sta_altitude <1000
-- 4 - Afficher la liste des chambres ayant une capacité > 1 Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité
SELECT cha_capacite, cha_numero FROM chambre where cha_capacite > 1




-- SELECT colonne_1, colonne_2, ..., colonne_n
-- FROM Table_1
-- JOIN Table_2
-- ON Table_1.colonne_i = Table_2.colonne_j
-- JOIN Table_3
-- ON Table_2.colonne_x = Table_3.colonne_y