DELETE FROM riesgos_tarea ;
DELETE FROM areas_afectadas ;
DELETE FROM trazabilidad_tarea ;
ALTER TABLE tarea ADD id_proyecto bigint;
ALTER TABLE tarea ADD num_trabajo_correctivo bigint;
ALTER TABLE tarea ADD num_orden bigint;
ALTER TABLE tarea DROP CONSTRAINT permiso_trabajo_fk;
ALTER TABLE trabajo DROP CONSTRAINT proyecto_trabajo_fk;
DROP TABLE trabajo;
ALTER TABLE tarea ADD FK_proyecto_id bigserial NOT NULL;
ALTER TABLE tarea ADD CONSTRAINT proyecto_permiso_fk FOREIGN KEY (FK_proyecto_id) REFERENCES proyecto(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE tarea DROP CONSTRAINT proyecto_permiso_fk;
ALTER TABLE tarea DROP COLUMN FK_proyecto_id;
ALTER TABLE tarea ADD CONSTRAINT permiso_proyecto_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE tarea RENAME TO permiso_trabajo;
ALTER TABLE controles_tarea DROP CONSTRAINT permiso_cont_trab_fk;
ALTER TABLE controles_tarea DROP COLUMN id_permiso;
ALTER TABLE controles_tarea DROP CONSTRAINT cont_tarea_cont_fk;
DROP TABLE controles_tarea;
ALTER TABLE riesgo RENAME TO peligro;
ALTER TABLE riesgos_tarea RENAME TO peligros_tarea;
ALTER TABLE control RENAME COLUMN id_riesgo TO id_peligro;
ALTER TABLE peligros_tarea RENAME COLUMN id_permiso TO id_peligro;
ALTER TABLE peligro DROP COLUMN codigo;
ALTER TABLE peligro DROP COLUMN activo;
ALTER TABLE peligro RENAME COLUMN descripcion TO nombre;
ALTER TABLE control DROP COLUMN activo;
ALTER TABLE control RENAME COLUMN descripcion TO nombre;
ALTER TABLE control ALTER id TYPE serial;
ALTER TABLE control RENAME COLUMN codigo TO consecutivo;
ALTER TABLE peligros_tarea RENAME TO peligros_permiso;
CREATE TABLE riesgos_peligro_permiso (
	id bigserial NOT NULL,
	consecutivo int4,
	nombre text,
	id_peligro_permiso bigint
);
ALTER TABLE riesgos_peligro_permiso ADD CONSTRAINT riesgos_peligro_permiso_pk PRIMARY KEY(id);
ALTER TABLE riesgos_peligro_permiso ADD CONSTRAINT pel_per_riesgos_fk FOREIGN KEY (id_peligro_permiso) REFERENCES riesgos_peligro_permiso(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE riesgos_peligro_permiso DROP CONSTRAINT pel_per_riesgos_fk;
ALTER TABLE riesgos_peligro_permiso ADD CONSTRAINT riesgos_permiso_trabajo_fk FOREIGN KEY (id_peligro_permiso) REFERENCES peligros_permiso(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE autoridad DROP CONSTRAINT tipo_autoridad_fk;
DROP TABLE tipo_autoridad CASCADE;
ALTER TABLE precauciones_trabajo DROP CONSTRAINT autoridad_prec_trab_fk;
ALTER TABLE certificados_trabajo DROP CONSTRAINT autoridad_cert_trab;
ALTER TABLE areas_trabajo DROP CONSTRAINT autoridad_area_fk;
DROP TABLE autoridad;
ALTER TABLE certificados_trabajo DROP COLUMN id_autoridad;
ALTER TABLE precauciones_trabajo DROP COLUMN id_autoridad;
ALTER TABLE equipo RENAME COLUMN id_area TO id_sector;
ALTER TABLE equipo DROP COLUMN descripcion;
ALTER TABLE equipo ALTER nombre TYPE varchar(500);
ALTER TABLE areas_trabajo RENAME TO sector;
ALTER TABLE sector DROP COLUMN descripcion;
ALTER TABLE sector ALTER nombre TYPE varchar(500);
ALTER TABLE sector RENAME COLUMN id_autoridad TO rol;
ALTER TABLE areas_afectadas_permiso RENAME TO sectores_afectados_permiso;
ALTER TABLE sectores_afectados_permiso RENAME COLUMN id_areas_trabajo TO id_sector;
ALTER TABLE estado_tarea RENAME TO estado_permiso;
ALTER TABLE permiso_trabajo RENAME COLUMN id_estado_tarea TO id_estado_permiso;
ALTER TABLE trazabilidad_tarea RENAME COLUMN id_tarea TO id_permiso;
ALTER TABLE trazabilidad_tarea RENAME COLUMN id_estado_tarea TO id_estado_permiso;
ALTER TABLE trazabilidad_tarea RENAME TO trazabilidad_permiso;
ALTER TABLE sector ALTER rol TYPE varchar(500);
ALTER TABLE peligros_permiso RENAME COLUMN id_peligro TO id_permiso;
ALTER TABLE peligros_permiso RENAME COLUMN id_riesgo TO id_peligro;
ALTER TABLE permiso_trabajo DROP COLUMN nombre;
ALTER TABLE permiso_trabajo DROP COLUMN id_trabajo;
ALTER TABLE permiso_trabajo RENAME COLUMN usuario TO usuario_creacion;
ALTER TABLE permiso_trabajo RENAME COLUMN fecha_hora TO fecha_hora_creacion;
ALTER TABLE permiso_trabajo RENAME COLUMN id_area TO id_sector;
ALTER TABLE permiso_trabajo DROP COLUMN fecha_hora_fin;
ALTER TABLE permiso_trabajo DROP COLUMN fecha_hora_inicio;
ALTER TABLE permiso_trabajo ADD hora_ini time;
ALTER TABLE permiso_trabajo ADD fecha_fin date;
ALTER TABLE permiso_trabajo ADD hora_fin time;
ALTER TABLE permiso_trabajo ADD fecha_ini date;
ALTER TABLE permiso_trabajo RENAME COLUMN usuario_ejecutante TO usuarios_ejecutante;
ALTER TABLE trazabilidad_permiso RENAME COLUMN usuario TO usuario_o_rol;
ALTER TABLE trazabilidad_permiso RENAME COLUMN usuario_o_rol TO usuario_o_grupo;
ALTER TABLE permiso_trabajo ADD ejecutorContratista boolean;
ALTER TABLE permiso_trabajo RENAME COLUMN ejecutorContratista TO ejecutor_contratista;