ALTER TABLE peligros_permiso DROP CONSTRAINT permiso_ries_trab_fk;
CREATE TABLE tarea (
	id bigserial NOT NULL,
	datos text NOT NULL
);
ALTER TABLE tarea ADD CONSTRAINT tarea_pk PRIMARY KEY(id);
ALTER TABLE tarea ADD id_permiso bigint NOT NULL;
ALTER TABLE tarea ADD CONSTRAINT permiso_trab_tarea_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE peligros_permiso RENAME TO peligros_tarea;
ALTER TABLE peligros_tarea RENAME COLUMN id_permiso TO id_tarea;
ALTER TABLE riesgos_peligro_permiso RENAME TO riesgos_peligro_tarea;
ALTER TABLE riesgos_peligro_tarea RENAME COLUMN id_peligro_permiso TO id_peligro_tarea;
ALTER TABLE peligros_tarea ADD CONSTRAINT peligros_tarea_fk FOREIGN KEY (id_tarea) REFERENCES tarea(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE sector RENAME COLUMN rol TO grupo;
ALTER TABLE control ALTER consecutivo TYPE int4;
ALTER TABLE control DROP COLUMN consecutivo;
ALTER TABLE control ADD consecutivo int4;
