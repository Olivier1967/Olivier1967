DROP TABLE IF EXISTS t_user;
/*TRUNCATE TABLE t_user;*/

DROP TABLE IF EXISTS t_question;
/*TRUNCATE TABLE t_question;*/

DROP TABLE IF EXISTS t_category_question;
/*TRUNCATE TABLE t_category_question;*/

CREATE TABLE IF NOT EXISTS t_user
(
    user_id INT(11) AUTO_INCREMENT,
	user_email VARCHAR(128) NOT NULL,
    user_lastname VARCHAR(50) NOT NULL,
    user_firstname VARCHAR(50) NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE (user_email)
);

CREATE TABLE IF NOT EXISTS t_question
(
	question_id INT(11) AUTO_INCREMENT,
	question_date date not null,
    question_label VARCHAR(255) NOT NULL,
    question_response TEXT,
    user_id int not null,
    PRIMARY KEY (question_id)
);

CREATE TABLE IF NOT EXISTS t_category
(
	category_name VARCHAR(30) not NULL,
    category_description VARCHAR(255) NULL,
    category_order INT (3) NOT NULL,
    PRIMARY KEY (category_name),
    UNIQUE (category_order)
);

CREATE TABLE IF NOT EXISTS t_category_question
(
    question_id int not null,
    category_name VARCHAR(30) not NULL,
   	PRIMARY KEY (question_id, category_name)
);

/* modifie la table t_question */
ALTER TABLE t_question ADD CONSTRAINT FK_question_user FOREIGN KEY (user_id) REFERENCES t_user(user_id);


/* modifie la table t_category_question */
ALTER TABLE t_category_question ADD CONSTRAINT FK_question_question FOREIGN KEY (question_id) REFERENCES t_question(question_id);
ALTER TABLE t_category_question ADD CONSTRAINT FK_question_category FOREIGN KEY (category_name) REFERENCES t_category(category_name);
