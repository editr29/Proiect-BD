# SOURCE C:/Users/Alexandra/Desktop/Proiect/script07.sql;  

/*#############################################################*/
/*        PARTEA 1 - STERGEREA SI RECREAREA BAZEI DE DATE      */

DROP DATABASE gestionareSaliFitnessDB;
CREATE DATABASE gestionareSaliFitnessDB;
USE gestionareSaliFitnessDB;

/*#############################################################*/




/*#############################################################*/
/*                  PARTEA 2 - CREAREA TABELELOR               */

CREATE TABLE tblSaliFitness(
	idSala SMALLINT(2) ZEROFILL PRIMARY KEY,
	numeSala VARCHAR(100),
	telefonSala CHAR(10),
	orasSala VARCHAR(50)
);

CREATE TABLE tblCamere(
	idCamera SMALLINT(2) ZEROFILL PRIMARY KEY,
	tipCamera VARCHAR(50),
	descriereCamera VARCHAR(100),
	descriereEchipament VARCHAR(100),
	codSala SMALLINT(2) ZEROFILL,
	CONSTRAINT fk_camere FOREIGN KEY (codSala) REFERENCES  tblSaliFitness(idSala) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblAngajati(
	idAngajat SMALLINT(3) ZEROFILL PRIMARY KEY,
	prenumeAngajat VARCHAR(50),
	numeAngajat VARCHAR(50),
	salariuAngajat SMALLINT UNSIGNED,
	tipMeserie VARCHAR(50),
	dataAngajarii DATE,
	telefonAngajat CHAR(10) UNIQUE,
	codSala SMALLINT(2) ZEROFILL,
	CONSTRAINT fk_angajati FOREIGN KEY (codSala) REFERENCES  tblSaliFitness(idSala) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblTiparAbonamente(
	idAbonament TINYINT PRIMARY KEY,
	descriereAbonament VARCHAR(100),
	pretAbonament SMALLINT UNSIGNED
);	

CREATE TABLE tblSaliAbonamente(
	idSaliAbonamente SMALLINT(3) ZEROFILL PRIMARY KEY,
	codSala SMALLINT(2) ZEROFILL,
	codAbonament TINYINT,
	CONSTRAINT fk_sali1 FOREIGN KEY (codSala) REFERENCES  tblSaliFitness(idSala) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_abonamente1 FOREIGN KEY (codAbonament) REFERENCES  tblTiparAbonamente(idAbonament) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblClienti(
	idClient SMALLINT(3) ZEROFILL PRIMARY KEY,
	numeClient VARCHAR(50),
	prenumeClient VARCHAR(50),
	telefonClient CHAR(10) UNIQUE,
	scopClient VARCHAR(50),
	codAbonament TINYINT,
	dataCumparareAbonament DATE,
	CONSTRAINT fk_abonamente2 FOREIGN KEY (codAbonament) REFERENCES  tblTiparAbonamente(idAbonament) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblClientSaliFitness(
	idClientSaliFitness SMALLINT(3) ZEROFILL PRIMARY KEY,
	codClient SMALLINT(3) ZEROFILL,
	codSala SMALLINT(2) ZEROFILL,
	dataIntrarii DATETIME,
	CONSTRAINT fk_client FOREIGN KEY (codClient) REFERENCES  tblClienti(idClient) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_sali2 FOREIGN KEY (codSala) REFERENCES  tblSaliFitness(idSala) ON DELETE CASCADE ON UPDATE CASCADE
);

/*#############################################################*/




/*#############################################################*/
/*         PARTEA 3 - INSERAREA INREGISTRARILOR IN TABELE      */

/*insertie tblSaliFitness*/
INSERT INTO tblSaliFitness VALUES
(1, "Fitness Club Pena", "0778770118", "Iasi"),
(2, "Fitness Club Perry", "0723772998", "Constanta"),
(3, "Fitness Club Ramirez", "0722817631", "Galati"),
(4, "Fitness Club Smith", "0727991660", "Ploiesti"),
(5, "Fitness Club Young", "0740427184", "Cluj-Napoca"),
(6, "Fitness Club Pineda", "0733931629", "Timisoara"),
(7, "Fitness Club Simpson", "0775499774", "Ploiesti"),
(8, "Fitness Club Montoya", "0776822292", "Brasov"),
(9, "Fitness Club Garza", "0764593788", "Iasi"),
(10, "Fitness Club Rodgers", "0755240724", "Oradea");

/*insertie in tblCamere, pentru fiecare sala in parte*/
INSERT INTO tblCamere VALUES
(1, "Bazin de Inot", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Ochelari de Bazin de Inot, costume de Bazin de Inot, placi de flotare.", 1),
(2, "Sauna", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Pietre pentru sauna, prosoape, uleiuri esentiale.", 1),
(3, "Kickboxing", "Capacitatea maxima de 10 persoane, necesita antrenor.", "Saci de box, manusi de box, protectii pentru picioare.", 1),
(4, "Greutati libere", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Haltere, gantere, banci de forta.", 1),
(5, "Pilates", "Capacitatea maxima de 15 persoane, necesita instructor.", "Covorase Pilates, benzi elastice, mingi de Pilates.", 1),
(6, "Aerobic", "Capacitatea maxima de 20 de persoane, instructor necesar.", "Step-uri, benzi de rezistenta, gantere usoare.", 1),
(7, "Yoga", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Saltele de yoga, blocuri, curele.", 1),
(8, "Ciclism", "Capacitatea maxima de 15 persoane, antrenori optional.", "Biciclete stationare, masti de oxigen, monitoare de ritm cardiac.", 1),
(9, "CrossFit", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Roti de tractor, franghii groase, cutii de sarituri.", 1),
(10, "Meditatie", "Capacitatea maxima de 25 de persoane, acces liber.", "Covorase, perne de meditatie, cronometre silentoase.", 1);

INSERT INTO tblCamere VALUES
(11, "Yoga", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Saltele de yoga, blocuri, curele.", 2),
(12, "Greutati libere", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Haltere, gantere, banci de forta.", 2),
(13, "Cardio", "Capacitatea maxima de 10 persoane, sesiuni ghidate de yoga.", "Benzi de alergare, biciclete eliptice, steppere.", 2),
(14, "Greutati libere", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Rack-uri pentru greutati, platforme de ridicare, baruri olimpice.", 2),
(15, "Greutati libere", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Haltere, gantere, banci de forta ajustabile.", 2);

INSERT INTO tblCamere VALUES
(16, "Greutati libere", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Haltere, gantere, banci de forta.", 3),
(17, "Cardio", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Benzi de alergare, biciclete eliptice, steppere.", 3),
(18, "Greutati libere", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Haltere, gantere, rack-uri pentru greutati.", 3),
(19, "Cardio", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Benzi de alergare, biciclete eliptice, ergometre.", 3);

INSERT INTO tblCamere VALUES
(20, "Sauna", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Pietre pentru sauna, prosoape, uleiuri esentiale.", 4),
(21, "Kickboxing", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Saci de box, manusi de box, protectii pentru cap.", 4),
(22, "CrossFit", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Roti de tractor, franghii groase, cutii de sarituri.", 4),
(23, "Aerobic", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Step-uri, benzi de rezistenta, mingi de fitness.", 4),
(24, "Pilates", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Covorase Pilates, benzi elastice, mingi de Pilates.", 4),
(25, "Zumba", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Sistem audio de inalta fidelitate, oglinzi pe pereti, podea antiderapanta.", 4);

INSERT INTO tblCamere VALUES
(26, "Sauna", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Pietre pentru sauna, prosoape, uleiuri esentiale.", 5),
(27, "Cardio", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Benzi de alergare, biciclete eliptice, steppere.", 5),
(28, "Bazin de Inot", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Ochelari de Bazin de Inot, costume de Bazin de Inot, placi de flotare.", 5),
(29, "Yoga", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Saltele de yoga, blocuri, curele.", 5),
(30, "Pilates", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Covorase Pilates, benzi elastice, mingi de Pilates.", 5),
(31, "Spin Cycling", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Biciclete stationare, monitorizare ritm cardiac.", 5),
(32, "Functional Training", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Echipamente multifunctionale, kettlebells, coarde de lupta.", 5);

INSERT INTO tblCamere VALUES
(33, "Sauna", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Sauna cu infrarosu, control al temperaturii, prosoape.", 6),
(34, "Bazin de Inot", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Ochelari de inot, costume de inot, placi de flotare.", 6),
(35, "Cardio", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Benzi de alergare, biciclete eliptice, steppere.", 6),
(36, "Yoga", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Saltele de yoga, blocuri, curele.", 6),
(37, "Greutati libere", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Haltere, gantere, banci de forta.", 6),
(38, "Sauna", "Capacitatea maxima de 10 persoane, sesiuni ghidate de yoga.", "Sauna cu infrarosu, prosoape, uleiuri esentiale.", 6),
(39, "Sauna", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Sauna cu infrarosu, prosoape, arome.", 6),
(40, "Bazin de Inot", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Ochelari de inot, costume de inot, capace de inot.", 6);

INSERT INTO tblCamere VALUES
(41, "Bazin de Inot", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Ochelari de inot, costume de inot, placi de flotare.", 7),
(42, "Yoga", "Capacitatea maxima de 10 persoane, sesiuni ghidate de yoga.", "Saltele de yoga, blocuri, curele.", 7),
(43, "Sauna", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Pietre pentru sauna, prosoape, uleiuri esentiale.", 7),
(44, "Sauna", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Pietre pentru sauna, prosoape, uleiuri esentiale.", 7),
(45, "Cardio", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Benzi de alergare, biciclete eliptice, steppere.", 7),
(46, "Meditatie", "Capacitatea maxima de 10 persoane, sesiuni ghidate de yoga.", "Covorase de meditatie, perne de meditatie, cronometre silentoase.", 7);

INSERT INTO tblCamere VALUES
(47, "Sauna cu Aromaterapie", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Sauna cu infrarosu, prosoape, difuzor de uleiuri esentiale.", 8),
(48, "Bazin de Inot", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Ochelari de inot, costume de inot, benzi de flotabilitate.", 8),
(49, "Spin Cycling", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Biciclete stationare, monitoare de ritm cardiac, ventilatie adecvata.", 8),
(50, "Yoga", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Saltele de yoga, blocuri de yoga, curele.", 8),
(51, "Sauna", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Pietre de sare Himalayana, sauna cu infrarosu, iluminare calmanta.", 8);

INSERT INTO tblCamere VALUES
(52, "Greutati libere", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Haltere, gantere, rack-uri pentru greutati.", 9),
(53, "Bazin de inot", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Ochelari de inot, costume de inot, placi de flotare.", 9),
(54, "Greutati libere", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Haltere, gantere, banci de forta.", 9),
(55, "Sauna", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Sauna cu infrarosu, prosoape, uleiuri esentiale.", 9),
(56, "Yoga", "Capacitatea maxima de 20 de persoane, antrenori optionali.", "Saltele de yoga, blocuri, curele.", 9),
(57, "MMA Training", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Saci de box, manusi de box, tapiterie pentru antrenament.", 9),
(58, "Aqua Gym", "Capacitatea maxima de 20 de persoane, antrenori optionali.", "Noodle-uri de apa, curele de flotabilitate, placi de aqua gym.", 9);

INSERT INTO tblCamere VALUES
(59, "Bazin de Inot", "Capacitatea maxima de 10 persoane, sesiuni ghidate de yoga.", "Ochelari de inot, costume de inot, placi de flotare.", 10),
(60, "Aqua Yoga", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Saltele de apa, curele de flotabilitate.", 10),
(61, "Hot Yoga", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Saltele de yoga, blocuri, curele, incalzitor de camera.", 10),
(62, "Kickboxing", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Saci de box, manusi de box, paviment anti-alunecare.", 10),
(63, "Sauna", "Capacitatea maxima de 10 persoane, acces fara antrenor.", "Sauna cu infrarosu, pietre pentru sauna, prosoape.", 10),
(64, "CrossFit", "Capacitatea maxima de 15 persoane, necesita antrenor.", "Roti de tractor, franghii groase, bare olimpice.", 10),
(65, "Yoga", "Capacitatea maxima de 20 de persoane, antrenori optional.", "Saltele de yoga, blocuri, curele.", 10),
(66, "Functional Training", "Capacitatea maxima de 5 persoane, necesita supraveghere.", "Kettlebells, benzi de rezistenta, echipament de agilitate.", 10);

/*inserare pentru tblAngajati*/
INSERT INTO tblAngajati VALUES
(1, "Ion", "Popescu", 2500, "Instructor", "2023-01-15", "0710123456", 1),
(2, "Maria", "Ionescu", 2200, "Specialist Sauna", "2023-02-01", "0728323456", 1),
(3, "Dan", "Marinescu", 3000, "Antrenor", "2023-03-20", "0772123456", 1),
(4, "Elena", "Dumitru", 2800, "Antrenor", "2023-04-10", "0723123456", 1),
(5, "Adrian", "Vasile", 2700, "Instructor", "2023-05-05", "0724123456", 1),
(6, "Loredana", "Chiriac", 2600, "Instructor", "2023-06-15", "0725123456", 1),
(7, "Cristian", "Nicolescu", 2400, "Instructor", "2023-07-22", "0726123456", 1),
(8, "Simona", "Georgescu", 2300, "Instructor", "2023-08-30", "0727123456", 1),
(9, "Vlad", "Tudor", 3200, "Antrenor", "2023-09-15", "0728123456", 1),
(10, "Ioana", "Munteanu", 2100, "Ghid Meditatie", "2023-10-01", "0729123456", 1),
(11, "Laura", "Antonescu", 2000, "Receptioner", "2023-01-10", "0730123416", 1),
(12, "Denisa", "Angelescu", 3200, "Manager Sala", "2023-03-03", "0728103463", 1),
(13, "Bogdan", "Cretu", 1900, "ingrijitor", "2023-01-15", "0731123456", 1);

INSERT INTO tblAngajati VALUES
(14, "Ana", "Marin", 2300, "Instructor", "2023-01-15", "0720103456", 2),
(15, "Catalin", "Negru", 2200, "Instructor", "2023-02-01", "0720103457", 2),
(16, "Diana", "Ilie", 2700, "Instructor Cardio", "2023-03-20", "0720103458", 2),
(17, "Bogdan", "Pop", 2800, "Antrenor Greutati libere", "2023-04-10", "0720103459", 2),
(18, "Elena", "Vasile", 2400, "Asistent Fitness", "2023-05-05", "0720103460", 2),
(19, "Loredana", "Popa", 2100, "Receptioner", "2023-01-20", "0720103461", 2),
(20, "Mihai", "Dumitru", 2000, "Ingrijitor", "2023-02-05", "0720103462", 2),
(21, "Sorina", "Constantin", 3200, "Manager Sala", "2023-03-01", "0720103463", 2);

INSERT INTO tblAngajati VALUES
(22, "Ana", "Popescu", 3000, "Receptioner", "2022-04-01", "0720123421", 3),
(23, "Mihai", "Ionescu", 4000, "ingrijitor", "2023-04-01", "0721234567", 3),
(24, "Ioana", "Marinescu", 5000, "Manager sala", "2024-02-01", "0720345978", 3),
(25, "Andrei", "Vasile", 3500, "Antrenor", "2021-04-10", "0720456789", 3), 
(26, "Larisa", "Neagu", 3200, "Antrenor", "2021-04-01", "0720567890", 3), 
(27, "Florin", "Dumitru", 3200, "Antrenor", "2020-05-01", "0720678901", 3); 

INSERT INTO tblAngajati VALUES
(28, "Sorina", "Georgescu", 3500, "Supraveghetor", "2024-05-01", "0720789012", 4),
(29, "Bogdan", "Antonescu", 3800, "Antrenor", "2024-05-05", "0720890123", 4),
(30, "Cristina", "Moldovan", 3500, "Antrenor", "2024-05-10", "0720901234", 4),
(31, "Darius", "Pop", 3800, "Antrenor", "2024-05-15", "0720123450", 4),
(32, "Elena", "Voinescu", 3700, "Antrenor", "2024-05-20", "0720123560", 4),
(33, "Florina", "Chiriac", 3700, "Antrenor", "2024-05-25", "0720123670", 4),
(34, "Ana", "Marinescu", 3070, "Receptioner", "2022-04-01", "0720123111", 4),
(35, "Mihai", "Popescu", 4050, "ingrijitor", "2023-04-01", "0722234567", 4),
(36, "Ioana", "Angelescu", 6000, "Manager sala", "2024-02-01", "0720345678", 4);

INSERT INTO tblAngajati VALUES
(37, "Stefan", "Marin", 3800, "Antrenor", "2024-05-10", "0721012345", 5),
(38, "Carmen", "Albu", 3500, "Supraveghetor", "2024-05-13", "0722123456", 5),
(39, "Adrian", "Popescu", 3700, "Supraveghetor", "2024-05-16", "0721934567", 5),
(40, "Bianca", "Mocanu", 3500, "Supraveghetor", "2024-05-19", "0721345678", 5),
(41, "Daniel", "Dumitrescu", 3700, "Supraveghetor", "2024-05-22", "0721456789", 5),
(42, "Elena", "Vasile", 3800, "Antrenor", "2024-05-25", "0721567890", 5),
(43, "Alex", "Ilie", 3200, "Operator Relaxation Zone", "2024-05-28", "0721678901", 5),
(44, "Diana", "Radu", 3300, "Receptioner", "2024-05-02", "0721789022", 5),
(45, "Costin", "Negru", 3400, "ingrijitor", "2024-05-06", "0721890133", 5),
(46, "Monica", "Barbu", 4800, "Manager sala", "2024-05-12", "0721901244", 5),
(47, "Irina", "Tudor", 3500, "Supraveghetor", "2024-05-01", "0721789012", 5),
(48, "Vlad", "Neagu", 3500, "Supraveghetor", "2024-05-04", "0721890123", 5),
(49, "Larisa", "Ion", 3700, "Supraveghetor", "2024-05-07", "0721901234", 5);

INSERT INTO tblAngajati VALUES
(50, "Iulia", "Neculai", 3500, "Supraveghetor", "2024-06-01", "0722001001", 6),
(51, "Ion", "Cretu", 3700, "Supraveghetor", "2024-06-03", "0722001002", 6),
(52, "Alina", "Mirea", 3500, "Supraveghetor", "2024-06-05", "0722001003", 6),
(53, "Radu", "Vasile", 3500, "Supraveghetor", "2024-06-07", "0722001004", 6),
(54, "Andrei", "Popovici", 3700, "Supraveghetor", "2024-06-09", "0722001005", 6),
(55, "Elena", "Ionescu", 3700, "Antrenor", "2024-06-11", "0722001006", 6),
(56, "Bogdan", "Petrescu", 3700, "Antrenor", "2024-06-13", "0722001007", 6),
(57, "Diana", "Albu", 3700, "Antrenor", "2024-06-15", "0722001008", 6),
(58, "Laura", "Condrea", 2000, "Receptioner", "2023-01-11", "0730121456", 6),
(59, "Denisa", "Mitrofan", 3200, "Manager Sala", "2023-03-13", "0727103463", 6),
(60, "Alexandra", "Cretu", 1900, "ingrijitor", "2023-01-25", "0731129456", 6);

INSERT INTO tblAngajati VALUES
(61, "Sorin", "Marin", 3500, "Supraveghetor Bazin de Inot", "2024-07-01", "0723002001", 7),
(62, "Ioana", "Dragomir", 3700, "Antrenor Yoga", "2024-07-03", "0723002002", 7),
(63, "Laura", "Popescu", 3500, "Supraveghetor Sauna", "2024-07-05", "0723002003", 7),
(64, "Mircea", "Ilie", 3700, "Antrenor Sauna", "2024-07-07", "0723002004", 7),
(65, "Cristina", "Vasilescu", 3700, "Antrenor Cardio", "2024-07-09", "0723002005", 7),
(66, "Dan", "Neculai", 3500, "Supraveghetor Meditatie", "2024-07-11", "0723002006", 7),
(67, "Petruta", "Condrea", 2000, "Receptioner", "2023-02-11", "0730123156", 7),
(68, "Andreea", "Mitrofan", 3200, "Manager Sala", "2023-04-13", "0726103463", 7),
(69, "Elena", "Cretu", 1900, "ingrijitor", "2023-02-25", "0731183456", 7);

INSERT INTO tblAngajati VALUES
(70, "Florin", "Petcu", 3500, "Supraveghetor", "2024-07-01", "0723003001", 8),
(71, "Ioana", "Gheorghe", 3500, "Supraveghetor", "2024-07-04", "0723003002", 8),
(72, "Mihai", "Radu", 3700, "Supraveghetor", "2024-07-07", "0723003003", 8),
(73, "Elena", "Popa", 3800, "Antrenor", "2024-07-10", "0723003004", 8),
(74, "Andrei", "Ionescu", 3700, "Supraveghetor", "2024-07-13", "0723003005", 8),
(75, "Laura", "Nicolescu", 3400, "ingrijitor", "2024-07-16", "0723003006", 8),
(76, "Dan", "Munteanu", 3300, "Receptioner", "2024-07-19", "0723003007", 8),
(77, "Simona", "Dumitrache", 4800, "Manager sala", "2024-07-22", "0723003008", 8);

INSERT INTO tblAngajati VALUES
(78, "Catalin", "Antonescu", 3500, "Supraveghetor", "2024-08-01", "0724004001", 9),
(79, "Iulia", "Constantin", 3500, "Supraveghetor", "2024-08-04", "0724004002", 9),
(80, "Sergiu", "Marinescu", 3700, "Antrenor", "2024-08-07", "0724004003", 9),
(81, "Dana", "Ilie", 3500, "Supraveghetor", "2024-08-10", "0724004004", 9),
(82, "Mirela", "Dumitru", 3700, "Antrenor", "2024-08-13", "0724004005", 9),
(83, "Cosmin", "Popa", 3500, "Supraveghetor", "2024-08-16", "0724004006", 9),
(84, "Flavia", "Neagu", 3700, "Antrenor", "2024-08-19", "0724004007", 9),
(85, "Robert", "Enache", 3400, "ingrijitor", "2024-08-22", "0724004008", 9),
(86, "Larisa", "Voicu", 3300, "Receptioner", "2024-08-25", "0724004009", 9),
(87, "Mihai", "Tudose", 4800, "Manager sala", "2024-08-28", "0724004010", 9);

INSERT INTO tblAngajati VALUES
(88, "Anca", "Mihaila", 3700, "Supraveghetor Bazin de Inot", "2024-09-01", "0725005001", 10),
(89, "Liviu", "Dragan", 3800, "Antrenor Aqua Yoga", "2024-09-04", "0725005002", 10),
(90, "Irina", "Toma", 3800, "Antrenor Hot Yoga", "2024-09-07", "0725005003", 10),
(91, "Teo", "Negru", 3500, "Supraveghetor Kickboxing", "2024-09-10", "0725005004", 10),
(92, "Mara", "Ionescu", 3500, "Supraveghetor Sauna", "2024-09-13", "0725005005", 10),
(93, "Bogdan", "Vasilescu", 3700, "Antrenor CrossFit", "2024-09-16", "0725005006", 10),
(94, "Daria", "Popescu", 3700, "Antrenor Yoga", "2024-09-19", "0725005007", 10),
(95, "Calin", "Stoica", 3700, "Antrenor Functional Training", "2024-09-22", "0725005008", 10),
(96, "Raluca", "Enache", 3400, "ingrijitor", "2024-09-25", "0725005009", 10),
(97, "Adrian", "Tudor", 3300, "Receptioner", "2024-09-28", "0725005010", 10),
(98, "Sonia", "Marin", 4800, "Manager sala", "2024-10-01", "0725005011", 10);

/*inserare pentru tblTiparAbonamente*/
INSERT INTO tblTiparAbonamente VALUES 
(1, "Abonament zilnic pentru toate salile", 30),
(2, "Abonament lunar pentru toate salile", 200),
(3, "Abonament anual pentru toate salile", 2000);

/*inserare pentru tblSaliAbonamente*/
INSERT INTO tblSaliAbonamente VALUES 
(1,1,1),
(2,1,2),
(3,1,3),
(4,2,1),
(5,2,2),
(6,2,3),
(7,3,1),
(8,3,2),
(9,3,3),
(10,4,1),
(11,4,2),
(12,4,3),
(13,5,1),
(14,5,2),
(15,5,3),
(16,6,1),
(17,6,2),
(18,6,3),
(19,7,1),
(20,7,2),
(21,7,3),
(22,8,1),
(23,8,2),
(24,8,3),
(25,9,1),
(26,9,2),
(27,9,3),
(28,10,1),
(29,10,2),
(30,10,3);

/*inserare pentru tblClienti*/
INSERT INTO tblClienti VALUES
(001, "Popescu", "Ion", "0720123156", "slabire", 1, "2023-04-03"),
(002, "Ionescu", "Ana", "0720123457", "crestere in masa musculara", 2,"2023-10-02"),
(003, "Vasilescu", "Elena", "0720123458", "tonifiere", 3,"2023-04-05"),
(004, "Marinescu", "Andrei", "0720123459", "slabire", 1, "2023-06-06"),
(005, "Nicolescu", "Maria", "0720123460", "crestere in masa musculara", 2, "2023-02-07"),
(006, "Dumitrescu", "Ioana", "0720123461", "tonifiere", 3, "2023-08-08"),
(007, "Petrescu", "Mihai", "0720123462", "slabire", 1, "2023-04-03"),
(008, "Oprea", "Tudor", "0720123463", "crestere in masa musculara", 2, "2023-03-03"),
(009, "Manolescu", "Cristina", "0720123464", "tonifiere", 3, "2023-03-05"),
(010, "Stanescu", "Florin", "0720123465", "slabire", 1, "2023-03-06");

INSERT INTO tblClienti VALUES
(011, "Georgescu", "Gabriel", "0720123466", "slabire", 1, "2023-03-07"),
(012, "Mihai", "Laura", "0720123467", "crestere in masa musculara", 2, "2023-03-08"),
(013, "Vlad", "Simona", "0720123468", "tonifiere", 3,"2023-03-09"),
(014, "Stefan", "Dan", "0720123469", "slabire", 1, "2023-03-10"),
(015, "Alexandru", "Loredana", "0720123470", "crestere in masa musculara", 2,"2023-03-11"),
(016, "Bogdan", "Eduard", "0720123471", "tonifiere", 3,"2023-03-14"),
(017, "Neagu", "Diana", "0720123472", "slabire", 1, "2023-03-15"),
(018, "Pop", "Cristian", "0720123473", "crestere in masa musculara", 2, "2023-03-16"),
(019, "Dinu", "Oana", "0720123474", "tonifiere", 3, "2023-03-19"),
(020, "Barbu", "Sorin", "0720123475", "slabire", 1, "2023-03-06");

INSERT INTO tblClienti VALUES
(021, "Costea", "Mircea", "0720123476", "slabire", 1, "2023-04-02"),
(022, "Ionita", "Claudia", "0720123477", "crestere in masa musculara", 2,"2023-04-03"),
(023, "Teodorescu", "Radu", "0720123478", "tonifiere", 3,"2023-04-04"),
(024, "Mocanu", "Silvia", "0720123479", "slabire", 1,"2023-04-05"),
(025, "Tabacu", "Ionut", "0720123480", "crestere in masa musculara", 2,"2023-04-06"),
(026, "Matei", "Alina", "0720123481", "tonifiere", 3,"2023-04-07"),
(027, "Voinea", "Florina", "0720123482", "slabire", 1,"2023-04-08"),
(028, "Dragomir", "Octavian", "0720123483", "crestere in masa musculara", 2,"2023-04-12"),
(029, "Anton", "Iulia", "0720123484", "tonifiere", 3,"2023-04-13"),
(030, "Marin", "Bogdan", "0720123485", "slabire", 1,"2023-04-14");

INSERT INTO tblClienti VALUES
(031, "Enache", "Larisa", "0720123486", "slabire", 1,"2023-04-15"),
(032, "Cojocaru", "Adrian", "0720123487", "crestere in masa musculara", 2,"2023-04-16"),
(033, "Nistor", "Delia", "0720123488", "tonifiere", 3,"2023-04-17"),
(034, "Dobre", "Marius", "0720123489", "slabire", 1,"2023-04-18"),
(035, "Rosu", "Camelia", "0720123490", "crestere in masa musculara", 2,"2023-04-19"),
(036, "Tudor", "Sergiu", "0720123491", "tonifiere", 3,"2023-04-20"),
(037, "Chirila", "Denisa", "0720123492", "slabire", 1,"2023-04-21"),
(038, "Lupu", "Radu", "0720123493", "crestere in masa musculara", 2, "2023-04-22"),
(039, "Moise", "Irina", "0720123494", "tonifiere", 3,"2023-04-23"),
(040, "Vasiliu", "George", "0720123495", "slabire", 1,"2023-04-24");

INSERT INTO tblClienti VALUES
(041, "Ilie", "Simona", "0720123496", "slabire", 1,"2023-04-25"),
(042, "Constantin", "Vlad", "0720123497", "crestere in masa musculara", 2,"2023-04-26"),
(043, "Sava", "Elena", "0720123498", "tonifiere", 3,"2023-05-01"),
(044, "Tomescu", "Bianca", "0720123499", "slabire", 1,"2023-05-03"),
(045, "Munteanu", "Claudiu", "0720123500", "crestere in masa musculara", 2,"2023-05-04"),
(046, "Sorin", "Alexandra", "0720123501", "tonifiere", 3,"2023-05-07"),
(047, "Popa", "Ionut", "0720123502", "slabire", 1,"2023-05-09"),
(048, "Diaconu", "Mihaela", "0720123503", "crestere in masa musculara", 2,"2023-05-10"),
(049, "Mihalcea", "Ciprian", "0720123504", "tonifiere", 3,"2023-05-13"),
(050, "Stanciu", "Livia", "0720123505", "slabire", 1,"2023-05-15"),
(051, "Dumitrache", "Ovidiu", "0720123506", "crestere in masa musculara", 2,"2023-05-16"),
(052, "Sandu", "Alin", "0720123507", "tonifiere", 3,"2023-05-17"),
(053, "Ciobanu", "Ioana", "0720123508", "slabire", 1,"2023-05-21"),
(054, "Stan", "Florin", "0720123509", "crestere in masa musculara", 2,"2023-05-23"),
(055, "Nicolae", "Gabriela", "0720123510", "tonifiere", 3,"2023-05-24"),
(056, "Dinca", "Mihai", "0720123511", "slabire", 1,"2023-05-27"),
(057, "Voicu", "Catalina", "0720123512", "crestere in masa musculara", 2,"2023-05-29"),
(058, "Gheorghe", "Robert", "0720123513", "tonifiere", 3,"2023-05-30"),
(059, "Manea", "Sorina", "0720123514", "slabire", 1,"2023-06-02"),
(060, "Ungureanu", "Victor", "0720123515", "crestere in masa musculara", 2,"2023-06-04");

INSERT INTO tblClienti VALUES
(061, "Negru", "Andreea", "0720123516", "slabire", 1,"2023-06-06"),
(062, "Badea", "Florinel", "0720123517", "crestere in masa musculara", 2,"2023-06-07"),
(063, "Costin", "Daniela", "0720123518", "tonifiere", 3,"2023-06-10"),
(064, "Dumitru", "Razvan", "0720123519", "slabire", 1,"2023-06-12"),
(065, "Bucur", "Patricia", "0720123520", "crestere in masa musculara", 2,"2023-06-13"),
(066, "Florea", "Liviu", "0720123521", "tonifiere", 3,"2023-06-16"),
(067, "Toma", "Adelina", "0720123522", "slabire", 1,"2023-06-18"),
(068, "Ionescu", "Stefan", "0720123523", "crestere in masa musculara", 2,"2023-06-19"),
(069, "Marin", "Mihaela", "0720123524", "tonifiere", 3,"2023-06-22"),
(070, "Nita", "Bogdan", "0720123525", "slabire", 1,"2023-06-24"),
(071, "Stoica", "Iuliana", "0720123526", "crestere in masa musculara", 2,"2023-06-25"),
(072, "Zaharia", "Cristi", "0720123527", "tonifiere", 3,"2023-06-26"),
(073, "Albu", "Monica", "0720123528", "slabire", 1,"2023-07-01"),
(074, "Ciucu", "Adrian", "0720123529", "crestere in masa musculara", 2,"2023-07-02"),
(075, "Dan", "Sorin", "0720123530", "tonifiere", 3,"2023-07-03"),
(076, "Filip", "Larisa", "0720123531", "slabire", 1,"2023-07-06"),
(077, "Gavrila", "Bianca", "0720123532", "crestere in masa musculara", 2,"2023-07-08"),
(078, "Hagi", "Cristian", "0720123533", "tonifiere", 3,"2023-07-10"),
(079, "Iliescu", "Eugenia", "0720123534", "slabire", 1,"2023-07-12"),
(080, "Jianu", "Octavian", "0720123535", "crestere in masa musculara", 2,"2023-07-14");

INSERT INTO tblClienti VALUES
(081, "Kovacs", "Andrei", "0720123536", "slabire", 1,"2023-07-15"),
(082, "Lazar", "Cristina", "0720123537", "crestere in masa musculara", 2,"2023-07-16"),
(083, "Mocan", "Dorin", "0720123538", "tonifiere", 3,"2023-10-20"),
(084, "Nedelcu", "Elena", "0720123539", "slabire", 1,"2023-07-23"),
(085, "Oprea", "Florin", "0720123540", "crestere in masa musculara", 2,"2023-07-24"),
(086, "Pavel", "Gabriela", "0720123541", "tonifiere", 3,"2023-07-26"),
(087, "Radu", "Horia", "0720123542", "slabire", 1,"2023-07-28"),
(088, "Serban", "Ioana", "0720123543", "crestere in masa musculara", 2,"2023-07-30"),
(089, "Tanase", "Julia", "0720123544", "tonifiere", 3,"2023-08-01"),
(090, "Ursu", "Klara", "0720123545", "slabire", 1,"2023-08-03"),
(091, "Vlad", "Liviu", "0720123546", "crestere in masa musculara", 2,"2023-08-04"),
(092, "Werner", "Maria", "0720123547", "tonifiere", 3,"2023-08-05"),
(093, "Xenopol", "Nicu", "0720123548", "slabire", 1,"2023-08-09"),
(094, "Yorke", "Otilia", "0720123549", "crestere in masa musculara", 2,"2023-08-11"),
(095, "Zamfir", "Paul", "0720123550", "tonifiere", 3, "2023-08-12"),
(096, "Adamescu", "Quintus", "0720123551", "slabire", 1, "2023-08-15"),
(097, "Balcescu", "Ruxandra", "0720123552", "crestere in masa musculara", 2,"2023-08-17"),
(098, "Calinescu", "Stefan", "0720123553", "tonifiere", 3,"2023-08-18"),
(099, "Dumitrescu", "Tatiana", "0720123554", "slabire", 1,"2023-08-21"),
(100, "Enache", "Ursula", "0720123555", "crestere in masa musculara", 2,"2023-08-21");

INSERT INTO tblClienti VALUES
(101, "Florescu", "Valentina", "0720123556", "slabire", 1,"2023-08-23"),
(102, "Georgescu", "Walter", "0720123557", "crestere in masa musculara", 2,"2023-08-24"),
(103, "Horatiu", "Xenia", "0720123558", "tonifiere", 3,"2023-08-29"),
(104, "Ivan", "Yolanda", "0720123559", "slabire", 1, "2023-08-31"),
(105, "Jude", "Zoltan", "0720123560", "crestere in masa musculara", 2,"2023-09-01"),
(106, "Kogalniceanu", "Aurelia", "0720123561", "tonifiere", 3,"2023-09-04"),
(107, "Luca", "Bogdan", "0720123562", "slabire", 1,"2023-09-06"),
(108, "Marian", "Carmen", "0720123563", "crestere in masa musculara", 2,"2023-09-07"),
(109, "Nicolau", "Dragos", "0720123564", "tonifiere", 3,"2023-09-04"),
(110, "Olariu", "Ema", "0720123565", "slabire", 1,"2023-09-12"),
(111, "Pana", "Felix", "0720123566", "crestere in masa musculara", 2,"2023-09-13"),
(112, "Quintana", "Greta", "0720123567", "tonifiere", 3,"2023-09-14"),
(113, "Radulescu", "Horia", "0720123568", "slabire", 1,"2023-09-18"),
(114, "Stanescu", "Irina", "0720123569", "crestere in masa musculara", 2, "2023-09-20"),
(115, "Tudorache", "Jana", "0720123570", "tonifiere", 3,"2023-09-21"),
(116, "Ungureanu", "Klaus", "0720123571", "slabire", 1,"2023-09-24"),
(117, "Vasilescu", "Larisa", "0720123572", "crestere in masa musculara", 2,"2023-09-26"),
(118, "Weber", "Mircea", "0720123573", "tonifiere", 3,"2023-09-27"),
(119, "Xenia", "Nadia", "0720123574", "slabire", 1,"2023-10-01"),
(120, "Yordan", "Octavia", "0720123575", "crestere in masa musculara", 2,"2023-10-02");

/*inserare pentru tblClientSaliFitness*/
INSERT INTO tblClientSaliFitness VALUES
(001, 001, 1, "2023-04-03 08:00:00"),
(002, 002, 5, "2023-10-02 10:00:00"),
(003, 002, 2, "2023-10-03 11:00:00"),
(004, 002, 4, "2023-11-01 12:00:00"),
(005, 003, 6, "2023-04-05 13:00:00"),
(006, 004, 7, "2023-06-06 14:00:00"),
(007, 005, 8, "2023-02-07 15:00:00"),
(008, 006, 9, "2023-08-08 16:00:00"),
(009, 006, 10, "2024-07-09 17:00:00"),
(010, 007, 4, "2023-04-03 08:00:00");

INSERT INTO tblClientSaliFitness VALUES
(011, 008, 2, "2023-03-03 14:00:00"),
(012, 008, 5, "2023-03-10 10:00:00"),
(013, 008, 1, "2023-03-14 15:00:00"),
(014, 009, 3, "2023-03-05 16:00:00"),
(015, 009, 4, "2023-04-12 12:00:00"),
(016, 009, 6, "2023-09-19 11:00:00"),
(017, 010, 2, "2023-03-06 17:00:00"),
(018, 011, 4, "2023-03-07 18:00:00"),
(019, 012, 5, "2023-03-08 19:00:00"),
(020, 013, 6, "2023-03-09 20:00:00"),
(021, 014, 1, "2023-03-10 08:30:00"),
(022, 015, 2, "2023-03-11 09:30:00"),
(023, 015, 3, "2023-03-17 10:30:00"),
(024, 015, 4, "2023-03-19 11:30:00"),
(025, 016, 5, "2023-03-14 12:30:00"),
(026, 017, 6, "2023-03-15 13:30:00"),
(027, 018, 1, "2023-03-16 14:30:00"),
(028, 019, 6, "2023-03-19 11:00:00"),
(029, 020, 2, "2023-03-06 17:00:00");

INSERT INTO tblClientSaliFitness VALUES
(030, 021, 1, "2023-04-02 15:00:00"),
(031, 022, 3, "2023-04-03 10:00:00"),
(032, 022, 2, "2023-04-09 16:00:00"),
(033, 023, 4, "2023-04-04 11:00:00"),
(034, 023, 3, "2023-04-10 17:00:00"),
(035, 023, 5, "2023-04-11 12:00:00"),
(036, 024, 4, "2023-04-05 18:00:00"),
(037, 025, 5, "2023-04-06 19:00:00"),
(038, 026, 1, "2023-04-07 20:00:00"),
(039, 027, 2, "2023-04-08 21:00:00"),
(040, 028, 1, "2023-04-12 13:00:00"),
(041, 029, 2, "2023-04-13 14:00:00"),
(042, 030, 3, "2023-04-14 15:00:00"),
(043, 031, 4, "2023-04-15 16:00:00"),
(044, 032, 5, "2023-04-16 17:00:00"),
(045, 033, 1, "2023-04-17 18:00:00"),
(046, 034, 2, "2023-04-18 19:00:00"),
(047, 035, 3, "2023-04-19 20:00:00"),
(048, 036, 4, "2023-04-20 21:00:00"),
(049, 037, 5, "2023-04-21 22:00:00"),
(050, 038, 1, "2023-04-22 23:00:00"),
(051, 039, 2, "2023-04-23 23:00:00"),
(052, 040, 3, "2023-04-24 01:00:00");

INSERT INTO tblClientSaliFitness VALUES
(053, 041, 5, "2023-04-25 02:00:00"),
(054, 042, 1, "2023-04-26 03:00:00"),
(055, 042, 2, "2023-04-27 04:00:00"),
(056, 042, 3, "2023-04-28 05:00:00"),
(057, 042, 4, "2023-04-29 06:00:00"),
(058, 042, 5, "2023-04-30 07:00:00"),
(059, 043, 1, "2023-05-01 08:00:00"),
(060, 043, 2, "2023-09-02 09:00:00"),
(061, 044, 3, "2023-05-03 10:00:00"),
(062, 045, 4, "2023-05-04 11:00:00"),
(063, 045, 5, "2023-05-08 12:00:00"),
(064, 045, 1, "2023-05-16 13:00:00"),
(065, 046, 2, "2023-05-07 14:00:00"),
(066, 046, 3, "2023-09-08 15:00:00"),
(067, 047, 4, "2023-05-09 16:00:00"),
(068, 048, 5, "2023-05-10 17:00:00"),
(069, 048, 1, "2023-05-20 18:00:00"),
(070, 048, 2, "2023-05-29 19:00:00"),
(071, 049, 3, "2023-05-13 20:00:00"),
(072, 049, 4, "2023-11-14 21:00:00"),
(073, 050, 5, "2023-05-15 22:00:00"),
(074, 051, 1, "2023-05-16 23:00:00"),
(075, 052, 2, "2023-05-17 00:00:00"),
(076, 052, 3, "2023-08-18 01:00:00"),
(077, 052, 4, "2023-09-19 02:00:00"),
(078, 052, 5, "2023-12-20 03:00:00"),
(079, 053, 1, "2023-05-21 04:00:00"),
(080, 053, 2, "2023-05-21 15:00:00"),
(081, 054, 3, "2023-05-23 06:00:00"),
(082, 055, 4, "2023-05-24 07:00:00"),
(083, 055, 5, "2023-08-25 08:00:00"),
(084, 055, 1, "2023-12-26 09:00:00"),
(085, 056, 2, "2023-05-27 10:00:00"),
(086, 056, 3, "2023-05-27 19:00:00"),
(087, 057, 4, "2023-05-29 12:00:00"),
(088, 058, 5, "2023-05-30 13:00:00"),
(089, 058, 1, "2023-09-30 14:00:00"),
(090, 058, 2, "2023-11-01 15:00:00"),
(091, 059, 3, "2023-06-02 05:00:00"),
(092, 059, 4, "2023-06-02 17:00:00"),
(093, 060, 5, "2023-06-04 18:00:00");

INSERT INTO tblClientSaliFitness VALUES
(094, 061, 1, "2023-06-06 08:00:00"),
(095, 062, 2, "2023-06-07 09:00:00"),
(096, 062, 3, "2023-06-15 10:00:00"),
(097, 062, 4, "2023-06-18 11:00:00"),
(098, 063, 5, "2023-06-10 12:00:00"),
(099, 063, 1, "2023-09-11 13:00:00"),
(100, 064, 2, "2023-06-12 14:00:00"),
(101, 065, 3, "2023-06-13 15:00:00"),
(102, 065, 4, "2023-06-14 16:00:00"),
(103, 065, 5, "2023-06-15 17:00:00"),
(104, 066, 1, "2023-06-16 18:00:00"),
(105, 066, 2, "2023-06-27 19:00:00"),
(106, 067, 3, "2023-06-18 20:00:00"),
(107, 068, 4, "2023-06-19 21:00:00"),
(108, 068, 5, "2023-06-20 22:00:00"),
(109, 068, 1, "2023-06-21 23:00:00"),
(110, 069, 2, "2023-06-22 00:00:00"),
(111, 069, 3, "2023-08-23 01:00:00"),
(112, 070, 4, "2023-06-24 02:00:00"),
(113, 071, 5, "2023-06-25 03:00:00"),
(114, 072, 1, "2023-06-26 04:00:00"),
(115, 072, 2, "2023-08-27 05:00:00"),
(116, 072, 3, "2023-10-28 06:00:00"),
(117, 072, 4, "2023-12-29 07:00:00"),
(118, 073, 5, "2023-07-01 03:00:00"),
(119, 073, 1, "2023-07-01 12:00:00"),
(120, 074, 2, "2023-07-02 10:00:00"),
(121, 075, 3, "2023-07-03 11:00:00"),
(122, 075, 4, "2023-10-04 12:00:00"),
(123, 075, 5, "2023-12-05 13:00:00"),
(124, 076, 1, "2023-07-06 14:00:00"),
(125, 076, 2, "2023-07-06 20:00:00"),
(126, 077, 3, "2023-07-08 16:00:00"),
(127, 077, 4, "2023-07-12 17:00:00"),
(128, 078, 5, "2023-07-10 18:00:00"),
(129, 078, 1, "2023-12-11 19:00:00"),
(130, 079, 2, "2023-07-12 04:00:00"),
(131, 079, 3, "2023-07-12 21:00:00"),
(132, 080, 4, "2023-07-14 22:00:00"),
(133, 081, 5, "2023-07-15 23:00:00"),
(134, 082, 1, "2023-07-16 00:00:00"),
(135, 082, 2, "2023-07-17 01:00:00"),
(136, 082, 3, "2023-07-18 02:00:00"),
(137, 082, 4, "2023-07-19 03:00:00"),
(138, 083, 5, "2023-10-20 04:00:00"),
(139, 083, 1, "2023-07-21 05:00:00"),
(140, 083, 2, "2024-07-16 06:00:00"),
(141, 084, 3, "2023-07-23 07:00:00"),
(142, 085, 4, "2023-07-24 08:00:00"),
(143, 085, 5, "2023-07-25 09:00:00"),
(144, 086, 1, "2023-07-26 10:00:00"),
(145, 086, 2, "2024-03-27 11:00:00"),
(146, 087, 3, "2023-07-28 12:00:00"),
(147, 087, 4, "2023-07-28 19:00:00"),
(148, 088, 5, "2023-07-30 14:00:00"),
(149, 088, 1, "2023-08-12 15:00:00"),
(150, 089, 2, "2023-08-01 16:00:00"),
(151, 089, 3, "2023-12-02 17:00:00"),
(152, 090, 4, "2023-08-03 18:00:00"),
(153, 091, 5, "2023-08-04 19:00:00"),
(154, 092, 1, "2023-08-05 20:00:00"),
(155, 092, 2, "2023-09-06 21:00:00"),
(156, 092, 3, "2023-10-07 22:00:00"),
(157, 092, 4, "2023-12-08 23:00:00"),
(158, 093, 5, "2023-08-09 00:00:00"),
(159, 093, 1, "2023-08-09 21:00:00"),
(160, 094, 2, "2023-08-11 02:00:00"),
(161, 095, 3, "2023-08-12 03:00:00"),
(162, 095, 4, "2023-12-13 04:00:00"),
(163, 095, 5, "2024-06-14 05:00:00"),
(164, 096, 1, "2023-08-15 06:00:00"),
(165, 096, 2, "2023-08-15 15:00:00"),
(166, 097, 3, "2023-08-17 08:00:00"),
(167, 098, 4, "2023-08-18 09:00:00"),
(168, 098, 5, "2023-12-19 10:00:00"),
(169, 098, 1, "2023-12-20 11:00:00"),
(170, 099, 2, "2023-08-21 12:00:00"),
(171, 100, 3, "2023-08-21 19:00:00"),
(172, 101, 4, "2023-08-23 14:00:00"),
(173, 102, 5, "2023-08-24 15:00:00");

INSERT INTO tblClientSaliFitness VALUES
(174, 102, 1, "2023-08-25 08:00:00"),
(175, 102, 2, "2023-08-26 09:00:00"),
(176, 102, 3, "2023-08-27 10:00:00"),
(177, 102, 4, "2023-08-28 11:00:00"),
(178, 103, 5, "2023-08-29 12:00:00"),
(179, 103, 1, "2023-12-30 13:00:00"),
(180, 104, 2, "2023-08-31 14:00:00"),
(181, 105, 3, "2023-09-01 15:00:00"),
(182, 105, 4, "2023-09-06 16:00:00"),
(183, 105, 5, "2023-09-12 17:00:00"),
(184, 106, 1, "2023-09-04 18:00:00"),
(185, 106, 2, "2023-09-14 19:00:00"),
(186, 107, 3, "2023-09-06 20:00:00"),
(187, 108, 4, "2023-09-07 21:00:00"),
(188, 108, 5, "2023-09-12 22:00:00"),
(189, 108, 1, "2023-09-17 23:00:00"),
(190, 109, 2, "2023-09-04 00:00:00"),
(191, 109, 3, "2023-09-12 01:00:00"),
(192, 110, 4, "2023-09-12 02:00:00"),
(193, 111, 5, "2023-09-13 03:00:00"),
(194, 112, 1, "2023-09-14 04:00:00"),
(195, 112, 2, "2023-12-15 05:00:00"),
(196, 112, 3, "2023-12-18 06:00:00"),
(197, 112, 4, "2023-12-21 07:00:00"),
(198, 113, 5, "2023-09-18 08:00:00"),
(199, 113, 1, "2023-09-18 12:00:00"),
(200, 114, 2, "2023-09-20 10:00:00"),
(201, 115, 3, "2023-09-21 11:00:00"),
(202, 115, 4, "2023-10-22 12:00:00"),
(203, 115, 5, "2023-12-23 13:00:00"),
(204, 116, 1, "2023-09-24 14:00:00"),
(205, 116, 2, "2023-09-24 19:00:00"),
(206, 117, 3, "2023-09-26 16:00:00"),
(207, 118, 4, "2023-09-27 17:00:00"),
(208, 118, 5, "2023-10-28 18:00:00"),
(209, 118, 1, "2023-12-29 19:00:00"),
(210, 119, 2, "2023-10-01 05:00:00"),
(211, 119, 3, "2023-10-01 21:00:00"),
(212, 120, 4, "2023-10-02 22:00:00");


ALTER TABLE tblSaliFitness ADD COLUMN imagineSala VARCHAR(100);
UPDATE tblSaliFitness SET imagineSala = 'carousel-1.jpg' WHERE idSala = 1;
UPDATE tblSaliFitness SET imagineSala = 'carousel-2.jpg' WHERE idSala = 2;
UPDATE tblSaliFitness SET imagineSala = 'carousel-3.jpg' WHERE idSala = 3;
UPDATE tblSaliFitness SET imagineSala = 'carousel-4.jpg' WHERE idSala = 4;
UPDATE tblSaliFitness SET imagineSala = 'carousel-5.jpg' WHERE idSala = 5;
UPDATE tblSaliFitness SET imagineSala = 'carousel-6.jpg' WHERE idSala = 6;
UPDATE tblSaliFitness SET imagineSala = 'carousel-7.jpg' WHERE idSala = 7;
UPDATE tblSaliFitness SET imagineSala = 'carousel-8.jpg' WHERE idSala = 8;
UPDATE tblSaliFitness SET imagineSala = 'carousel-9.jpg' WHERE idSala = 9;
UPDATE tblSaliFitness SET imagineSala = 'carousel-10.jpg' WHERE idSala = 10;


/*#############################################################*/
/*  PARTEA 4 - VIZUALIZAREA STUCTURII BD SI A INREGISTRARILOR  */
DESCRIBE tblSaliFitness;
DESCRIBE tblCamere;
DESCRIBE tblAngajati;
DESCRIBE tblTiparAbonamente;
DESCRIBE tblSaliAbonamente;
DESCRIBE tblClienti;
DESCRIBE tblClientSaliFitness;

SELECT * FROM tblSaliFitness;
SELECT * FROM tblCamere;
SELECT * FROM tblAngajati;
SELECT * FROM tblTiparAbonamente;
SELECT * FROM tblSaliAbonamente;
SELECT * FROM tblClienti;
SELECT * FROM tblClientSaliFitness;
/*#############################################################*/
