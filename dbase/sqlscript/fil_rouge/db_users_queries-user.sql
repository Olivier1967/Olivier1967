/*Requêtes UPDATE à implémenter (utilisateurs) Modifier l'utilisateur n° 3. Nouvel email : germaine.lustrucru@example.fr */
UPDATE t_user SET user_email='germaine.lustrucru@example.fr' WHERE user_id=3;

/*Requêtes UPDATE à implémenter (utilisateurs) Modifier l'utilisateur n° 4. Nouveau nom : Hatcher, Nouveau mot de passe : tatayoyo */
UPDATE t_user SET user_lastname='Hatcher', user_password='tatayoyo' WHERE user_id=4;


/*Requêtes SELECT à implémenter (utilisateurs)*/

/*Sélectionner toutes les informations de tous les utilisateurs. non recommandé mais pas interdit */
SELECT * FROM t_user;
SELECT user_id, user_lastname, user_firstname, user_password, user_email, role_id FROM t_user;

/*Sélectionner le nom, prénom, email et identifiant de chaque utilisateur.*/
SELECT user_lastname, user_firstname, user_email, role_id 
FROM t_user;

/*Sélectionner l'identifiant, le prénom et le nom de l'utilisateur n°2.*/
SELECT user_id, user_firstname, user_lastname 
FROM t_user 
WHERE user_id=2;

/*Sélectionner l'identifiant, le nom et l'email des utilisateurs dont le nom est "ingals".*/
SELECT user_id, user_lastname, user_email from t_user WHERE user_lastname='ingals';

/*Sélectionner toutes les informations des utilisateurs sans prénom.*/
SELECT user_id, user_lastname, user_firstname, user_email 
FROM t_user 
WHERE user_firstname IS NULL OR userfirsname='';

/*Sélectionner toutes les informations des utilisateurs avec un prénom. Le résultat est trié par identifiant (ordre décroissant)*/
SELECT  user_id, user_lastname, user_firstname, user_password, user_email, role_id
FROM t_user 
WHERE user_fisrtname IS NOT null AND user_firstname <> ''
ORDER BY user_id DESC;

/*Sélectionner l'identifiant et le nom des utilisateurs dont le nom contient la lettre "g".*/
SELECT user_id, user_lastname from t_user WHERE user_lastname LIKE '%g%';

/*Sélectionner l'identifiant, le nom et l'email des utilisateurs dont le prénom commence par la lettre "c". Le résultat est trié par prénom (ordre alphabétique)*/
SELECT user_id, user_lastname, user_email FROM t_user 
WHERE user_firstname LIKE 'c%' ORDER BY user_firstname ASC;

/*Sélectionner le nom, le prénom et l'email des utilisateurs dont l'email se termine par ".fr". Le résultat est trié par nom (ordre alphabétique)*/
SELECT user_lastname, user_firstname, user_email 
FROM t_user 
WHERE user_email LIKE '%.fr' 
ORDER BY user_lastname ASC;

/* quels role pour chaque user */
SELECT user_lastname, user_firstname, role_name, role_description
FROM t_user
inner JOIN t_role ON t_user.role_id=t_role.role_id
ORDER BY t_user.user_lastname ASC;

/* quels role a Charles */
SELECT user_lastname, user_firstname, role_name, role_description
FROM t_user
inner JOIN t_role ON t_user.role_id=t_role.role_id
WHERE t_user.user_firstname = 'charles'
ORDER BY t_user.user_lastname ASC;


