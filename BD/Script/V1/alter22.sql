ALTER TABLE permiso RENAME TO tareas;
ALTER TABLE tareas RENAME TO tarea;
ALTER TABLE equipos_afectados_permiso DROP CONSTRAINT euipos_afec_equipo_fk;
ALTER TABLE equipos_afectados_permiso DROP CONSTRAINT euipos_afec_permiso_fk;
DROP TABLE equipos_afectados_permiso;
ALTER TABLE tarea ADD id_equipo int4;
ALTER TABLE tarea ADD id_area int4;
ALTER TABLE tarea ADD CONSTRAINT area_tarea_fk FOREIGN KEY (id_area) REFERENCES areas_trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE tarea ADD CONSTRAINT equipo_tarea FOREIGN KEY (id_equipo) REFERENCES equipo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
