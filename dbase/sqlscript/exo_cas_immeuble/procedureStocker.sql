/* procédure stocker: afficher tous les noms d'un département */
delimiter |
CREATE PROCEDURE lister_nom_empl_par_dept (IN p_job VARCHAR(50))
BEGIN
SELECT ename, job
FROM emp
WHERE job = p_job;
END |
delimiter ;

CALL lister_nom_empl_par_dept('salesman');

-- DELIMITER |
-- CREATE PROCEDURE afficher_produit_fournisseur(IN p_codeF CHAR(6))
-- BEGIN
--  SELECT
--   A.nomA AS "Nom Article",
--   A.`type` AS "Type Article",
--   A.nomR AS "Rayon"
--  FROM
--   ligne_bon_de_livraison AS L
--  INNER JOIN
--   articles AS A ON A.codeA = L.codeA
--  WHERE
--  L.codeF = p_codeF;
-- END|
-- DELIMITER ;
-- 
-- SET @p_codeF := "FABCFG";
-- CALL afficher_produit_fournisseur(@p_codeF);


/* ************** fournisseurs **************** */
-- DELIMITER |
-- CREATE PROCEDURE lister_produit_detail(IN p_codeFourni CHAR(6), OUT p_nomfournisseur VARCHAR(50))
-- BEGIN
-- SELECT articles.nomA AS "Nom Article", articles.`type` AS "catégorie", articles.nomR AS "rayon"
-- FROM articles
-- INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA= articles.codeA
-- WHERE ligne_bon_de_livraison.codeF = p_codeFourni;
-- 
-- SELECT nomF INTO p_nomfournisseur
-- FROM fournisseurs
-- WHERE codeF=p_codeFourni;
-- END|
-- DELIMITER ;
-- 
-- SET @p_nomfounisseur:='';
SET @code_fournisseur := 'FABCFG';
CALL lister_produit_detail(@code_fournisseur, @p_nomfournisseur);

SELECT @p_nomfournisseur;
