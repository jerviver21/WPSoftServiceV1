CREATE TABLE idiomas (
	id varchar(3) NOT NULL,
	nombre varchar(255) NOT NULL
);
ALTER TABLE idiomas ADD CONSTRAINT idiomas_pk PRIMARY KEY(id);
