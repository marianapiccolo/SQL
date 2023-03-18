
/* 
Database that controls all Oscar related information.

- Awards: Best Film, Best Actor, Best Actress and Best Director.

- It is possible to register an unlimited amount of films, actors, actresses and directors.

- The films, actors, actresses and directors must have been nominated for an Oscar.

- Each actor/actress can participate in one or more films.

- An actor can also be a director, but must be registered separately.

- It must be easy to identify for each film, its respective director.

- Each actor, actress and director has an identification number, full name, country, city and gender.

- Each film can win one of 4 awards in a given awards year. The same film can't win the same award in more than one year.

- Each film can only be directed by one director.
*/


-- Step 1: Create the Database

CREATE DATABASE Oscar;
USE Oscar;

-- Step 2: Create Tables: Actor, Director, Film, Award, Participation, Ceremony

-- ## Actor Table
CREATE TABLE Actor(
	Cod_Actor INT,
	Name_Actor VARCHAR(50) NOT NULL,
	City_Actor VARCHAR(50) NOT NULL,
	Country_Actor VARCHAR(10) NOT NULL,
	Gender_Actor VARCHAR(1) NOT NULL,
	PRIMARY KEY(Cod_Actor)
);

-- ## Director Table
CREATE TABLE Director(
	Cod_Director INT,
	Name_Director VARCHAR(50) NOT NULL,
	City_Director VARCHAR(50) NOT NULL,
	Country_Director VARCHAR(10) NOT NULL,
	PRIMARY KEY(Cod_Director)
);

-- ## Film Table
CREATE TABLE Film(
	Cod_Film INT,
	Title VARCHAR(50) NOT NULL,
	Cod_Director INT NOT NULL,
	PRIMARY KEY(Cod_Film),
	FOREIGN KEY(Cod_Director) REFERENCES Director(Cod_Director)
);

-- ## Award Table
CREATE TABLE Award(
	Cod_Award INT,
	Description_Award VARCHAR(50) NOT NULL,
	PRIMARY KEY(Cod_Award)
);

-- ## Participation Table
CREATE TABLE Participation(
	A_Cod_Actor INT,
	F_Cod_Film INT,
	PRIMARY KEY(A_Cod_Actor, F_Cod_Film),
	FOREIGN KEY(A_Cod_Actor) REFERENCES Actor(Cod_Actor),
	FOREIGN KEY(F_Cod_Film) REFERENCES Film(Cod_Film)
);

-- ## Ceremony Table
CREATE TABLE Ceremony(
	F_Cod_Film INT,
	A_Cod_Award INT,
	Ano INT NOT NULL, # Year
	PRIMARY KEY(F_Cod_Film, A_Cod_Award),
	FOREIGN KEY(F_Cod_Film) REFERENCES Film(Cod_Film),
	FOREIGN KEY(A_Cod_Award) REFERENCES Award(Cod_Award)
);


-- Step 3: Insert values into tables

-- ## Actor Table
INSERT INTO Actor(Cod_Actor, Name_Actor, City_Actor, Country_Actor, Gender_Actor) VALUES
(1, 'Alan Arkin', 'Nova York', ' USA', 'M'),
(2, 'Alec Baldwin', 'Nova York', ' USA', 'M'),
(3, 'Ben Affleck', 'California', ' USA', 'M'),
(4, 'Bérénice Bejo', 'Buenos Aires', ' ARG', 'F'),
(5, 'Bradley Cooper', 'Pensilvania', ' USA', 'M'),
(6, 'Brian May', 'Hampton', ' GBR', 'M'),
(7, 'Brie Larson', 'California', ' USA', 'F'),
(8, 'Casey Affleck', 'Massachusetts', ' USA', 'M'),
(9, 'Cate Blanchett', 'Ivanhoe', ' AUS', 'F'),
(10, 'Chiwetel Ejiofor', 'Londres', ' GBR', 'M'),
(11, 'Colin Firth', 'Grayshott', ' GBR', 'M'),
(12, 'Daniel Day-Lewis', 'Londres', ' GBR', 'M'),
(13, 'Doug Jones', 'Indiana', ' USA', 'M'),
(14, 'Eddie Redmayne', 'Londres', ' GBR', 'M'),
(15, 'Edward Norton', 'Massachusetts', ' USA', 'M'),
(16, 'Emma Stone', 'Arizona', ' USA', 'F'),
(17, 'Felicity Jones', 'Birmingham', ' GBR', 'F'),
(18, 'Finn Wittrock', 'Massachusetts', ' USA', 'M'),
(19, 'Frances McDormand ', 'Illinois', ' USA', 'F'),
(20, 'Gary Oldman', 'Londres', ' GBR', 'M'),
(21, 'Geoffrey Rush', 'Toowoomba', ' AUS', 'M'),
(22, 'George Clooney', 'Kentucky', ' USA', 'M'),
(23, 'Irrfan Khan', 'Tonk', ' IND', 'M'),
(24, 'Jacob Tremblay', 'Vancouver', ' CAN', 'M'),
(25, 'Jean Dujardin', 'Rueil-Malmaison', ' FRA', 'M'),
(26, 'Jennifer Garner', 'Texas', ' USA', 'F'),
(27, 'Jennifer Lawrence', 'Kentucky', ' USA', 'F'),
(28, 'Jim Broadbent', 'Holton cum Beckering', ' GBR', 'M'),
(29, 'Joaquin Phoenix', 'Rio Piedras', ' PUR', 'M'),
(30, 'Julianne Moore', 'Carolina do Norte', ' USA', 'F'),
(31, 'Kristen Stewart', 'California', ' USA', 'F'),
(32, 'Leonardo DiCaprio', 'California', ' USA', 'M'),
(33, 'Lily James', 'Esher', ' GBR', 'F'),
(34, 'Lucas Hedges', 'Nova York', ' USA', 'M'),
(35, 'Mahershala Ali', 'California', ' USA', 'M'),
(36, 'Marcus Ornellas', 'Rio Grande do Sul', ' BRA', 'M'),
(37, 'Marina de Tavira', 'Cidade do México', ' MEX', 'F'),
(38, 'Mark Ruffalo', 'Wisconsin', ' USA', 'M'),
(39, 'Matthew McConaughey', 'Texas', ' USA', 'M'),
(40, 'Meryl Streep', 'Nova Jersey', ' USA', 'F'),
(41, 'Michael Fassbender', 'Heidelberg', ' GER', 'M'),
(42, 'Michael Keaton', 'Pensilvania', ' USA', 'M'),
(43, 'Mila Kunis', 'Chernivtsi', ' UKR', 'F'),
(44, 'Natalie Portman', 'Jerusalem', ' ISR', 'F'),
(45, 'Olivia Colman', 'Norwich', ' GBR', 'F'),
(46, 'Park Seo-joon', 'Seul', ' KOR', 'M'),
(47, 'Rachel Weisz', 'Londres', ' GBR', 'F'),
(48, 'Rami Malek', 'California', ' USA', 'M'),
(49, 'Renée Zellweger', 'Texas', ' USA', 'F'),
(50, 'Robert De Niro', 'Nova York', ' USA', 'M'),
(51, 'Ryan Gosling', 'London', ' CAN', 'M'),
(52, 'Sally Field', 'California', ' USA', 'F'),
(53, 'Sally Hawkins', 'Londres', ' GBR', 'F'),
(54, 'Sandra Bullock', 'Virginia', ' USA', 'F'),
(55, 'Song Kang-ho', 'Gimhae', ' KOR', 'M'),
(56, 'Suraj Sharma', 'Nova Delhi', ' IND', 'M'),
(57, 'Tom Hardy', 'Londres', ' GBR', 'M'),
(58, 'Trevante Rhodes', 'Luisiana', ' USA', 'M'),
(59, 'Viggo Mortensen', 'Nova York', ' USA', 'M'),
(60, 'Woody Harrelson', 'Texas', ' USA', 'M'),
(61, 'Yalitza Aparicio', 'Tlaxiaco', ' MEX', 'F');

-- ## Director Table
INSERT INTO Director(Cod_Director, Name_Director, City_Director, Country_Director) VALUES
(1, 'Alejandro González', 'Cidade do Mexico', 'MEX'),
(2, 'Alfonso Cuarón', 'Cidade do Mexico', 'MEX'),
(3, 'Ang Lee', 'Pingtung', 'CHN'),
(4, 'Barry Jenkins', 'Florida', 'USA'),
(5, 'Ben Affleck', 'California', 'USA'),
(6, 'Bong Joon-ho', 'Daegu', 'KOR'),
(7, 'Bryan Singer', 'Nova York', 'USA'),
(8, 'Damien Chazelle', 'Rhode Island', 'USA'),
(9, 'Darren Aronofsky', 'Nova York', 'USA'),
(10, 'David O. Russell', 'Nova York', 'USA'),
(11, 'Guillermo del Toro', 'Guadalajara', 'MEX'),
(12, 'James Marsh', 'Truro', 'GBR'),
(13, 'Jean-Marc Vallée', 'Montreal', 'CAN'),
(14, 'Joe Wright', 'Londres', 'GBR'),
(15, 'Kenneth Lonergan', 'Nova York', 'USA'),
(16, 'Lenny Abrahamson', 'Dublin', 'IRL'),
(17, 'Martin McDonagh', 'Londres', 'GBR'),
(18, 'Michel Hazanavicius', 'Paris', 'FRA'),
(19, 'Peter Farrelly', 'Pensilvania', 'USA'),
(20, 'Phyllida Lloyd', 'Bristol', 'GBR'),
(21, 'Rupert Goold', 'Londres', 'GBR'),
(22, 'Steve McQueen', 'Londres', 'USA'),
(23, 'Steven Spielberg', 'Ohio', 'USA'),
(24, 'Todd Phillips', 'Nova York', 'USA'),
(25, 'Tom Hopper', 'Coalville', 'GBR'),
(26, 'Tom McCarthy', 'Nova Jersey', 'USA'),
(27, 'Wash Westmoreland', 'Leeds', 'GBR'),
(28, 'Woody Allen', 'Bronx', 'USA'),
(29, 'Yorgos Lanthimos', 'Atenas', 'GRE');

-- ## Film Table
INSERT INTO Film(Cod_Film, Title, Cod_Director) VALUES
(1, 'O Discurso do Rei', 25),
(2, 'Cisne Negro', 9),
(3, 'O Artista', 18),
(4, 'A Dama de Ferro', 20),
(5, 'Argo', 5),
(6, 'As Aventuras de Pi', 3),
(7, 'Lincoln', 23),
(8, 'O Lado Bom da Vida', 10),
(9, '12 Anos de Escravidão', 22),
(10, 'Gravidade', 2),
(11, 'Clube de Compras Dallas', 13),
(12, 'Blue Jasmine', 28),
(13, 'Birdman', 1),
(14, 'A Teoria de Tudo', 12),
(15, 'Para Sempre Alice', 27),
(16, 'Spotlight: Segredos Revelados', 26),
(17, 'O Regresso', 1),
(18, 'O Quarto de Jack', 16),
(19, 'Moonlight: Sob a Luz do Luar', 4),
(20, 'La La Land', 8),
(21, 'Manchester à Beira-Mar', 15),
(22, 'A Forma da Água', 11),
(23, 'O Destino de Uma Nação', 14),
(24, 'Três Anúncios Para Um Crime', 17),
(25, 'Green Book: O Guia', 19),
(26, 'Roma', 2),
(27, 'Bohemian Rhapsody', 7),
(28, 'A Favorita', 29),
(29, 'Parasita', 6),
(30, 'Coringa', 24),
(31, 'Judy: Muito Além do Arco-Íris', 21);

-- ## Award Table	
INSERT INTO Award(Cod_Award, Description_Award) VALUES
(1, 'Melhor Filme'),
(2, 'Melhor Diretor'),
(3, 'Melhor Ator'),
(4, 'Melhor Atriz');

-- ## Participation Table
INSERT INTO Participation(A_Cod_Actor, F_Cod_Film) VALUES
(7, 18),
(11, 1),
(40, 4),
(9, 12),
(45, 28),
(44, 2),
(39, 11),
(48, 27),
(12, 7),
(16, 20),
(27, 8),
(49, 31),
(14, 14),
(29, 30),
(19, 24),
(30, 15),
(20, 23),
(25, 3),
(8, 21),
(32, 17),
(21, 1),
(43, 2),
(4, 3),
(28, 4),
(3, 5),
(1, 5),
(56, 6),
(23, 6),
(52, 7),
(5, 8),
(10, 9),
(41, 9),
(54, 10),
(22, 10),
(26, 11),
(2, 12),
(42, 13),
(15, 13),
(17, 14),
(31, 15),
(38, 16),
(57, 17),
(24, 18),
(35, 19),
(58, 19),
(51, 20),
(34, 21),
(53, 22),
(13, 22),
(33, 23),
(60, 24),
(59, 25),
(35, 25),
(61, 26),
(37, 26),
(6, 27),
(47, 28),
(55, 29),
(46, 29),
(50, 30),
(18, 31),
(42, 16);

-- ## Tabela Ceremony
INSERT INTO Ceremony(F_Cod_Film, A_Cod_Award, Ano) VALUES
(1, 1, 2011),
(1, 2, 2011),
(1, 3, 2011),
(2, 4, 2011),
(3, 1, 2012),
(3, 2, 2012),
(3, 3, 2012),
(4, 4, 2012),
(5, 1, 2013),
(6, 2, 2013),
(7, 3, 2013),
(8, 4, 2013),
(9, 1, 2014),
(10, 2, 2014),
(11, 3, 2014),
(12, 4, 2014),
(13, 1, 2015),
(13, 2, 2015),
(14, 3, 2015),
(15, 4, 2015),
(16, 1, 2016),
(17, 2, 2016),
(17, 3, 2016),
(18, 4, 2016),
(19, 1, 2017),
(20, 2, 2017),
(21, 3, 2017),
(20, 4, 2017),
(22, 1, 2018),
(22, 2, 2018),
(23, 3, 2018),
(24, 4, 2018),
(25, 1, 2019),
(26, 2, 2019),
(27, 3, 2019),
(28, 4, 2019),
(29, 1, 2020),
(29, 2, 2020),
(30, 3, 2020),
(31, 4, 2020);

# SELECT * FROM Actor;
# SELECT * FROM Film;

-- Final Tests:

-- 1) Check the Referential Integrity Constraint for the tables:

-- a) Participation

SELECT * FROM Participation;

INSERT INTO Participation VALUES
(5, 1);

-- b) Ceremony

INSERT INTO Ceremony VALUES
(6, 8, 2022); # Error code beacuase award 8 doesn't exist, so this query works.


-- 2) Check any Domain Restriction
INSERT INTO Award VALUES
('COD123', 'Melhor Roteiro'); # Error because COD123 is text. It must be inter.

INSERT INTO Award VALUES
(5, 'Melhor Roteiro');

-- 3) Check any Emptiness Constraint

INSERT INTO Ator VALUES
(101, 'Lazaro Ramos', 'Salvador', NULL, 'M'); # Error because NULL

-- 4) Check Key Constraint on tables:

-- a) Award

INSERT INTO Award VALUES
(1, 'Melhor Ator Coadjuvante'); # Error because 1 already exists

INSERT INTO Award VALUES
(6, 'Melhor Ator Coadjuvante');

-- b) Ceremony

INSERT INTO Ceremony VALUES
(1, 1, 2022); # Error because composite primary key. Entry 1,1 already exists. This combination can't be repeated

-- 5) Check Integrity Constraint on Actor table

INSERT INTO Actor VALUES
(NULL, 'Fabio Porchat', 'Rio de Janeiro', 'BRA', 'M'); # It can't be NULL