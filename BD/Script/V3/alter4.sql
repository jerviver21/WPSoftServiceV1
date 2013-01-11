ALTER TABLE users DROP COLUMN estado;
ALTER TABLE users ADD vetado boolean DEFAULT false;
ALTER TABLE users ADD activo boolean DEFAULT true;
CREATE TABLE administradoras (
	codigo varchar(10) NOT NULL,
	nombre varchar(1500) NOT NULL,
	tipo int4 NOT NULL
);
ALTER TABLE administradoras ADD CONSTRAINT administradoras_pk PRIMARY KEY(codigo);
ALTER TABLE administradoras DROP COLUMN tipo;
ALTER TABLE administradoras ADD tipo varchar(200) NOT NULL;
ALTER TABLE users ADD estado int4 NOT NULL default 1;

INSERT INTO administradoras VALUES ('EPS001', 'COOMEVA', 'EPS');
INSERT INTO administradoras VALUES ('ARP001', 'SURA', 'ARP');


