CREATE TABLE controles_peligro_tarea (
	id bigserial NOT NULL,
	id_peligro_tarea bigint NOT NULL,
	control text NOT NULL
);
ALTER TABLE controles_peligro_tarea ADD CONSTRAINT controles_peligro_tarea_pk PRIMARY KEY(id);
ALTER TABLE controles_peligro_tarea ADD CONSTRAINT cont_peligro_tarea_fk FOREIGN KEY (id_peligro_tarea) REFERENCES peligros_tarea(id) ON DELETE CASCADE ON UPDATE CASCADE;
