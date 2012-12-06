ALTER TABLE trabajo DROP CONSTRAINT trabajo_proyecto;
ALTER TABLE trabajo DROP COLUMN num_orden_trabajo;
ALTER TABLE trabajo DROP COLUMN id_proyecto;
ALTER TABLE trabajo ADD id_proyecto bigint;
ALTER TABLE trabajo ADD num_orden bigint;
ALTER TABLE trabajo ADD CONSTRAINT proyecto_trabajo_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE proyecto ADD estado int4;
ALTER TABLE proyecto RENAME COLUMN estado TO id_estado;
CREATE TABLE estados_proyecto (
	id serial NOT NULL,
	nombre varchar(600) NOT NULL
);
ALTER TABLE estados_proyecto ADD CONSTRAINT estados_proyecto_pk PRIMARY KEY(id);
ALTER TABLE proyecto ADD CONSTRAINT estado_proyecto_fk FOREIGN KEY (id_estado) REFERENCES estados_proyecto(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
insert into estados_proyecto values (1, 'ACTIVO');
insert into estados_proyecto values (2, 'TERMINADO');
insert into estados_proyecto values (3, 'CANCELADO');
