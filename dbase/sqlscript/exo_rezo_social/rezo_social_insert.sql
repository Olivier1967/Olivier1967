INSERT INTO t_user 
(user_id, user_lastname, user_email) 
VALUES 
(1, 'zorro','zorb@example.com'),
(2, 'patchouli','patchouli@example.fr'),
(3, 'eva','eva.stt@example.com');

INSERT INTO t_publication
(pub_date, pub_titre, pub_contenu, user_id) 
VALUES
('2024-11-23 14:30', 'il fait beau', 'Quel beau soleil aujourd’hui !', 3),
('2024-11-23 09:15', 'Les bonbons', 'Les bonbons, c’est bon', 2),
('2024-11-27 08:17', 'Super resto', 'J’ai découvert un super restaurant hier soir.', 1),
('2024-12-05 17:52', 'Album disponible', 'Nouvel album de mon groupe préféré !', 2),
('2024-12-15 10:05', 'Aidez-moi', 'Je cherche une recette de gâteau au chocolat.', 3);