-- 1.Sélectionner tous les utilisateurs (identifiant, nom, prénom, email).
SELECT user_id, user_lastname, user_firstname, user_email
FROM t_user;

-- 2. Sélectionner toutes les questions (date, intitulé, réponse, identifiant utilisateur) triées par date de la plus ancienne à la plus récente
SELECT question_date, question_label AS intitulé, question_response, user_id
FROM t_question
ORDER BY question_date ASC;

/* 3. Sélectionner les questions 
(identifiant, date, intitulé, réponse)
 de l’utilisateur n°2. */
 
 -- titre
SELECT question_id, question_date, question_label AS intitulé, question_response
FROM t_question
where user_id = 2;

/* 4. Sélectionner les questions (date, intitulé, réponse, identifiant utilisateur) de l’utilisateur Eva Satiti. */
SELECT question_date, question_label AS intitulé, question_response, t_user.user_id
FROM t_question
INNER JOIN t_user ON t_question.user_id = t_user.user_id
where t_user.user_lastname = 'satiti';

/* 5. Sélectionner les questions (identifiant, date, intitulé, réponse, identifiant utilisateur) dont l’intitulé contient “SQL”.
 Le résultat est trié par le titre et par ordre décroissant. */
SELECT question_id, question_date, question_label AS intitulé, question_response, user_id
FROM t_question
WHERE question_label LIKE '%sql%' and question_label not like "%noSQL%" 
ORDER BY intitulé DESC;


/* 6. Sélectionner les catégories (nom, description) sans question associée. */
SELECT t_category.category_name, category_description
FROM t_category
left JOIN t_category_question ON t_category_question.category_name = t_category.category_name
WHERE question_id IS NULL OR question_id= '';

/* 7. Sélectionner les questions triées par titre (ordre alphabétique) avec le nom et prénom de l’auteur (nécessite une jointure). */
SELECT question_label AS intitulé, t_user.user_lastname, t_user.user_firstname
FROM t_question
INNER JOIN t_user ON t_question.user_id = t_user.user_id
ORDER BY intitulé;

/* 8. Sélectionner les catégories (nom) avec, pour chaque catégorie le nombre de questions associées (nécessite une jointure). */
-- WHERE question_label LIKE '%category_name%'

SELECT category_name, count(question_id)
FROM t_category_question
GROUP BY category_name;

SELECT t_category.category_name, count(question_id)
FROM t_category
INNER JOIN t_category_question ON t_category_question.category_name = t_category.category_name
GROUP BY category_name;


