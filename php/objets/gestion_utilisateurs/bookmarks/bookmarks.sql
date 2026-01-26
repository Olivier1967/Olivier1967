DROP DATABASE IF EXISTS db_bookmarks;

CREATE DATABASE IF NOT EXISTS db_bookmarks;

USE db_bookmarks;

CREATE TABLE IF NOT EXISTS bookmarks (
id_bookmarks INT UNSIGNED NOT NULL auto_increment,
title_bookmarks VARCHAR(255) NOT NULL,
url_bookmarks VARCHAR(255) NOT NULL,
PRIMARY KEY (id_bookmarks)
) ENGINE=INNODB;

ALTER TABLE bookmarks  CHANGE COLUMN id_bookmarks id_bookmarks INT UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE bookmarks modify id_bookmarks INT UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE bookmarks AUTO_INCREMENT=1;

INSERT INTO bookmarks VALUES 
(NULL,'PHP Official', 'https://php.net'),
(NULL,'toto le plus beau', 'http://toto'),
(NULL,'toto', 'http://example.com'),
(NULL,'tato', 'http://exemple.com'),
(NULL,'CRM', 'https://arfp.asso.fr');

DELETE FROM bookmarks;