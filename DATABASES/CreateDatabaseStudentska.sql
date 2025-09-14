CREATE DATABASE STUDENTSKA 
COLLATE Serbian_Latin_100_CI_AI
GO
use STUDENTSKA


CREATE TABLE ispitni_rok (
  ID_ROKA     int       IDENTITY(1,1),
  NAZIV nvarchar(15) NOT NULL,
  SKOLSKA_GOD nvarchar(7) NOT NULL,
  STATUS_ROKA  NCHAR (10) NOT NULL,
  PRIMARY KEY (ID_ROKA)
) 
CREATE TABLE profesor (
  ID_PROFESORA SMALLINT NOT NULL,
  IME nvarchar(25) NOT NULL,
  PREZIME nvarchar(50) NOT NULL,
  ZVANJE  NCHAR (10) NOT NULL,
  DATUM_ZAP date NOT NULL,
  PRIMARY KEY (ID_PROFESORA)
) 

CREATE TABLE predmet (
  ID_PREDMETA SMALLINT NOT NULL,
  ID_PROFESORA SMALLINT NOT NULL,
  NAZIV nvarchar(50) NOT NULL,
  ESPB SMALLINT NOT NULL,
  STATUS  NCHAR (10) NOT NULL,
  PRIMARY KEY (ID_PREDMETA)
 
) 

CREATE TABLE ispit (
  ID_ISPITA     int       IDENTITY(1,1),
  ID_ROKA SMALLINT NOT NULL,
  ID_PREDMETA SMALLINT NOT NULL,
  DATUM date NOT NULL,
  PRIMARY KEY (ID_ISPITA)
)

CREATE TABLE student (
  ID_STUDENTA     int       IDENTITY(1,1),
  IME nvarchar(25) NOT NULL,
  PREZIME nvarchar(40) NOT NULL,
  SMER nvarchar(5) NOT NULL,
  BROJ SMALLINT NOT NULL,
  GODINA_UPISA nvarchar(4) NOT NULL,
  PRIMARY KEY (ID_STUDENTA)
)

CREATE TABLE student_predmet (
  ID_STUDENTA SMALLINT NOT NULL,
  ID_PREDMETA SMALLINT NOT NULL,
  SKOLSKA_GODINA nvarchar(7) NOT NULL,
  PRIMARY KEY (ID_STUDENTA,ID_PREDMETA,SKOLSKA_GODINA)
) 
CREATE TABLE zapisnik (
  ID_STUDENTA SMALLINT NOT NULL,
  ID_ISPITA SMALLINT NOT NULL,
  OCENA FLOAT (1) NOT NULL,
  BODOVI nvarchar(3) NOT NULL,
  PRIMARY KEY (ID_STUDENTA,ID_ISPITA)
)


INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Sara ','Miljkovi?','NRT ',33,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Marko','Baki?','ASUV',2,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Andrej','Lazi?','NRT ',16,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Lazar','Markovi?','RT',12,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Andjela','Stankovi?','IS',3,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Miloš','Petrovi?','RT',25,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Marko','Raki?','ELITE',6,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Lena','Mili?','IS',10,'2018');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Stefan','Nikoli?','NRT',15,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Aleksandar','Marki?','ELITE',11,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Nikola','Milutinovi?','ASUV',26,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Violeta','Gruji?','IS',13,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Bojana','Tomi?','NRT',96,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Aleksa','Todorovi?','RT',55,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Igor','Tadi?','ELITE',35,'2018');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Petra','Kosti?','IS',7,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Vuk','Mirkovi?','NRT',3,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Branislav ','Vuleti?','ASUV',61,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Nenad','Brankovi?','RT',23,'2018');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Mateja','Stojkovi?','IS',14,'2018');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Jovana','Mini?','IS',72,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Milica','?uki?','NRT',32,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Filip','Jevti?','RT',29,'2018');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Dragan','Popovi?','ELITE',19,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Željko','Markovi?','ASUV',67,'2018');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Janko','Leki?','NRT',85,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Nikola','Obradovi?','IS',101,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Todor','Panti?','ELITE',68,'2019');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Nada','Ili?','IS',16,'2020');
INSERT INTO student (IME,PREZIME,SMER,BROJ,GODINA_UPISA) VALUES ('Lara','Ivanovi?','NRT',17,'2019');


INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (100,'Gordana','Vuleti?','dr', '2002-10-01');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (101,'Miloš','Lazarevi?','dr', '1997-03-15');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (102,'Goran','Proti?','mr', '1986-09-27');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (103,'Lazar','Gojkovi?','dr', '2002-11-05');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (104,'Bojan','Miki?','mr', '2006-07-22');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (105,'Jelena','Peki?','mr', '2014-04-18');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (106,'Marijana','Petrovi?','dr', '1996-08-20');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (107,'Nemanja','Markovi?','dr', '2017-11-30');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (108,'Marko','Bojovi?','mr', '1979-12-25');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (109,'Dragan','Mir?eti?','dr', '2000-05-16');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (110,'Milovan','Kova?evi?','dr', '2002-07-29');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (111,'Nada','Stanimirovi?','dr', '2011-04-26');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (112,'Vladimir','Vuleti?','dr', '2015-08-01');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (113,'Radmila','Leki?','dr', '2019-05-20');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (114,'Bogdan','Proki?','mr', '1983-06-18');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (115,'Tomislav','Miljkovi?','dr', '1998-09-03');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (116,'Željko','Joki?','dr', '2016-02-12');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (117,'Marija','Vasi?','mr', '2006-07-22');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (118,'Aleksandra','Grozdi?','dr', '1974-08-31');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (119,'Miloš','Stankovi?','dr', '1989-06-26');
INSERT INTO profesor (ID_PROFESORA,IME,PREZIME,ZVANJE, DATUM_ZAP) VALUES (120,'Nikola','Žileti?','mr', '1993-09-07');



INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (1259,107,'Inženjerska matematika',7,'obavezan');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (1589,117,'Programiranje ra?unarskih igara',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (2458,115,'Verovatno?a i statistika',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (2569,105,'Baze podataka',6,'obavezan');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (2648,104,'Operativni sistemi 1',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (3264,114,'Objektno programiranje 1',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (3521,112,'Aplikativni softver',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (4238,118,'Digitalne multimedije',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (4296,110,'Elektrotehnika',7,'obavezan');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (4526,101,'Uvod u objektno programiranje',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (4851,119,'Programski jezici',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (5214,102,'Veb dizajn',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (5236,111,'Programiranje mobilnih ure?aja',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (6345,116,'Mikrora?unari',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (6752,103,'Mikrokontroleri',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (7526,108,'Ra?unarske mreže',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (7584,109,'Interakcija ?ovek-ra?unar',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (8546,113,'Objektno programiranje 2 ',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (9412,106,'Analogna elektronika',6,'izborni');
INSERT INTO predmet (ID_PREDMETA,ID_PROFESORA,NAZIV,ESPB,STATUS) VALUES (9542,120,'Mikroprocesorski softver',6,'izborni');



INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (1,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (1,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (2,2458,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (2,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,4851,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,5214,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,1589,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,6752,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (3,3521,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,9542,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,7526,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (4,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (5,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (5,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (5,7526,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,6345,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,2458,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,4238,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,4296,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,2569,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,9542,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (6,5236,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,4851,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (7,5214,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (8,3264,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (8,2569,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (8,4851,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (9,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (9,5214,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,5236,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (10,9542,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,7526,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (11,9412,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (12,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (13,4526,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (13,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,2569,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,6345,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (14,8546,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (15,9542,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,6345,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (16,8546,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (17,9412,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (18,6752,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (19,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (19,5236,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (19,7526,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,2458,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,6345,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (20,8546,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,9542,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,4851,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,5214,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (21,8546,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (22,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (23,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (23,2569,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (24,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (24,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (24,5236,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (25,7526,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,2458,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,3264,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,4238,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,4296,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,2569,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (26,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (27,2458,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (27,3264,'2019/20');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,9542,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,5214,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (28,3264,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,4526,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,5236,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,7526,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,4851,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,6345,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (29,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,1259,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,1589,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,2648,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,3521,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,6752,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,7584,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,8546,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,9542,'2018/19');
INSERT INTO student_predmet (id_studenta,id_predmeta,skolska_godina) VALUES (30,7526,'2019/20');




INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Januar','2018/19','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Februar','2018/19','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Jun','2018/19','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Septembar','2018/19','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Oktobar','2018/19','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Oktobar 2','2018/19','vanredni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Novembar','2018/19','vanredni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Januar','2019/20','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Februar','2019/20','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Jun','2019/20','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Septembar','2019/20','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Oktobar','2019/20','redovni');
INSERT INTO ispitni_rok (NAZIV,SKOLSKA_GOD,STATUS_ROKA) VALUES ('Oktobar 2','2019/20','vanredni');



INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (1,2458,'2019-01-30');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (2,3264,'2019-02-18');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (5,4238,'2019-09-17');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (6,4296,'2019-10-11');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (7,1259,'2019-11-07');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (8,2569,'2020-02-01');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (11,9542,'2020-09-09');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (13,9412,'2020-10-12');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (10,6752,'2020-06-16');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (5,5236,'2019-09-20');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (6,7584,'2019-09-12');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (4,8546,'2019-09-06');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (8,4851,'2020-02-03');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (7,2648,'2019-11-07');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (1,1589,'2019-02-01');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (1,1259,'2019-02-03');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (2,3521,'2019-02-14');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (9,5214,'2020-02-18');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (5,4238,'2019-09-24');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (3,6752,'2019-06-13');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (6,5236,'2019-10-13');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (12,7526,'2020-09-21');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (13,4851,'2020-10-11');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (11,6345,'2020-09-06');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (10,8546,'2020-06-21');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (1,9542,'2019-02-04');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (2,7584,'2019-02-24');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (3,4851,'2019-06-18');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (3,2648,'2019-06-12');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (6,1589,'2019-10-12');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (5,5214,'2019-09-23');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (7,4238,'2019-11-07');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (9,3264,'2020-02-18');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (8,2458,'2020-01-30');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (10,4296,'2020-06-21');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (13,2648,'2020-10-11');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (11,3264,'2020-09-04');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (4,4526,'2019-09-03');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (6,7584,'2019-10-13');
INSERT INTO ispit(ID_ROKA,ID_PREDMETA,DATUM) VALUES (1,5236,'2019-02-04');



INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (1,3,7,'63');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (1,17,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (2,1,10,'96');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (2,31,5,'33');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (3,16,9,'82');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (3,33,9,'89');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (3,5,7,'62');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (3,28,10,'91');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (3,31,6,'59');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (3,17,8,'75');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,26,6,'56');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,30,7,'67');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,25,5,'47');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,31,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,28,6,'54');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,22,10,'97');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,9,8,'77');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (4,39,9,'93');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (5,11,10,'99');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (5,22,5,'45');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (5,28,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,12,10,'93');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,24,10,'96');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,10,10,'91');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,2,6,'54');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,1,8,'76');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,7,8,'79');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,3,9,'85');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (6,4,5,'40');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (8,2,8,'76');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (8,6,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (8,13,6,'56');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (9,16,6,'58');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (9,18,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,27,7,'66');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,19,7,'69');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,17,8,'72');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,12,10,'96');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,7,5,'32');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,10,9,'98');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,13,7,'64');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (10,14,10,'93');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,3,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,8,8,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,17,8,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,20,6,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,22,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,27,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,29,8,'75');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,30,8,'75');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (11,33,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (12,17,8,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (13,28,9,'86');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (13,38,10,'91');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (14,6,10,'97');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (14,14,6,'52');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (15,7,5,'10');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,14,8,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,16,5,'25');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,17,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,19,5,'15');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,24,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,25,6,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,30,8,'75');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,31,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (16,33,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (17,8,10,'98');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (18,9,10,'100');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (19,22,7,'65');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (19,28,8,'79');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (19,40,9,'89');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,1,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,5,6,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,17,8,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,24,8,'71');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,25,7,'68');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,27,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,29,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,30,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (20,32,8,'75');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (21,5,8,'77');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (21,9,7,'64');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (21,39,9,'81');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (21,26,10,'99');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (21,31,10,'92');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (21,25,6,'58');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (22,16,6,'52');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (23,3,10,'92');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (23,6,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (24,19,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (24,29,10,'91');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (24,40,7,'65');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (25,5,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (26,5,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (26,1,10,'93');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (26,6,9,'87');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (26,2,10,'91');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (26,31,7,'63');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (26,28,7,'67');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (27,33,9,'86');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (27,34,5,'20');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,28,9,'85');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,5,9,'84');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,15,10,'100');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,9,8,'75');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,39,7,'65');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,26,10,'94');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,31,9,'85');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,25,6,'55');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (28,2,5,'41');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,38,10,'99');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,21,8,'79');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,25,7,'65');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,20,6,'59');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,22,10,'94');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,24,7,'67');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,23,10,'97');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,11,5,'27');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,5,6,'51');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,15,7,'61');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (29,17,5,'45');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (30,26,5,'15');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (30,5,8,'74');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (30,15,9,'82');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (30,36,10,'96');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (30,17,5,'41');
INSERT INTO zapisnik (ID_STUDENTA,ID_ISPITA,OCENA,BODOVI) VALUES (30,22,9,'89');

