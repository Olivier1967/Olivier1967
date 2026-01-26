/* LLD : Langage de définition des données */ 
/* 3 instructions : 
CREATE : Créer une structure de données (table, vue etc...)
ALTER : Modifier une structure de données existante
DROP : Supprimer une structure de données existante 

Structures de données : DATABASE, TABLE, VIEW, FUNCTION, PROCEDURE, TRIGGER
*/

DROP TABLE IF EXISTS t_user;
DROP TABLE IF EXISTS t_role;
/*TRUNCATE TABLE t_role;*/
/*TRUNCATE TABLE t_user;*/

CREATE TABLE IF NOT EXISTS t_role 
(
	role_id INT AUTO_INCREMENT PRIMARY KEY,
	role_name VARCHAR(50) NOT NULL UNIQUE,
	role_register_code CHAR(128) NOT NULL,
	role_description VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS t_user 
(
	user_id INT AUTO_INCREMENT,
	user_email VARCHAR(50) NOT NULL,
	user_lastname VARCHAR(50) NOT NULL,
	user_firstname VARCHAR(50) NULL,
	user_password CHAR(128) NOT NULL,
	role_id INT NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE (user_email)
	/*CONSTRAINT FK_user_role FOREIGN KEY (role_id) REFERENCES t_role(role_id)*/
);

/* modifie la table t_user */
ALTER TABLE t_user ADD CONSTRAINT FK_user_role FOREIGN KEY (role_id) REFERENCES t_role(role_id);

INSERT INTO t_role 
(role_name, role_register_code, role_description) 
VALUES 
('usager', '1234', 'Un utilisateur lambda'),
('encadrant', '1452', 'Les encadrants'),
('administrateur', '9874', 'Les super pouvoirs');

INSERT INTO t_user 
(user_email, user_lastname, user_firstname, user_password, role_id) 
VALUES 
('toto@example.com', 		'ingals', 	'charles', 	'azerty', 	3),
('bertrand@example.com', 	'macron', 	'richard', 	'123456', 	1),
('germaine@example.com', 	'lustucru', 	NULL, 	'1234', 		2),
('daniel@example.com', 		'germain', 	'daniel', 	'azer', 		1),
('celine@example.com', 		'dion', 		'celine', 	'rené', 		2);


INSERT INTO t_user 
(user_email, user_lastname, user_firstname, user_password, role_id) 
VALUES 
('a@a.fr', 						'toto', 		'tata', 		'1234', 		2),
('ab@a.fr',				 		'totob', 	'tatab', 	'1234', 		1);

/*
LMD : Langage de Modélisation des données 
4 instructions :
INSERT : Insérer une ou plusieurs lignes dans une table existante
UPDATE: Modifier une ou plusieurs lignes existantes
DELETE: Supprimer une ou plusieurs lignes
TRUNCATE : Vider une table ET 
*/

/* modifier la table t_role. 
ajouter  */

ALTER table t_role ADD COLUMN role_level INT NOT NULL DEFAULT '0';
	
/* mettre a jour le niveau de chaque rôle :
role_d role_level
1 -> 0
2 -> 9
3 -> 10
*/

UPDATE t_role set role_level=0 WHERE role_id=1;

UPDATE t_role set role_level=9 WHERE role_id=2;

UPDATE t_role set role_level=10 WHERE role_id=3;

/* ajouter les rôles suivants :

*/

INSERT INTO t_role
(role_name, role_description, role_level, role_register_code)
VALUES
('employé','les salariés','1','7896'),
('cadre','les managers','2','asd44'),
('dirigeant','the big boss','8','4561');