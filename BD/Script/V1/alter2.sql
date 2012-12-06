CREATE TABLE data (
	nombre character varying(100) NOT NULL,
	descripcion character varying(1000)
);
ALTER TABLE data ADD CONSTRAINT data_pk PRIMARY KEY(nombre);
ALTER TABLE data ALTER descripcion TYPE varchar(1000);
ALTER TABLE data ALTER nombre TYPE varchar(100);
CREATE TABLE tipo_parametro_reporte (
	tipo varchar(100) NOT NULL,
	descripcion varchar(1000)
);
ALTER TABLE tipo_parametro_reporte ADD CONSTRAINT tipo_parametro_reporte_pk PRIMARY KEY(tipo);
CREATE TABLE parametro_reporte (
	nombre varchar(100) NOT NULL,
	etiqueta varchar(1000) NOT NULL,
	fk_reporte varchar(100) NOT NULL,
	fk_tipo integer NOT NULL,
	fk_data integer NOT NULL
);
ALTER TABLE parametro_reporte ADD CONSTRAINT parametro_reporte_pk PRIMARY KEY(nombre);
CREATE TABLE reporte (
	nombre varchar(100) NOT NULL,
	roles text NOT NULL DEFAULT 'ALL',
	proceso varchar(1000) NOT NULL DEFAULT 'Reportes'
);
ALTER TABLE reporte ADD CONSTRAINT reporte_pk PRIMARY KEY(nombre);
CREATE TABLE archivo (
	nombre varchar(100) NOT NULL,
	nombre_archivo varchar(2000) NOT NULL,
	nombre_jasper varchar(1000) NOT NULL,
	fk_tipo_archivo integer
);
ALTER TABLE archivo ADD CONSTRAINT archivo_fk PRIMARY KEY(nombre);
CREATE TABLE tipo_archivo (
	id integer NOT NULL,
	tipo varchar(100)
);
ALTER TABLE tipo_archivo ADD CONSTRAINT tipo_archivo_pk PRIMARY KEY(id);
ALTER TABLE tipo_parametro_reporte DROP COLUMN descripcion;
ALTER TABLE tipo_parametro_reporte DROP CONSTRAINT tipo_parametro_reporte_pk;
ALTER TABLE tipo_parametro_reporte ADD id integer;
ALTER TABLE tipo_parametro_reporte ADD descripcion varchar(1000);
ALTER TABLE tipo_parametro_reporte ADD CONSTRAINT tipo_parametro_reporte_pk PRIMARY KEY(id);
ALTER TABLE data ADD id integer;
ALTER TABLE data DROP CONSTRAINT data_pk;
ALTER TABLE data ADD CONSTRAINT data_pk PRIMARY KEY(id);
ALTER TABLE parametro_reporte ADD id integer;
ALTER TABLE parametro_reporte DROP CONSTRAINT parametro_reporte_pk;
ALTER TABLE parametro_reporte ADD CONSTRAINT parametro_reporte_pk PRIMARY KEY(id);
ALTER TABLE archivo ADD fk_reporte varchar(100) NOT NULL;
ALTER TABLE archivo ALTER fk_tipo_archivo TYPE integer;
CREATE TABLE tipo_id (
	id integer,
	codigo varchar(100)
);
ALTER TABLE tipo_id ADD CONSTRAINT tipo_id_pk PRIMARY KEY(id);
ALTER TABLE parametro_reporte ADD CONSTRAINT param_tipo_param_fk FOREIGN KEY (fk_tipo) REFERENCES tipo_parametro_reporte(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE parametro_reporte ADD CONSTRAINT param_data_fk FOREIGN KEY (fk_data) REFERENCES data(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE parametro_reporte DROP CONSTRAINT param_data_fk;
ALTER TABLE parametro_reporte ADD CONSTRAINT param_data_fk FOREIGN KEY (fk_data) REFERENCES data(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE parametro_reporte DROP CONSTRAINT param_tipo_param_fk;
ALTER TABLE parametro_reporte ADD CONSTRAINT param_tipo_param_fk FOREIGN KEY (fk_tipo) REFERENCES tipo_parametro_reporte(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE parametro_reporte ADD CONSTRAINT param_reporte_fk FOREIGN KEY (fk_reporte) REFERENCES reporte(nombre) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE archivo ADD CONSTRAINT archivo_reporte_fk FOREIGN KEY (fk_reporte) REFERENCES reporte(nombre) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE archivo ADD CONSTRAINT arch_tipo_arch_fk FOREIGN KEY (fk_tipo_archivo) REFERENCES tipo_archivo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE archivo DROP CONSTRAINT archivo_reporte_fk;
ALTER TABLE archivo ADD CONSTRAINT archivo_reporte_fk FOREIGN KEY (fk_reporte) REFERENCES reporte(nombre) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO data VALUES ( 'TIPOS_ID', 'Representa los tipos de identificación que puede tener una persona', 1);
INSERT INTO tipo_archivo VALUES (1, 'XLS');
INSERT INTO tipo_archivo VALUES (2, 'PDF');
INSERT INTO tipo_archivo VALUES (3, 'TXT');

INSERT INTO tipo_parametro_reporte VALUES ( 'NUMERIC', 1,'Representa valores numéricos: int, long, double, float');
INSERT INTO tipo_parametro_reporte VALUES ( 'TEXT', 2,'Representa cadenas de texto');
INSERT INTO tipo_parametro_reporte VALUES ( 'DATE', 3,'Representa Fechas');
INSERT INTO tipo_parametro_reporte VALUES ( 'TIME', 4,'Representa Horas');
INSERT INTO tipo_parametro_reporte VALUES ( 'DATA', 5,'Representa tablas multivaluadas, como municipios, tipos de id, etc; DEBE EXISTIR UNA TABLA que las represente');

INSERT INTO tipo_id VALUES (1, 'CC');
INSERT INTO tipo_id VALUES (2, 'NIT');
INSERT INTO tipo_id VALUES (3, 'CE');
