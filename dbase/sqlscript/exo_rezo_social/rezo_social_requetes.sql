/* 1. Sélectionner tous les utilisateurs (nom d’utilisateur + email). */
SELECT user_lastname, user_email
FROM t_user

/* 2. Sélectionner toutes les publications (titre, date, contenu, id utilisateur) 
triées par date de la plus récente à la plus ancienne. */
SELECT pub_titre, pub_date, pub_contenu, user_id
FROM t_publication
ORDER BY pub_date DESC;

/* 3. Sélectionner les publications (pub_id, date, titre) de l’utilisateur N°2. */
SELECT pub_id, pub_date, pub_titre
FROM t_publication
WHERE user_id = 2;


/* 4. Sélectionner les publications (pub_id, titre, contenu) dont le titre contient la lettre “a”.
 Le résultat est trié par le titre et par ordre décroissant. */
 SELECT pub_id, pub_titre, pub_contenu
 FROM t_publication
 WHERE pub_titre LIKE '%a%'
 ORDER BY pub_titre DESC;
 
 /* 5. Sélectionner les utilisateurs (id, nom, email) dont l’adresse email se termine par “com”. */
 SELECT user_id, user_lastname, user_email
 FROM t_user
 WHERE user_email LIKE '%com';
 
 /* 6. Sélectionner les publications triées par titre (ordre alphabétique) avec 
 le nom d’utilisateur de l’auteur (nécessite une jointure). */
 SELECT pub_titre, t_user.user_lastname
 FROM t_publication
 INNER JOIN t_user ON t_user.user_id = t_publication.user_id
 ORDER BY pub_titre ASC;
 