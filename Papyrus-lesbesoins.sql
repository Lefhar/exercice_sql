--1 Quelles sont les commandes du fournisseur 09120?
SELECT nomfou AS fourniseur, entcom.numfou,produit.libart AS Produit_vendu FROM entcom JOIN fournis ON fournis.numfou = entcom.numfou JOIN vente ON vente.numfou = fournis.numfou JOIN produit ON produit.codart= vente.codart WHERE vente.numfou =9120 

--2 Afficher le code des fournisseurs pour lesquels des commandes ont été passées.
SELECT fournis.numfou AS Numero_fournisseur, produit.libart AS produit_vendu  FROM ligcom JOIN entcom ON entcom.numcom = ligcom.numcom JOIN fournis ON fournis.numfou = entcom.numfou JOIN produit ON produit.codart = ligcom.codart

--3 Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.
SELECT COUNT(numcom) AS 'Nombre de commande'  , COUNT(DISTINCT numfou) AS 'Fournisseur concerné' from entcom 


-- 4 Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieur est inférieure à1000 
--(informations à fournir : n° produit, libelléproduit, stock, stockactuel d'alerte, quantitéannuelle)







--6 Quelles sont les commandes passées au mois de mars et avril?
SELECT ligcom.numcom, derliv, entcom.numcom, datcom FROM ligcom JOIN entcom ON entcom.numcom = ligcom.numcom WHERE (MONTH(ligcom.derliv) BETWEEN 3 and 4) and (MONTH(entcom.datcom) BETWEEN 3 AND 4) 