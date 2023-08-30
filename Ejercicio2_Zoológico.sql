CREATE TABLE zoológicos (
	zoo_NIT SERIAL NOT NULL,
	nombre VARCHAR (30),
	ciudad VARCHAR (30),
	pais VARCHAR (20),
	tamaño INTEGER,
	presupuesto NUMERIC,
	PRIMARY KEY (zoo_NIT)
);


CREATE TABLE animales (
	serial_chip SERIAL NOT NULL,
	nombre_coloquial VARCHAR (30),
	nombre_cientifico VARCHAR (30),
	familia VARCHAR (30),
	peligro_extincion BOOLEAN,
	PRIMARY KEY (serial_chip)
);


CREATE TABLE animales_ubicados_zoo (
	serial_chip_au SERIAL NOT NULL,
	num_identificacion VARCHAR (30),
	especie INTEGER,
	sexo VARCHAR (20),
	fecha_nacimiento INTEGER,
	pais VARCHAR (20),
	continente VARCHAR (20),
	zoo_NIT SERIAL NOT NULL,
	PRIMARY KEY (serial_chip_au),
	FOREIGN KEY (especie)
		REFERENCES animales (serial_chip),
	FOREIGN KEY (zoo_NIT)
		REFERENCES zoológicos (zoo_NIT)
);