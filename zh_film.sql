DROP DATABASE IF EXISTS zhfilmek;
CREATE DATABASE zhfilmek
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
use zhfilmek;

CREATE TABLE szinesz(
id int not null auto_increment primary key,
szinesz_nev varchar(50) not null
);

INSERT INTO szinesz (id, szinesz_nev) VALUES (1, 'George Clooney');
INSERT INTO szinesz (id, szinesz_nev) VALUES (2, 'Graham Chapman');
INSERT INTO szinesz (id, szinesz_nev) VALUES (3, 'Selena Gomez');
INSERT INTO szinesz (id, szinesz_nev) VALUES (4, 'Sandra Bullock');

CREATE TABLE filmek(
id int not null auto_increment primary key,
film_nev varchar(50) not null
);

INSERT INTO filmek (id, film_nev) VALUES (1, 'Gravity');
INSERT INTO filmek (id, film_nev) VALUES (2, 'The Ides of March');
INSERT INTO filmek (id, film_nev) VALUES (3, 'Veszhelyzet');
INSERT INTO filmek (id, film_nev) VALUES (4, 'Monty Python and the Holy Grail');
INSERT INTO filmek (id, film_nev) VALUES (5, 'Hotel Transylvania');
INSERT INTO filmek (id, film_nev) VALUES (6, 'Miss Congeniality');
INSERT INTO filmek (id, film_nev) VALUES (7, 'The Proposal');

CREATE TABLE szerepel(
szinesz_id int not null,
film_id int not null,
primary key(szinesz_id, film_id),
foreign key (szinesz_id) references szinesz(id),
foreign key (film_id) references filmek(id)
);

INSERT INTO szerepel (szinesz_id, film_id) VALUES (1, 1);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (1, 2);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (1, 3);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (2, 4);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (3, 5);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (4, 1);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (4, 6);
INSERT INTO szerepel (szinesz_id, film_id) VALUES (4, 7);