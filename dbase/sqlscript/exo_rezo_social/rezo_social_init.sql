drop database if EXISTS db_rezo_social;

CREATE DATABASE db_rezo_social;

use db_rezo_social;

DROP TABLE IF EXISTS t_publication;
/*TRUNCATE TABLE t_publication;*/

DROP TABLE IF EXISTS t_user;
/*TRUNCATE TABLE t_user;*/

DROP TABLE IF EXISTS t_aimer;
/*TRUNCATE TABLE t_aimer;*/

CREATE TABLE IF NOT EXISTS t_aimer
(
   user_id int,
   pub_id int,
   PRIMARY KEY (user_id, pub_id)
);

CREATE TABLE IF NOT EXISTS t_publication
(
	pub_id INT(11) AUTO_INCREMENT,
	pub_date datetime not null,
   pub_titre VARCHAR(255) NOT NULL,
   pub_contenu TEXT,
   user_id int,
   PRIMARY KEY (pub_id)
);

CREATE TABLE IF NOT EXISTS t_user
(
    user_id INT(11),
    user_lastname VARCHAR(32) NOT NULL,
	user_email VARCHAR(128) NOT NULL,
	PRIMARY KEY (user_id)
);


/* modifie la table t_publication */
ALTER TABLE t_publication ADD CONSTRAINT FK_publication_user FOREIGN KEY (user_id) REFERENCES t_user(user_id);

-- alter table t_publication drop constraint FK_publication_user;

/* modifie la table t_category_question */
ALTER TABLE t_aimer ADD CONSTRAINT FK_aimer_user FOREIGN KEY (user_id) REFERENCES t_user(user_id);
ALTER TABLE t_aimer ADD CONSTRAINT FK_aimer_publication FOREIGN KEY (pub_id) REFERENCES t_publication(pub_id);

-- alter table t_aime drop constraint FK_aimer_user;
-- alter table t_aime drop constraint FK_aimer_publication;