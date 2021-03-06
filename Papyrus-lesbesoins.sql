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

-- 8 Lister le total de chaque commande par total décroissant (Affichage numéro de commande et total)
SELECT numcom AS 'Numéro de commande', SUM(qtecde * priuni )as total FROM ligcom GROUP BY numcom  ORDER BY total desc

-- 9 Lister les commandes dont le total est supérieur à 10000€; on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000.
--(Affichage numéro de commande et total)
SELECT numcom AS 'Numéro de commande', SUM(qtecde * priuni )as total FROM ligcom where qtecde <1000 GROUP BY numcom HAVING SUM(qtecde  * priuni)>10000

-- 10 Lister les commandes par nom fournisseur (Afficher le nom du fournisseur, le numéro de commande et la date)
SELECT nomfou AS 'Fournisseur' , entcom.numcom AS 'Numéro de commande', datcom AS 'Date' FROM ligcom join entcom on entcom.numcom = ligcom.numcom join fournis ON fournis.numfou =  entcom.numfou

-- 11 Sortir les produits des commandes ayant le mot "urgent' en observation?(Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et le sous total= quantité commandée * Prix unitaire)
SELECT entcom.numcom AS 'numéro de commande', fournis.nomfou AS 'nom du fournisseur' , produit.libart AS 'libellé du produit', SUM(qtecde * priuni) as 'Sous total'  FROM ligcom JOIN produit ON produit.codart = ligcom.codart JOIN entcom ON entcom.numcom = ligcom.numcom JOIN fournis ON fournis.numfou = entcom.numfou WHERE obscom LIKE '%urgent%' GROUP BY entcom.numcom,nomfou,libart

-- 12 Coder de 2 manières différentes la requête suivante:Lister le nom des fournisseurs susceptibles de livrer au moins un article

SELECT nomfou FROM ligcom join entcom on entcom.numcom = ligcom.numcom and qteliv >= 1 join fournis ON entcom.numfou = fournis.numfou GROUP BY nomfou
--ou
SELECT nomfou FROM entcom,fournis,ligcom WHERE entcom.numfou = fournis.numfou and entcom.numcom = ligcom.numcom  and qteliv >= 1 GROUP BY nomfou