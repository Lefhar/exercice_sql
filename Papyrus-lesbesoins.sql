--1 Quelles sont les commandes du fournisseur 09120?
SELECT nomfou AS fourniseur, entcom.numfou,produit.libart AS Produit_vendu FROM entcom JOIN fournis ON fournis.numfou = entcom.numfou JOIN vente ON vente.numfou = fournis.numfou JOIN produit ON produit.codart= vente.codart WHERE vente.numfou =9120 

--2 Afficher le code des fournisseurs pour lesquels des commandes ont été passées.
SELECT fournis.numfou AS Numero_fournisseur, produit.libart AS produit_vendu  FROM ligcom JOIN entcom ON entcom.numcom = ligcom.numcom JOIN fournis ON fournis.numfou = entcom.numfou JOIN produit ON produit.codart = ligcom.codart

--3 Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.
SELECT COUNT(numcom) AS 'Nombre de commande'  , COUNT(DISTINCT numfou) AS 'Fournisseur concerné' from entcom 


-- 4 Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieur est inférieure à1000 
--(informations à fournir : n° produit, libelléproduit, stock, stockactuel d'alerte, quantitéannuelle)
select codat,libart,stkphy,stkale,qteann from produit where stkphy <= stkale and qteann < 1000


--5 Quels sont les fournisseurs situés dans les départements 75 78 92 77 ? 
--L’affichage (département, nom fournisseur) sera effectué par département décroissant, puis par ordre alphabétique
SELECT substring(posfou,1,2),nomfou FROM fournis WHERE substring(posfou,1,2) in (75,78,77,92) ORDER BY posfou DESC, nomfou ASC


--6 Quelles sont les commandes passées au mois de mars et avril?
select datcom as 'commandes passées au mois de mars et avril' from ENTCOM WHERE MONTH(datcom) = 3 or MONTH(datcom) = 4 

--7 Quelles sont les commandes du jour qui ont des observations particulières ?(Affichage numéro de commande, date de commande) 
-- note seul jour c'est le 23 qui est présent en base 
SELECT numcom, DAY(datcom) FROM entcom where obscom !="" and DAY(datcom)= "23"

