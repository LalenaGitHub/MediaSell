DROP TABLE IF EXISTS "Artikel";
CREATE TABLE "Artikel" ("aid" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL UNIQUE, "artikelNr" INTEGER NOT NULL UNIQUE,  "author" VARCHAR(30), "titel" VARCHAR(30), "preis" DOUBLE, "status" BOOL, "bestand" INTEGER, "warengruppe" INTEGER);
INSERT INTO "Artikel" VALUES(1,1,'Paul Klaus','Survivalguide',49.9,'false
',16,2);
INSERT INTO "Artikel" VALUES(2,2,'Tobias Windschall','How to programm',49.9,'true',15,2);
INSERT INTO "Artikel" VALUES(3,3,'Lena Neumann','Drum and Base',17.99,'true',15,1);
INSERT INTO "Artikel" VALUES(4,4,'Sylke Roßkamp','Perfekte Flussdiagramme',29.38,'true',15,22);
INSERT INTO "Artikel" VALUES(5,5,'Franz Urban','Java Videokurs',99.99,'false',1300,21);
DROP TABLE IF EXISTS "Kassenvorgang";
CREATE TABLE "Kassenvorgang" ("pk" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , "kvNr" INTEGER NOT NULL UNIQUE,  "kassenvorgangID" INTEGER NOT NULL, "aid" INTEGER NOT NULL , "kid" INTEGER NOT NULL , "anzahl" INTEGER NOT NULL , "datum" DATETIME NOT NULL , "storno" BOOL NOT NULL );
INSERT INTO "Kassenvorgang" VALUES(1,1,1,1,2,5,'2017-10-18','true');
INSERT INTO "Kassenvorgang" VALUES(2,2,1,2,2,5,'2017-10-18','true');
INSERT INTO "Kassenvorgang" VALUES(3,3,1,3,2,5,'2017-10-18','true');
INSERT INTO "Kassenvorgang" VALUES(4,4,2,3,1,5,'2017-10-18','false');
INSERT INTO "Kassenvorgang" VALUES(5,5,3,5,1,2,'2017-10-18','true');
DROP TABLE IF EXISTS "Kassenvorgang_1";
CREATE TABLE "Kassenvorgang_1" ("pk" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , "kvNr" INTEGER NOT NULL ,  "kassenvorgangID" INTEGER NOT NULL, "aid" INTEGER NOT NULL , "kid" INTEGER NOT NULL , "anzahl" INTEGER NOT NULL , "datum" DATETIME NOT NULL , "storno" BOOL NOT NULL );
INSERT INTO "Kassenvorgang_1" VALUES(1,6,4,4,4,1,'','false');
INSERT INTO "Kassenvorgang_1" VALUES(2,6,4,2,4,2,'','false');
INSERT INTO "Kassenvorgang_1" VALUES(3,6,4,3,4,3,'','false');
INSERT INTO "Kassenvorgang_1" VALUES(4,6,4,4,4,4,'','false');
DROP TABLE IF EXISTS "Kunde";
CREATE TABLE "Kunde" ("kid" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,  "kundeNr" INTEGER NOT NULL UNIQUE, "vorname" VARCHAR (30), "nachname" VARCHAR (30), "strasse" VARCHAR (30), "hausnr" VARCHAR (5), "plz" VARCHAR (10), "stadt" VARCHAR (30), "email" VARCHAR (40), "telefonNr" VARCHAR (20), "zahlungsart" INTEGER(1), "status" BOOL);
INSERT INTO "Kunde" VALUES(1,1,'Arnold','Schwarzenegger','Mukibukki','123a','45678','Mukkibukkingen','astalavista@baby.de','0124368562',4,'true');
INSERT INTO "Kunde" VALUES(2,2,'Jogi','Löw','Nightmare','123s','45673','Hell','hellotohell@baby.de','0124368562',3,'true');
INSERT INTO "Kunde" VALUES(3,3,'Max','Mustermann','arena','23d','66666','Kolleseum','gladiator@baby.de','0124368562',2,'true');
INSERT INTO "Kunde" VALUES(4,4,'Bean','Mustermann','pikachu','213f','21345','pokebal','','',1,'true');
INSERT INTO "Kunde" VALUES(5,5,'Harry','Poter','fokus pokus','123d','','','','6523474233',1,'true');
INSERT INTO "Kunde" VALUES(6,6,'Bine','Maya','Blümchen','34a','23467','bienenkorb','',NULL,2,'true');
INSERT INTO "Kunde" VALUES(17,7,' null ',' null ',' null ',' null ',' null ',' null ',' null ',' null ',0,'false');
INSERT INTO "Kunde" VALUES(18,8,'John A.','Dr. Zoidberg','','10','-XFF-','Dekapod','','',1,'false');
CREATE VIEW "vArtikel" AS SELECT artikelNr, author, titel, preis, status, bestand, warengruppe  FROM Artikel;
CREATE VIEW "vKKA" AS      select  r.kassenvorgangID, r.datum, r.storno AS Storno,  a.artikelNr, r.anzahl, a.author, a.titel, a.preis, a.status AS aStatus, a.bestand, a.warengruppe,
k.kundeNr, k.vorname, k.nachname, k.strasse, k.hausnr, k.plz, k.stadt, k.email, k.telefonNr, k.zahlungsart, k.status AS kStatus
 from Kassenvorgang As r
INNER JOIN Kunde k
ON r.kid=k.kid
INNER JOIN Artikel a
ON r.aid=a.aid;
CREATE VIEW "vKunde" AS select   "kundeNr" , "vorname", "nachname" , "strasse", "hausnr" , "plz" , "stadt" , "email" , "telefonNr" , "zahlungsart" , "status"  FROM kunde;
