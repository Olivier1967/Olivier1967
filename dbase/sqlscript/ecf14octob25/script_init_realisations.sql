DROP DATABASE IF EXISTS db_realisations;

CREATE DATABASE IF NOT EXISTS db_realisations;

USE db_realisations;

DROP TABLE IF EXISTS realisations;

CREATE TABLE realisations (
id_rea INT unsigned NOT NULL,
titre_rea VARCHAR (250) NOT NULL,
date_rea DATE NOT NULL,
texte_rea TEXT NOT null
);

ALTER TABLE realisations MODIFY id_rea INT NOT null PRIMARY KEY;

ALTER TABLE realisations modify id_rea int not null AUTO_INCREMENT;

-- SHOW CREATE TABLE realisations;

DROP TABLE IF EXISTS images;

CREATE TABLE images (
id_img INT unsigned NOT NULL,
url_img VARCHAR(250) NOT NULL,
nom_img VARCHAR(100)NOT NULL,
text_img VARCHAR(300) NOT NULL,
ext_img TEXT NOT null
);

ALTER TABLE images MODIFY id_img INT not null auto_increment PRIMARY KEY;

-- SHOW CREATE TABLE images;

/* regle 1 clef étrangère */

ALTER TABLE realisations ADD FOREIGN KEY (id_img) REFERENCES images(id_img);


ALTER TABLE images ADD FOREIGN KEY (id_rea) REFERENCES realisations(id_rea);

/* partie 2 question 3 */
SELECT nom_img, ext_img
FROM images
WHERE id_rea = 1;