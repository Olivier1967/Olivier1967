INSERT INTO `Immeuble`
 ( `adrNum`, `adrVoie`, `adrCodePostal`, `adrVille`, `fibreOptique`, `parkingPrivatif`) 
 VALUES
	( '20', 'rue beau regard', '68000', 'colmar', 1, 1),
	( '35', 'avenue mitterand', '68200', 'mulhouse', 1, 0),
	( '11', 'rue de la gare', '68400', 'cernay', 0, 0);
	

INSERT INTO `Appartement` 
(`immeuble`, `num`, `description`, `loyer`, `superficie`, `terrasse`, `classeConso`, `chauffage`, `placeParking`, `prixParking`) 
VALUES
	(1, 1, 'apparte f1, cuisine, salon, canape', 650.00, 30.00, 0, 'c', 'n', 0, 0.00),
	(2, 15, 'apparte f2, salon, cuisine, chambre a coucher', 850.00, 60.00, 0, 'b', 'o', 1, 80.00),
	(3, 8, 'apparte f3, salon, cuisine, chambre a coucher', 950.00, 80.00, 1, 'b', 'o', 1, 85.00);


INSERT INTO Photo
(immeuble, appartement, REFERENCE, titre, description, uri)
VALUES
(1, 1, 1234, 'beau regard', 'apparte f2, salon, cuisine, chambre a coucher', 'ISBN 0-476-35557-1'),
(2, 15, 5678, 'mitterand', 'apparte f3, salon, cuisine, chambre a coucher', 'ISBN 0-376-35556-2'),
(3, 8, 3672, 'gare', 'apparte f1, cuisine, salon, canape', 'ISBN 0-274-35551-3');

INSERT INTO Piece
 (immeuble, appartement, num, superficie, fonction)
 VALUES
 (1, 1, 1, 30, 'salon'),
 (2, 15, 2, 15, 'cuisine'),
 (3, 8, 3, 20, 'chambre');
 

/* exemple insert into pour trigger */
INSERT INTO Immeuble
 (adrNum, adrVoie, adrCodePostal, adrVille, fibreOptique, parkingPrivatif) 
VALUES
 ('7', 'Place de l\'étoile', '45000', 'ORLEANS', 1, 1);
 
 INSERT INTO Appartement
 (immeuble, num, description, loyer, superficie, terrasse, classeConso, chauffage, placeParking, prixParking) 
VALUES 
 (3, 4, 'Appartement 3.1', 950.00, 85.00, 1, 'b', 'B', 0, 85.00),
 (2, 112, 'Appartement 2.15', 825.00, 86, 1, 'C', 'E', 0, 55.00),
 (1, 3, 'Appartement 1.3', 750.00, 86, 1, 'C', 'E', 1, 50.00);
 
INSERT INTO Appartement
(immeuble, num, description, loyer, superficie, terrasse, classeConso, chauffage, placeParking, prixParking) 
VALUES
(2, 112, 'Appartement 2.15', 825.00, 86, 1, 'C', 'E', 0, 55.00);
 
 
 DELETE FROM Appartement
 WHERE num = 2;
 
 /* fin insert trigger */
 
 
 UPDATE Appartement
 SET prixParking = NULL
 WHERE placeParking = 0;
 
 UPDATE Appartement
 SET prixParking = 0
 WHERE placeParking = 0;
 
 SELECT * FROM Appartement;