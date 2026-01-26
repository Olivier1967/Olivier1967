
drop database if EXISTS db_cas_immeuble;

CREATE DATABASE db_cas_immeuble;


use db_cas_immeuble;

DROP TABLE IF EXISTS Immeuble;
DROP TABLE IF EXISTS Appartement;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Piece;

CREATE TABLE Immeuble(
 Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 adrNum VARCHAR(7) NOT NULL, 
 adrVoie VARCHAR(100) NOT NULL, 
 adrCodePostal VARCHAR(5) NOT NULL, 
 adrVille VARCHAR(30) NOT NULL, 
 fibreOptique TINYINT NOT NULL, 
 parkingPrivatif TINYINT NOT NULL
);

CREATE TABLE Appartement(
 immeuble INT(11), num INT(3) NOT NULL, 
 description LONGTEXT, 
 loyer DECIMAL(8,2) NOT NULL, 
 superficie DECIMAL(8,2) NOT NULL, 
 terrasse TINYINT(1) NOT NULL, 
 classeConso CHAR(1) NOT NULL, 
 chauffage CHAR(1) NOT NULL,
 placeParking TINYINT(1) NOT NULL, 
 prixParking DECIMAL(8,2),
 CONSTRAINT pk_appartement PRIMARY KEY (immeuble, num),
 CONSTRAINT fk_immeuble FOREIGN KEY (immeuble) REFERENCES Immeuble(id)
);

CREATE TABLE Photo(
 immeuble INT(11), 
 appartement INT(3), 
 reference INT(11) NOT NULL,
 titre VARCHAR(75), 
 description VARCHAR(255), 
 uri VARCHAR(120) NOT NULL,
 CONSTRAINT pk_photo PRIMARY KEY (immeuble, appartement, reference),
 CONSTRAINT fk_appartement_photo
 FOREIGN KEY (immeuble, appartement) REFERENCES Appartement(immeuble, num) 
);

CREATE TABLE Piece(
 immeuble INT(11), 
 appartement INT(3), 
 num INT(2) NOT NULL, 
 superficie DECIMAL(8,2) , 
 fonction VARCHAR(30),
 CONSTRAINT pk_piece PRIMARY KEY (immeuble, appartement, num),
 CONSTRAINT fk_appartement_piece 
 FOREIGN KEY (immeuble, appartement) REFERENCES Appartement(immeuble, num)
);