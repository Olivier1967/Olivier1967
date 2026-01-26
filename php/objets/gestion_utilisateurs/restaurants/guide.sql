
DROP DATABASE IF EXISTS guide;

CREATE DATABASE IF NOT EXISTS guide;

USE guide;

CREATE TABLE db_users
(
	users_id INT PRIMARY KEY AUTO_INCREMENT,
	users_name VARCHAR (50),
	users_password VARCHAR(255)
);

CREATE TABLE restaurants 
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    prix DECIMAL (4, 2) NOT NULL,
    commentaire TEXT NOT NULL,
    note DOUBLE NOT NULL,
    visite DATE NOT NULL  
);

ALTER TABLE restaurants AUTO_INCREMENT=1;

INSERT INTO `restaurants` (`nom`, `adresse`, `prix`, `commentaire`, `note`, `visite`) VALUES
('Le Coin des Saveurs', '12 Avenue des Lilas, 68100 Mulhouse', 32.90, 'Cuisine française généreuse, service impeccable et cadre chaleureux.', 7, '2021-04-12'),
('Chez Marcelin', '78 Rue de Belfort, 68200 Mulhouse', 42.00, 'Ambiance familiale, produits locaux et plats du terroir revisités.', 5, '2022-02-27'),
('L\'âtre des Amis', '45 Boulevard de la République, 68000 Colmar', 27.50, 'Bonne adresse pour les repas conviviaux, spécialités alsaciennes excellentes.', 9, '2020-07-15'),
('Bistro du Clocher', '3 Place du Clocher, 68240 Kaysersberg', 35.20, 'Petit bistrot charmant, carte variée mais service parfois lent.', 4, '2021-10-02'),
('La Table Étoilée', '21 Rue des Étoiles, 68130 Altkirch', 60.10, 'Expérience gastronomique raffinée, chef créatif et carte renouvelée.', 10, '2022-12-05'),
('Maison de Lumière', '9 Chemin du Canal, 68870 Bartenheim', 25.80, 'Un décor moderne et lumineux, plats simples mais savoureux.', 6, '2021-08-19'),
('Café des Rosiers', '15 Rue des Rosiers, 68300 Saint-Louis', 19.60, 'Petit déjeuner copieux, pâtisseries maison et terrasse agréable.', 8, '2021-03-11'),
('Chez Bastien', '66 Route de Strasbourg, 67210 Obernai', 53.25, 'Les poissons y sont cuisinés à la perfection, service attentionné.', 9, '2019-11-21'),
('Le Relais d\'Azur', '2 Allée de la Plage, 68128 Village-Neuf', 38.80, 'Fruits de mer frais, belle vue et ambiance détendue.', 5, '2021-06-30'),
('Balcon de Montmartre', '17 Rue du Balcon, 75018 Paris', 49.99, 'Restaurant romantique avec vue exceptionnelle, cuisine fine et inventive.', 7, '2022-05-14');

USE guide;

DELIMITER |
CREATE PROCEDURE afficherlistenote(IN p_limite DOUBLE)
BEGIN 
SELECT id, nom, adresse, prix, commentaire, note, visite AS "date de visite" FROM restaurants WHERE note>=p_limite;
END|
DELIMITER ;

SET @note_limite:=9;
CALL afficherlistenote(@note_limite);

ALTER TABLE restaurants ADD CONSTRAINT ck_note CHECK (note BETWEEN 0 AND 10);


SELECT * FROM restaurants WHERE nom LIKE '%ober%' OR adresse LIKE '%ober%' OR commentaire LIKE '%ober%';

        
