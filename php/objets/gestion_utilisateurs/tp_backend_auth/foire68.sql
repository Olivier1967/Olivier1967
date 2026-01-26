DROP DATABASE IF EXISTS foire68;

CREATE DATABASE IF NOT EXISTS foire68;

USE foire68;

CREATE TABLE IF NOT EXISTS candidats (
id_user INT UNSIGNED NOT NULL AUTO_INCREMENT,
lastname_user varchar(50) NOT NULL,
firstname_user varchar(50) NOT NULL,
email_user varchar(150) NOT NULL,
pass_user varchar(500) NOT NULL,
department_user int UNSIGNED NOT NULL,
age_user tinyint UNSIGNED NOT NULL,
PRIMARY KEY (id_user)
) ENGINE=INNODB;

UPDATE candidats
SET archive_user = 1;

ALTER TABLE candidats ADD CONSTRAINT ck_age CHECK (age_user >=18);
ALTER TABLE candidats ADD CONSTRAINT uk_verif_mail UNIQUE (email_user);
ALTER TABLE candidats ADD CONSTRAINT ck_formatmail CHECK (email_user LIKE "%_@_%");
ALTER TABLE candidats ADD archive_user TINYINT NOT NULL;
ALTER TABLE candidats ADD constraint fk_deptuser FOREIGN KEY (department_user) REFERENCES departements(id_dep);
ALTER TABLE candidats ADD CONSTRAINT ck_archive CHECK (archive_user IN (0, 1));

ALTER TABLE candidats AUTO_INCREMENT=1;

INSERT INTO candidats (lastname_user, firstname_user, email_user, pass_user, department_user, age_user, archive_user) VALUES
('Martin', 'Gabriel', 'gabriel.martin@email.fr', '$argon2id$v=19$m=65536,t=4,p=1$FM2d2LK9xzEwp/C/DtWgpA$uvSQ+cvLCW/BVvfIV6XYiKA2VnbfJl+RieGhVmCOO7A', 75, 24, 0),
('Bernard', 'Léa', 'lea.bernard@test.com', '$argon2id$v=19$m=65536,t=4,p=1$HlVJnwrjUURq7NrQxYjAIg$GM9ZgKrrAY93L9P06xZeFs4IAiDpMFVQTt7YBtHFR5w', 69, 31, 0),
('Thomas', 'Lucas', 'lucas.thomas@provider.net', '$argon2id$v=19$m=65536,t=4,p=1$SVOMrhFKyzV8ra3IBS5BOQ$jDNGmUuGyIv9RzmD+wNXHeHeKQD2pwva3exmf6iUwDk', 33, 45, 0),
('Petit', 'Emma', 'emma.petit@email.fr', '$argon2id$v=19$m=65536,t=4,p=1$YlFBeErHjhViRJ/HfBdU6w$2uKqT/LdRIU49hDZhVA586SywnLZKwsDBcPcIMpugQk', 13, 19, 0),
('Robert', 'Louis', 'louis.robert@webmail.org', '$argon2id$v=19$m=65536,t=4,p=1$Bj4p3KmnxsqLY1V91pWc5g$zK1EwAw/WYXB9EB5VXRyG6Zt9HytGKknjS2H0HV+qoc', 59, 52, 1),
('Richard', 'Jade', 'jade.richard@email.fr', '$argon2id$v=19$m=65536,t=4,p=1$PsHyapPrF45O2IojbA7etg$Hoct6k/tyeAygt0NMA+EaNJjU7lmKDox1F3r+hYF8Y4', 44, 28, 0),
('Durand', 'Hugo', 'hugo.durand@test.com', '$argon2id$v=19$m=65536,t=4,p=1$B0h5GugduDrwm6OKUFSw8A$mApisZDyETobref09PPU4UJMh6OxLA3Z292QgtIzZNs', 31, 22, 0),
('Dubois', 'Chloé', 'chloe.dubois@provider.net', '$argon2id$v=19$m=65536,t=4,p=1$nvwScheU7ieBXcH0majfRj$9sDNTIYIfsGZOS+TgNNGn0cwt/075v9H5hG2Wj5+Lkw', 6, 35, 0),
('Moreau', 'Arthur', 'arthur.moreau@email.fr', '$argon2id$v=19$m=65536,t=4,p=1$LlAW37SJVc1aRFu7Ni4OqA$R8nzqSyQrxGVcB0R+t4RS4478mjYHKqHZ4rtfNRcPqI', 92, 41, 0),
('Laurent', 'Manon', 'manon.laurent@webmail.org', '$argon2id$v=19$m=65536,t=4,p=1$wEqJdNe5vHNCs3lDlm9RoQ$WtQbXjckwXoHwn05NyT8lUu8tQYDSdC4qp9n3NwcU7M', 17, 26, 0);



INSERT INTO candidats (lastname_user, firstname_user, email_user, pass_user, department_user, age_user, archive_user) VALUES
('Martin', 'Gabriel', 'gabriel.martin@email.fr', 'Gabriel2024!', 75, 24, 0),
('Bernard', 'Léa', 'lea.bernard@test.com', 'Chocolat123', 69, 31, 0),
('Thomas', 'Lucas', 'lucas.thomas@provider.net', 'Lucas1980', 33, 45, 0),
('Petit', 'Emma', 'emma.petit@email.fr', 'EmmaPetit!', 13, 19, 0),
('Robert', 'Louis', 'louis.robert@webmail.org', 'Azerty123', 59, 52, 1),
('Richard', 'Jade', 'jade.richard@email.fr', 'Jade_2025', 44, 28, 0),
('Durand', 'Hugo', 'hugo.durand@test.com', 'HugoBoss99', 31, 22, 0),
('Dubois', 'Chloé', 'chloe.dubois@provider.net', 'Soleil!123', 06, 35, 0),
('Moreau', 'Arthur', 'arthur.moreau@email.fr', 'ArthurM92', 92, 41, 0),
('Laurent', 'Manon', 'manon.laurent@webmail.org', 'ManonLola', 17, 26, 0),
('Simon', 'Jules', 'jules.simon@test.com', 'JulesVerne', 29, 33, 0),
('Michel', 'Zoé', 'zoe.michel@email.fr', 'Zoe_Michel', 67, 29, 0),
('Lefebvre', 'Raphaël', 'raphael.lefebvre@provider.net', 'Raphael54!', 54, 58, 1),
('Leroy', 'Alice', 'alice.leroy@email.fr', 'Wonderland', 76, 21, 0),
('Roux', 'Nathan', 'nathan.roux@test.com', 'Nathan1234', 83, 37, 0),
('David', 'Lina', 'lina.david@webmail.org', 'LinaDavid95', 95, 25, 0),
('Bertrand', 'Paul', 'paul.bertrand@email.fr', 'Paulo_21', 21, 49, 0),
('Morel', 'Sarah', 'sarah.morel@provider.net', 'SarahM35!', 35, 30, 0),
('Fournier', 'Tom', 'tom.fournier@test.com', 'TomTomGO', 49, 23, 0),
('Girard', 'Camille', 'camille.girard@email.fr', 'Camille62', 62, 55, 1),
('Bonnet', 'Théo', 'theo.bonnet@webmail.org', 'TheoBonnet91', 91, 27, 0),
('Dupont', 'Louise', 'louise.dupont@email.fr', 'Loulou78!', 78, 32, 0),
('Lambert', 'Adam', 'adam.lambert@test.com', 'Adam_Lambert', 14, 20, 0),
('Fontaine', 'Mila', 'mila.fontaine@provider.net', 'MilaF85', 85, 44, 0),
('Rousseau', 'Nolan', 'nolan.rousseau@email.fr', 'NolanR50', 50, 36, 0),
('Vincent', 'Eva', 'eva.vincent@webmail.org', 'EvaVincent01', 01, 24, 0),
('Muller', 'Enzo', 'enzo.muller@test.com', 'Ferrari68', 68, 29, 0),
('Lefevre', 'Anna', 'anna.lefevre@email.fr', 'Anna_Paris', 75, 18, 0),
('Faure', 'Mathis', 'mathis.faure@provider.net', 'Mathis19!', 19, 42, 0),
('Andre', 'Elena', 'elena.andre@email.fr', 'Elena38Isere', 38, 31, 0),
('Mercier', 'Axel', 'axel.mercier@test.com', 'AxelM42!', 42, 53, 1),
('Blanc', 'Inès', 'ines.blanc@webmail.org', 'InesB08', 08, 26, 0),
('Guerin', 'Ethan', 'ethan.guerin@email.fr', 'EthanG93', 93, 22, 0),
('Boyer', 'Louna', 'louna.boyer@provider.net', 'LounaB24', 24, 39, 0),
('Garnier', 'Sacha', 'sacha.garnier@test.com', 'Sacha84!', 84, 34, 0),
('Chevalier', 'Juliette', 'juliette.chevalier@email.fr', 'Juju_60', 60, 47, 0),
('Francois', 'Maël', 'mael.francois@webmail.org', 'MaelF72', 72, 19, 0),
('Legrand', 'Romane', 'romane.legrand@email.fr', 'Romane28!', 28, 28, 0),
('Gauthier', 'Liam', 'liam.gauthier@test.com', 'LiamG11', 11, 33, 0),
('Garcia', 'Jeanne', 'jeanne.garcia@provider.net', 'Jeanne66!', 66, 61, 1),
('Perrin', 'Noah', 'noah.perrin@email.fr', 'NoahP56', 56, 25, 0),
('Robin', 'Lola', 'lola.robin@webmail.org', 'LolaR89', 89, 21, 0),
('Clement', 'Tiago', 'tiago.clement@test.com', 'Tiago03!', 03, 40, 0),
('Morin', 'Agathe', 'agathe.morin@email.fr', 'AgatheM37', 37, 30, 0),
('Nicolas', 'Antoine', 'antoine.nicolas@provider.net', 'Antoine45', 45, 56, 0),
('Henry', 'Julia', 'julia.henry@email.fr', 'JuliaH94!', 94, 23, 0),
('Roussel', 'Valentin', 'valentin.roussel@test.com', 'Valentin80', 80, 27, 0),
('Mathieu', 'Clara', 'clara.mathieu@webmail.org', 'ClaraM51', 51, 35, 0),
('Gautier', 'Gabin', 'gabin.gautier@email.fr', 'Gabin22!', 22, 18, 0),
('Masson', 'Margaux', 'margaux.masson@provider.net', 'Margaux75', 75, 46, 0);
 



INSERT INTO candidats VALUES (id_user, "Haddock","Archibald", "haddock@test.fr","admin1234",68, 50, 0);

CREATE TABLE `departements` (
`id_dep` INT UNSIGNED NOT NULL PRIMARY KEY,
`Name` varchar(50) NOT NULL,
`dep_actif` INT UNSIGNED NOT NULL,
`dep_taux` decimal(5,2) NOT NULL
) ENGINE=INNODB ;

INSERT INTO `departements` (`id_dep`, `Name`, `dep_actif`, `dep_taux`) VALUES
(1, '01 - Ain', 1, 1.00),
(2, '02 - Aisne', 1, 1.00),
(3, '03 - Allier', 1, 1.00),
(4, '04 - Alpes-de-Haute-Provence', 1, 1.00),
(5, '05 - Hautes-Alpes', 1, 1.00),
(6, '06 - Alpes-Maritimes', 1, 1.00),
(7, '07 - Ardèche', 1, 1.00),
(8, '08 - Ardennes', 1, 1.00),
(9, '09 Ariège', 1, 1.00),
(10, '10 - Aube', 1, 1.00),
(11, '11 - Aude', 1, 1.00),
(12, '12 - Aveyron', 1, 1.00),
(13, '13 - Bouches-du-Rhône', 1, 1.00),
(14, '14 - Calvados', 1, 1.00),
(15, '15 - Cantal', 1, 1.00),
(16, '16 - Charente', 1, 1.00),
(17, '17 - Charente-Maritime', 1, 1.00),
(18, '18 - Cher', 1, 1.00),
(19, '19 - Corrèze', 1, 1.00),
(20, '2A 2B - Départements Corse', 1, 1.00),
(21, '21 - Côte-d Or', 1, 1.00),
(22, '22 - Côtes-d Armor', 1, 1.00),
(23, '23 - Creuse', 1, 1.00),
(24, '24 - Dordogne', 1, 1.00),
(25, '25 - Doubs', 1, 1.00),
(26, '26 - Drôme', 1, 1.00),
(27, '27 - Eure', 1, 1.00),
(28, '28 - Eure-et-Loir', 1, 1.00),
(29, '29 - Finistère', 1, 1.00),
(30, '30 - Gard', 1, 1.00),
(31, '31 - Haute-Garonne', 1, 1.00),
(32, '32 - Gers', 1, 1.00),
(33, '33 - Gironde', 1, 1.00),
(34, '34 - Hérault', 1, 1.00),
(35, '35 - Ille-et-Vilaine', 1, 1.00),
(36, '36 - Indre', 1, 1.00),
(37, '37 - Indre-et-Loire', 1, 1.00),
(38, '38 - Isère', 1, 1.00),
(39, '39 - Jura', 1, 1.00),
(40, '40 - Landes', 1, 1.00),
(41, '41 - Loir-et-Cher', 1, 1.00),
(42, '42 - Loire', 1, 1.00),
(43, '43 - Haute-Loire', 1, 1.00),
(44, '44 - Loire-Atlantique', 1, 1.00),
(45, '45 - Loiret', 1, 1.00),
(46, '46 - Lot', 1, 1.00),
(47, '47 - Lot-et-Garonne', 1, 1.00),
(48, '48 - Lozère', 1, 1.00),
(49, '49 - Maine-et-Loire', 1, 1.00),
(50, '50 - Manche', 1, 1.00),
(51, '51 - Marne', 1, 1.00),
(52, '52 - Haute-Marne', 1, 1.00),
(53, '53 - Mayenne', 1, 1.00),
(54, '54 - Meurthe-et-Moselle', 1, 1.00),
(55, '55 - Meuse', 1, 1.00),
(56, '56 - Morbihan', 1, 1.00),
(57, '57 - Moselle', 1, 1.00),
(58, '58 - Nièvre', 1, 1.00),
(59, '59 - Nord', 1, 1.00),
(60, '60 - Oise', 1, 1.00),
(61, '61 - Orne', 1, 1.00),
(62, '62 - Pas-de-Calais', 1, 1.00),
(63, '63 - Puy-de-Dôme', 1, 1.00),
(64, '64 - Pyrénées-Atlantiques', 1, 1.00),
(65, '65 - Hautes-Pyrénées', 1, 1.00),
(66, '66 - Pyrénées-Orientales', 1, 1.00),
(67, '67 - Bas-Rhin', 1, 1.00),
(68, '68 - Haut-Rhin', 1, 1.00),
(69, '69 - Rhône', 1, 1.00),
(70, '70 - Haute-Saône', 1, 1.00),
(71, '71 - Saône-et-Loire', 1, 1.00),
(72, '72 - Sarthe', 1, 1.00),
(73, '73 - Savoie', 1, 1.00),
(74, '74 - Haute-Savoie', 1, 1.00),
(75, '75 - Paris', 1, 1.00),
(76, '76 - Seine-Maritime', 1, 1.00),
(77, '77 - Seine-et-Marne', 1, 1.00),
(78, '78 - Yvelines', 1, 1.00),
(79, '79 - Deux-Sèvres', 1, 1.00),
(80, '80 - Somme', 1, 1.00),
(81, '81 - Tarn', 1, 1.00),
(82, '82 - Tarn-et-Garonne', 1, 1.00),
(83, '83 - Var', 1, 1.00),
(84, '84 - Vaucluse', 1, 1.00),
(85, '85 - Vendée', 1, 1.00),
(86, '86 - Vienne', 1, 1.00),
(87, '87 - Haute-Vienne', 1, 1.00),
(88, '88 - Vosges', 1, 1.00),
(89, '89 - Yonne', 1, 1.00),
(90, '90 - Territoire de Belfort', 1, 1.00),
(91, '91 - Essonne', 1, 1.00),
(92, '92 - Hauts-de-Seine', 1, 1.00),
(93, '93 - Seine-Saint-Denis', 1, 1.00),
(94, '94 - Val-de-Marne', 1, 1.00),
(95, '95 - Val-dOise', 1, 1.00);


DELIMITER |
CREATE TRIGGER before_delete_candidat BEFORE DELETE
ON candidats FOR EACH ROW
BEGIN
IF OLD.archive_user <>1
THEN
INSERT INTO Erreur (erreur) VALUES ('Erreur : le candidat doit être archivé');
END IF;
END|
DELIMITER ;

DELETE FROM candidats where lastname_user="Haddock";

CREATE TABLE Erreur (id TINYINT unsigned AUTO_INCREMENT PRIMARY KEY,
 erreur VARCHAR (300) UNIQUE);
 
INSERT INTO Erreur (erreur) VALUES ('le candidat doit être archivé');

SELECT * FROM candidats;
