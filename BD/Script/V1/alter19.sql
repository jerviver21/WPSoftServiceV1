ALTER TABLE permiso ADD usuario_ejecutante varchar(600);
ALTER TABLE permiso ADD id_estado_trabajo int4;
ALTER TABLE permiso RENAME COLUMN FK_disciplinas_id TO id_disciplina;
ALTER TABLE permiso ADD id_equipo int4;
ALTER TABLE permiso ADD tarea text;
ALTER TABLE permiso RENAME COLUMN FK_trabajo_id TO id_trabajo;
ALTER TABLE permiso ADD fecha_hora_fin timestamp;
ALTER TABLE permiso ADD fecha_hora_inicio timestamp;
ALTER TABLE permiso ADD id_area_trabajo int4;
ALTER TABLE permiso DROP COLUMN id_equipo;
ALTER TABLE permiso DROP COLUMN id_area_trabajo;
ALTER TABLE trabajo DROP CONSTRAINT trabajo_area_fk;
ALTER TABLE trabajo DROP COLUMN id_areas_trabajo;
ALTER TABLE trabajo DROP CONSTRAINT trabajo_estado_fk;
ALTER TABLE trabajo DROP COLUMN id_estado_trabajo;
ALTER TABLE trabajo DROP CONSTRAINT equipo_trabajo_fk;
ALTER TABLE trabajo DROP COLUMN id_equipos;
ALTER TABLE trabajo DROP CONSTRAINT trabajo_solicitante_fk;
ALTER TABLE trabajo DROP COLUMN id_solicitante;
ALTER TABLE trabajo DROP CONSTRAINT trabajo_ejecutante_fk;
ALTER TABLE trabajo DROP COLUMN id_ejecutante;
ALTER TABLE trabajo DROP COLUMN fecha_hora_fin;
ALTER TABLE trabajo DROP COLUMN fecha_hora_inicio;
ALTER TABLE trabajo DROP COLUMN tarea;
ALTER TABLE trazabilidad_trabajo DROP CONSTRAINT trabajo_traz_trab_fk;
ALTER TABLE trazabilidad_trabajo RENAME COLUMN id_trabajo TO id_permiso;
ALTER TABLE trazabilidad_trabajo ADD CONSTRAINT trazabilidad_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trazabilidad_trabajo RENAME TO trazabilidad_permiso;
ALTER TABLE trabajo ADD fecha_hora timestamp;
ALTER TABLE trabajo ADD usuario varchar(600);
ALTER TABLE permiso ADD usuario varchar(600);
ALTER TABLE permiso ADD fecha_hora timestamp;
CREATE TABLE equipos_afectados (
	id bigserial,
	id_equipo int4,
	id_permiso bigint
);
ALTER TABLE equipos_afectados ADD CONSTRAINT equipos_afectados PRIMARY KEY(id);
ALTER TABLE equipos_afectados ADD CONSTRAINT euipos_afec_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE equipos_afectados ADD CONSTRAINT euipos_afec_equipo_fk FOREIGN KEY (id_equipo) REFERENCES equipo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
