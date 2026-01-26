/* fichier d'insertion de données */

INSERT INTO t_user 
(user_email, user_lastname, user_firstname) 
VALUES 
('zorb@example.com', 		'rabbit', 		'zora'),
('patchouli@example.fr', 	'patchouli', 	'édouard'),
('eva.stt@example.com', 	'satiti', 		'eva');

INSERT INTO t_question
(question_date, question_label, question_response, user_id)
VALUES
('2024-11-23', 'Dans MySQL, quel type de données permet de stocker des valeurs numériques dont le maximum est 127 ?', 'Le type TINYINT stocke des valeurs numériques comprises entre -128 et 127', 3),
('2024-11-23', 'Quels sont les principaux serveurs SQL gratuits ?', 'MySQL, MariaDB, PostgreSQL, SQLite', 2),
('2024-11-27', 'Que signifie le sigle SGBDR ?', 'Système de Gestion de Bases de Données Relationnelles', 1),
('2024-12-05', 'Que signifie le sigle SQL ?', 'Structured Query Language !', 2),
('2024-12-05', 'Que signifie le sigle noSQL ?', 'Not Only SQL !', 3);

INSERT INTO t_category
(category_name, category_description, category_order)
VALUES
('bases de données', 'Les questions relatives aux bases de données', 2),
('sql', 'Les questions sur le langage SQL', 3),
('nosql', 'Les questions sur l’approche NoSQL', 4),
('php', 'Les questions relatives à PHP', 1);

INSERT INTO t_category_question
(question_id, category_name)
VALUES
(1, 'bases de données'),
(1, 'sql'),
(2, 'bases de données'),
(2, 'sql'),
(3, 'bases de données'),
(4, 'bases de données'),
(4, 'sql'),
(5, 'bases de données'),
(5, 'nosql');