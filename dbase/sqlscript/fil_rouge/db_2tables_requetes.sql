/* 1. Sélectionner tous les utilisateurs (identifiant nom, prénom, email et nom du rôle). */

/* Sans jointure */
SELECT user_id, user_lastname, user_firstname, user_email, role_name 
FROM t_user, t_role 
WHERE t_user.role_id = t_role.role_id;

/* Avec jointure */
SELECT user_id, user_lastname, user_firstname, user_email, role_name
FROM t_user
inner JOIN t_role ON t_user.role_id=t_role.role_id;


/* 2.Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle).
 Trier les résultats par idetnfiant de rôle par ordre décroissant puis par nom de famille par ordre croissant. */

/* Sans jointure */
SELECT user_id, user_lastname, user_firstname, user_email, t_role.role_id, role_name
FROM t_user, t_role
WHERE t_user.role_id = t_role.role_id
ORDER BY user_id DESC, user_lastname ASC;
-- LIMIT 3; (limit 3 offset 2 '30 par pages' => limit 3,2)

/* Avec jointure */
SELECT user_id, user_lastname, user_firstname, user_email, role_name
FROM t_user inner JOIN t_role ON t_user.role_id=t_role.role_id;

SELECT user_id, user_lastname, user_firstname, user_email, role_name
FROM t_user LEFT JOIN t_role ON t_user.role_id=t_role.role_id;

SELECT user_id, user_lastname, user_firstname, user_email, role_name
FROM t_user RIGHT JOIN t_role ON t_user.role_id=t_role.role_id;

/* 3.Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle,
 nom du rôle) qui possèdent le rôle n°2 */
SELECT user_id, user_lastname, user_firstname, user_email, t_role.role_id, role_name
FROM t_user inner JOIN t_role ON t_user.role_id=t_role.role_id
WHERE t_role.role_id = 2;

/* 4.Sélectionner le nombre d'utilisateurs.*/
SELECT COUNT(role_id) FROM t_role;

/* 4A.calculer la moyenne du nombre d'utilisateurs.*/
SELECT AVG(user_id) FROM t_user;

/* 4B.calculer la somme du nombre d'utilisateurs.*/
SELECT SUM(user_id) FROM t_user;

/* 5.Sélectionner, dans les rôles, le plus grand identifiant.*/
SELECT MAX (role_id) FROM t_role;

/* 6. Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). Pour chaque rôle, afficher 
le nombre d'utilisateurs concernés.*/
SELECT role_name, role_description, COUNT(user_id)
FROM t_role
INNER JOIN t_user ON t_user.role_id = t_role.role_id
GROUP BY t_role.role_id;

/* 7.Sélectionner la moyenne du nombre d'utilisateurs par rôle. */
SELECT 
    (SELECT COUNT(user_id) FROM t_user) 
    / 
    (SELECT COUNT(role_id) FROM t_role);

/* 8. Sélectionner nom, prénom, nom du rôle de tous les utilisateurs avec pour chaque utilisateur l'identifiant 
et nom de l'utilisateur possédant le même rôle et l'identifiant le plus petit. */
SELECT user_lastname, user_firstname, t_role.role_name, user_id, t_role.role_id
FROM t_role
INNER JOIN t_user ON t_user.role_id = t_role.role_id
-- GROUP BY t_role.role_name
ORDER BY t_role.role_id ASC, t_user.user_id ASC;

