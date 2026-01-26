-- Création de la base de données
DROP DATABASE if EXISTS compaerien;
CREATE DATABASE IF NOT EXISTS compaerien;
USE compaerien;

-- drop table
DROP TABLE IF EXISTS avion;
DROP TABLE IF EXISTS pilote;
DROP TABLE IF EXISTS vol;

-- table avion
CREATE Table avion (
    av_id INT AUTO_INCREMENT,
    av_marque VARCHAR(50) NOT NULL,
    av_type VARCHAR(50) NOT NULL,
    av_capacite int not null,
    av_localisation varchar(50) not null,
    PRIMARY key (av_id)
);

ALTER TABLE avion AUTO_INCREMENT = 100;

CREATE TABLE pilote (
	pil_id INT AUTO_INCREMENT,
	pil_nom VARCHAR(50) NOT NULL,
	pil_adresse VARCHAR(100) NOT NULL,
	PRIMARY KEY (pil_id)
);

CREATE TABLE vol (
	vol_id VARCHAR(10) NOT NULL,
	avion_id INT NOT NULL,
	pilote_id INT NOT NULL,
	vol_villeDepart VARCHAR(50) NOT NULL,
	vol_villeArrive VARCHAR(50) NOT NULL,
	vol_heureDepart INT NOT NULL,
	vol_heureArrive INT NOT NULL,
	PRIMARY KEY (vol_id)
);

/* modifie la table vol pour clef étrangère */
ALTER TABLE vol ADD CONSTRAINT FK_vol_avion FOREIGN KEY (avion_id) REFERENCES avion(av_id);
ALTER TABLE vol ADD CONSTRAINT FK_vol_pilote FOREIGN KEY (pilote_id) REFERENCES pilote(pil_id);


/* php

CREATE TABLE [dbo].[ProductTBL](
    [Product_Id] [char](6) NOT NULL)

--[Product_Id] primary key
declare @NewIDD varchar(6);
DECLARE @i int;
SET @i=(select ISNULL( Convert(int, max(REPLACE(Product_Id,'P',''))+1),1) from ProductTBL);
SET @NewIDD=(select ISNULL( max(Product_Id),'P00001') from ProductTBL)
SET @NewIDD=REPLACE(@newIDD, right(@newIDD,LEN(@i)),@i);

***** autre long :
create table temp_so (prikey varchar(100) primary key, name varchar(100))

create function dbo.fn_AutoIncrementPriKey_so ()
returns varchar(100)
as
begin
    declare @prikey varchar(100)
    set @prikey = (select top (1) left(prikey,2) + cast(cast(stuff(prikey,1,2,'') as int)+1 as varchar(100)) from temp_so order by prikey desc)
    return isnull(@prikey, 'SB3000')
end

alter table temp_so
add constraint df_temp_prikey
default dbo.[fn_AutoIncrementPriKey_so]() for prikey

insert into temp_so (name) values ('Rohit')
 -- 4 fois

select * from temp_so
prikey  name
SB3000  Rohit
SB3001  Rohit
SB3002  Rohit
SB3003  Rohit
***************
*/

-- Insertion des avions
INSERT INTO avion
(av_marque, av_type, av_capacite, av_localisation)
VALUES
('airbus', 'a320', 300, 'nice'),
('boeing', 'b707', 250, 'paris'),
('airbus', 'a320', 300, 'toulouse'),
('caravelle', 'caravelle', 200, 'toulouse'),
('boeing', 'b747', 400, 'paris'),
('airbus', 'a320', 300, 'grenoble'),
('atr', 'atr42', 50, 'paris'),
('boeing', 'b727', 300, 'lyon'),
('boeing', 'b727', 300, 'nantes'),
('airbus', 'a340', 350, 'bastia');

-- Insertion des pilotes
INSERT INTO pilote (pil_nom, pil_adresse)
VALUES
('serge', 'nice'),
('jean', 'paris'),
('claude', 'grenoble'),
('robert', 'nantes'),
('simon', 'paris'),
('lucien', 'toulouse'),
('bertrand', 'lyon'),
('herve', 'bastia'),
('luc', 'paris');

-- Insertion des vols avec heures en INT
INSERT INTO
vol
(vol_id, avion_id, pilote_id, vol_villeDepart, vol_villeArrive, vol_heureDepart, vol_heureArrive) VALUES
('it100', 100, 1, 'nice', 'paris', 7, 9),
('it101', 100, 2, 'paris', 'toulouse', 11, 12),
('it102', 101, 1, 'paris', 'nice', 12, 14),
('it103', 105, 3, 'grenoble', 'toulouse', 9, 11),
('it104', 105, 3, 'toulouse', 'grenoble', 17, 19),
('it105', 107, 7, 'lyon', 'paris', 6, 7),
('it106', 109, 8, 'bastia', 'paris', 10, 13),
('it107', 106, 9, 'paris', 'brive', 7, 8),
('it108', 106, 9, 'brive', 'paris', 19, 20),
('it109', 107, 7, 'paris', 'lyon', 18, 19),
('it110', 102, 2, 'toulouse', 'paris', 15, 16),
('it111', 101, 4, 'nice', 'nantes', 17, 19),
('it112', 103, 5, 'paris', 'nice', 11, 13),
('it113', 104, 6, 'nice', 'paris', 13, 1);
