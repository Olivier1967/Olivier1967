DROP DATABASE IF EXISTS db_architecte;

CREATE DATABASE IF NOT EXISTS db_architecte;

USE db_architecte;

CREATE TABLE type_travaux(
   type_travaux_id INT AUTO_INCREMENT,
   type_travaux_libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(type_travaux_id),
   UNIQUE(type_travaux_libelle)
);

CREATE TABLE type_projets(
   type_projet_id INT AUTO_INCREMENT,
   type_projet_libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(type_projet_id),
   UNIQUE(type_projet_libelle)
);

CREATE TABLE adresses(
   adresse_id INT AUTO_INCREMENT,
   adresse_code_postal CHAR(5) NOT NULL,
   adresse_ville VARCHAR(50) NOT NULL,
   adresse_num_voie INT,
   adresse_voie VARCHAR(255) NOT NULL,
   PRIMARY KEY(adresse_id)
);

CREATE TABLE type_clients(
   type_client_id INT AUTO_INCREMENT,
   type_client_libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(type_client_id),
   UNIQUE(type_client_libelle)
);

CREATE TABLE fonctions(
   fonction_id INT AUTO_INCREMENT,
   fonction_nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(fonction_id),
   UNIQUE(fonction_nom)
);

CREATE TABLE employes(
   emp_matricule INT AUTO_INCREMENT,
   emp_nom VARCHAR(50) NOT NULL,
   emp_prenom VARCHAR(50) NOT NULL,
   emp_date_embauche DATE NOT NULL,
   fonction_id INT NOT NULL,
   PRIMARY KEY(emp_matricule),
   FOREIGN KEY(fonction_id) REFERENCES fonctions(fonction_id)
);

CREATE TABLE clients(
   client_ref INT AUTO_INCREMENT,
   client_nom VARCHAR(50) NOT NULL,
   client_telephone CHAR(16) NOT NULL,
   type_client_id INT NOT NULL,
   adresse_id INT NOT NULL,
   PRIMARY KEY(client_ref),
   FOREIGN KEY(type_client_id) REFERENCES type_clients(type_client_id),
   FOREIGN KEY(adresse_id) REFERENCES adresses(adresse_id)
);

CREATE TABLE projets(
   projet_ref INT AUTO_INCREMENT,
   projet_date_depot DATE NOT NULL,
   projet_date_fin_prevue DATE NOT NULL,
   projet_date_fin_effective DATE,
   projet_superficie_totale INT NOT NULL,
   projet_superficie_batie INT NOT NULL,
   projet_prix DECIMAL(10,2) NOT NULL,
   client_ref INT NOT NULL,
   emp_matricule INT NOT NULL,
   adresse_id INT NOT NULL,
   type_travaux_id INT NOT NULL,
   type_projet_id INT NOT NULL,
   PRIMARY KEY(projet_ref),
   FOREIGN KEY(client_ref) REFERENCES clients(client_ref),
   FOREIGN KEY(emp_matricule) REFERENCES employes(emp_matricule),
   FOREIGN KEY(adresse_id) REFERENCES adresses(adresse_id),
   FOREIGN KEY(type_travaux_id) REFERENCES type_travaux(type_travaux_id),
   FOREIGN KEY(type_projet_id) REFERENCES type_projets(type_projet_id)
);

CREATE TABLE participer(
   emp_matricule INT,
   projet_ref INT,
   PRIMARY KEY(emp_matricule, projet_ref),
   FOREIGN KEY(emp_matricule) REFERENCES employes(emp_matricule),
   FOREIGN KEY(projet_ref) REFERENCES projets(projet_ref)
);


/* les insert into */
INSERT INTO type_travaux 
(type_travaux_id, type_travaux_libelle) 
VALUES
(1, 'Construction'),
(2, 'Aménagement'),
(3, 'Rénovation'),
(4, 'Réhabilitation'),
(5, 'Restauration');


INSERT INTO fonctions 
(fonction_id, fonction_nom)
VALUES
(1,'Architecte'),
(2,'Dessinateur'),
(3,'Administratif');

INSERT INTO type_clients(type_client_id,type_client_libelle)
VALUES 
(1,'Particulier'),
(2,'institution publique'),
(3,'institution privée'),
(4,'promoteur'),
(5,'autre');

INSERT INTO type_projets 
(type_projet_id, type_projet_libelle)
VALUES
(1, "Maison"),
(2, "Appartement"),
(3, "Chalet"),
(4, "Immeuble"), 
(5, "Hôpital"),
(6, "Ecole"),
(7, "locaux commerciaux");

INSERT INTO adresses
(adresse_code_postal, adresse_ville, adresse_num_voie, adresse_voie)
VALUES 
('06000', 'Nice', 27, 'Rue Dabray'),
('06380', 'Sospel', 16, 'Rue de la Republique'),
('68200', 'Mulhouse', 7, 'Boulevard des Nations'),
('13500', 'Martigues', 12, 'Av. Georges Braque'),
('75017', 'Paris', 27, 'Rue des Renaudes');

INSERT INTO clients(client_nom, client_telephone, type_client_id, adresse_id)
VALUES
    ('Ville de Nice', '0450047785', 2, 1),
    ('BOSS', '0615486223', 3, 2),
    ('Lili', '0685941335', 1, 3),
    ('ESCALA', '0102529164', 4, 4),
    ('Mystère', '0000000000', 5, 5);

INSERT INTO employes(emp_matricule, emp_nom, emp_prenom, emp_date_embauche, fonction_id) VALUES 
(1, "Roussotte", "Kévin", "2023-08-02", 1),
(2, "Schieber", "Florian", "2023-08-03", 2),
(3, "Robson", "Natana", "2023-08-04", 3),
(4, "Golay", "Jerry", "2023-08-07", 1),
(5, "Neymar", "Jean", "2023-08-07", 2),
(6, "Desplantes", "Guillaume", "2023-08-07", 2),
(7, "Desplanques", "Guy", "2010-08-07", 3);

INSERT INTO projets 
(   projet_ref, projet_date_depot, projet_date_fin_prevue, projet_date_fin_effective,projet_superficie_totale, projet_superficie_batie,
    projet_prix, client_ref, emp_matricule, adresse_id, type_travaux_id, type_projet_id )
VALUES 
('1', '2022-11-02', '2022-08-12', '2022-09-27', '500', '250', '9999.99', '5', '1', '1', '1', '1'),
('2', '2022-12-15', '2023-01-14', '2023-01-14', '700', '690', '100000', '4', '1', '2', '5', '3'),
('3', '2023-01-02', '2023-10-01', NULL,         '500', '300', '5412', '3', '4', '3', '4', '4'),
('4', '2023-02-10', '2023-10-02', NULL,         '200', '190', '4000', '2', '1', '4', '3', '2'),
('5', '2023-04-23', '2023-12-22', NULL,         '90', '50', '2500', '1', '4', '5', '3', '2');

INSERT INTO participer (emp_matricule,projet_ref)
VALUES 
(2,1),
(3,1),
(7,1),
(6,2),
(5,2),
(5,3),
(6,4),
(7,4),
(2,4),
(3,4);
