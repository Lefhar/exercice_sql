-- 7 - Afficher la liste des hôtels avec leur station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)
SELECT hotel.hot_nom, hotel.hot_sta_id, hotel.hot_categorie, hotel.hot_ville, station.sta_nom, station.sta_id From hotel, station
-- ou
SELECT cha_numero, hot_nom, hot_categorie, hot_ville, sta_nom, sta_id From hotel, station WHERE sta_id = hot_sta_id 
-- 8 - Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)
SELECT chambre.cha_numero, hotel.hot_nom, hotel.hot_categorie, hotel.hot_ville From chambre, hotel

