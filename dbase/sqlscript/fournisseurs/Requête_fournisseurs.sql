/* 1. Sélectionner tous les employés (codeEmpl, nom, salaire) triés par nom et par ordre alphabétique */ 
SELECT codeEmpl, nom, salaire
FROM employe
ORDER BY nom ASC;

/* 2. Sélectionner tous les employés (codeEmpl, nom, salaire) avec, pour chaque employé, le nom du rayon dans lequel il travaille */
SELECT codeEmpl, nom, salaire, nomR
FROM employe

/* 3. Sélectionner tous les fournisseurs (codeFourn, nom) et le nombre de produits qu'ils fournissent, triés par nombre de produits décroissant */
SELECT fournisseurs.codeF, nomf, count(ligne_bon_de_livraion.`codeF`) AS nb_produits
FROM fournisseurs
INNER JOIN ligne_bon_de_livraion ON ligne_bon_de_livraion.codeF = fournisseurs.codeF
GROUP BY fournisseurs.codef
ORDER BY nb_produits DESC;

/* AUTRES FONCTIONS: Sélectionner tous les fournisseurs (codeFourn, nom) et le nombre de produits qu'ils fournissent, triés par nombre de produits décroissant

SELECT fournisseurs.codeF, nomf, Sum(ligne_bon_de_livraion.`quantité`) AS nb_produits
FROM fournisseurs
INNER JOIN ligne_bon_de_livraion ON ligne_bon_de_livraion.codeF = fournisseurs.codeF
GROUP BY fournisseurs.codef
ORDER BY nb_produits DESC;

SELECT fournisseurs.codeF, nomf, ligne_bon_de_livraion.`quantité`
FROM fournisseurs
INNER JOIN ligne_bon_de_livraion ON ligne_bon_de_livraion.codeF = fournisseurs.codeF
ORDER BY ligne_bon_de_livraion.`quantité`+0 DESC;

SELECT fournisseurs.codeF, nomf, ligne_bon_de_livraion.`quantité`
FROM fournisseurs
INNER JOIN ligne_bon_de_livraion ON ligne_bon_de_livraion.codeF = fournisseurs.codeF
ORDER BY CAST(quantité AS UNSIGNED) DESC;
*/

/* 4. Sélectionner tous les employés (codeEmpl, nom). Pour chaque employé, indiquer le nom du rayon, le nombre d'articles associés au rayon  */
SELECT codeEmpl, nom, rayon.nomR, count(articles.nomR) AS nb_articles
FROM employe
INNER JOIN rayon ON rayon.nomR = employe.nomR
INNER JOIN articles ON articles.nomR = rayon.nomR
GROUP BY rayon.nomR; -- GROUP BY employe.nom;

/*correction */
SELECT codeEmpl, nom, rayon.nomR, count(codeA) AS nb_articles
FROM employe
INNER JOIN rayon ON rayon.nomR = employe.nomR
INNER JOIN articles ON articles.nomR = rayon.nomR
GROUP BY codeEmpl; 

/* 5. Sélectionner tous les articles (codeA, nomA). Pour chaque article, indiquer le nombre de livraisons et la quantité totale livrée. */
SELECT articles.codeA, nomA, 
count(ligne_bon_de_livraison.codeA) AS nb_livraison, 
Sum(ligne_bon_de_livraison.`quantité`) AS quantitéTotal
FROM articles
INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA = articles.codeA
GROUP BY codeA;

/* 6. Sélectionner tous les articles (codeA, nomA). Pour chaque article, indiquer le nom du fournisseur, le nom et l'étage du rayon où il est stocké,
 et l'employé qui y travaille (codeEmpl, nom). */
 SELECT articles.codeA, nomA, nomF, rayon.nomR, etage, employe.codeEmpl, employe.nom
 FROM articles
 INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA = articles.codeA
 INNER JOIN fournisseurs on fournisseurs.codeF = ligne_bon_de_livraison.codeF
 INNER JOIN rayon ON rayon.nomR = articles.nomR
 INNER JOIN employe ON employe.nomR = rayon.nomR
 -- GROUP BY articles.codeA;
 -- GROUP BY rayon.nomR;
 
 /* correction -- GROUP BY articles.codeA; */
 
 SELECT articles.codeA AS codeArticle, nomA AS nomArticle, GROUP_CONCAT(nomF) AS nom_fournisseurs, rayon.nomR AS nomRayon, etage, codeEmpl, nom AS nomFournisseurs
 FROM articles
 INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA = articles.codeA
 INNER JOIN fournisseurs on fournisseurs.codeF = ligne_bon_de_livraison.codeF
 INNER JOIN rayon ON rayon.nomR = articles.nomR
 INNER JOIN employe ON employe.nomR = rayon.nomR
 GROUP BY codeArticle;
 
 /* 7 (4 sur dépot). Sélectionner le nom des produits, leur prix, et le nom du fournisseur associé */
 SELECT nomA, prix, nomf
 FROM articles AS TA
 INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA = articles.codeA
 INNER JOIN fournisseurs ON fournisseurs.codeF = ligne_bon_de_livraison.codeA
 
 /* 8. (5 sur dépot) Sélectionner le nom des produits, leur prix, et le nom du fournisseur pour chaque produit dont le prix est supérieur à la moyenne des prix des produits */
SELECT nomA, prix, nomF
FROM articles AS TA
INNER JOIN ligne_bon_de_livraison AS TL ON TL.codeA = TA.codeA
INNER JOIN fournisseurs AS TF ON TL.codeF = TF.codeF
WHERE prix > (SELECT AVG(prix) FROM articles);

/* alias exemple */
SELECT
codeA AS codeArticle,
nomA 'nomArticle',
`type`,
nomR,
prix
FROM `articles`
ORDER BY codeA DESC;




