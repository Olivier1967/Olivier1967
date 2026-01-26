/* Question 1. Rédiger le trigger permettant de vérifier la contrainte suivante :
- Le prix de la place de parking d’un appartement peut et doit être NULL si l’appartement ne possède pas de place de parking.*/

SHOW TRIGGERs;

DROP TRIGGER IF EXISTS set_parking_null;

DELIMITER $$
 CREATE TRIGGER set_parking_null
 BEFORE INSERT 
 ON Appartement
 FOR EACH ROW
	BEGIN
	 	IF (NEW.placeParking = 0) THEN
	 	SET NEW.prixParking = NULL;
	 	END IF;
 	END $$
 DELIMITER;
 
 /* trigger appart avec erreur */

SELECT 1, 2 INTO @a; -- pour crée une erreur

-- Création de la table Erreur
CREATE TABLE Erreur (
id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
erreur VARCHAR(255) UNIQUE);

-- Insertion de l'erreur qui nous intéresse
INSERT INTO Erreur (erreur) VALUES
('Erreur : pas de place parking sont prix sera NULL.');

DROP TRIGGER IF EXISTS set_parking_null;

DELIMITER ||
 CREATE TRIGGER set_parking_null
 BEFORE INSERT 
 ON Appartement
 FOR EACH ROW
	BEGIN
	 	IF (NEW.placeParking = 0) THEN
	 	SET NEW.prixParking = NULL;
	 	END IF;
 	END;
 	INSERT INTO Erreur (Erreur) VALUES ('Erreur : pas de place parking sont prix sera NULL.');
||
 DELIMITER ;
 
/* Question 2. On souhaite que la contrainte suivante soit vérifiée :
- La superficie totale d’un appartement doit être égale à la somme de la superficie de chacune de ses pièces.
 Pour ce faire, créer le trigger qui permet de mettre à jour la superficie d’un appartement à l’insertion d’une pièce.*/
 
 DROP TRIGGER IF EXISTS add_superficie_total;

DELIMITER $$
 CREATE TRIGGER add_superficie_total
 BEFORE INSERT
 ON Piece
 FOR EACH ROW
	BEGIN
	 	SET NEW.superficie = ;
	 	END IF;
 	END $$
 DELIMITER;



