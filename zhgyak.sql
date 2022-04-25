-- adatbazis letrehozasa
DROP DATABASE IF EXISTS mintazh_solol;
CREATE DATABASE mintazh_solol
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
use mintazh_solol;

-- faj tablazat letrehozasa
CREATE TABLE faj(
id int not null auto_increment primary key,
faj_nev text not null
);
-- faj tabla adatainak megadasa
INSERT INTO faj (id, faj_nev) VALUES (1, 'kutya');
INSERT INTO faj (id, faj_nev) VALUES (2, 'macska');

-- etel tabla letrehozasa
CREATE TABLE etel(
id int not null auto_increment primary key,
etel_nev varchar(50) not null
);
-- etel tabla adatainak megadasa
INSERT INTO etel (id, etel_nev) VALUES (1, 'velos csont');
INSERT INTO etel (id, etel_nev) VALUES (2, 'husleves');
INSERT INTO etel (id, etel_nev) VALUES (3, 'almas pite');

-- allat tabla letrehozasa
CREATE TABLE allat(
id int not null auto_increment primary key,
allat_nev text not null,
faj_id int not null,
foreign key (faj_id) references faj(id) 
); /*a (faj_id) azert van zarojelben mert egyebkent hibat dobna
  az Adatbazisok_DEMO_QUERY pdf bol vettem az otletet a javitashoz*/
  
-- allat tabla adatainak megadasa
INSERT INTO allat (id, allat_nev, faj_id) VALUES (1, 'bloki', 1);
INSERT INTO allat (id, allat_nev, faj_id) VALUES (2, 'mirci', 2);
INSERT INTO allat (id, allat_nev, faj_id) VALUES (3, 'zokni', 1);

-- kedvenc_etel tabla letrehozasa
CREATE TABLE kedvenc_etel(
allat_id int not null,
etel_id int not null,
primary key(allat_id, etel_id),
foreign key (allat_id) references allat(id),
foreign key (etel_id) references etel(id) -- itt is ugyanaz a bugfix
);
-- kedvenc_eteltabla adatainak megadasa
INSERT INTO kedvenc_etel (allat_id, etel_id) VALUES (1, 1);
INSERT INTO kedvenc_etel (allat_id, etel_id) VALUES (1, 2);
INSERT INTO kedvenc_etel (allat_id, etel_id) VALUES (2, 2);
INSERT INTO kedvenc_etel (allat_id, etel_id) VALUES (3, 1);
INSERT INTO kedvenc_etel (allat_id, etel_id) VALUES (3, 3);