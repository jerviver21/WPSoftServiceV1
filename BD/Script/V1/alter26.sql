ALTER TABLE trazabilidad_tarea DROP COLUMN etapa;
ALTER TABLE trazabilidad_tarea ADD id_estado_tarea int4 NOT NULL DEFAULT 1;
ALTER TABLE trazabilidad_tarea ADD CONSTRAINT traz_estado_tarea_fk FOREIGN KEY (id_estado_tarea) REFERENCES estado_tarea(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

