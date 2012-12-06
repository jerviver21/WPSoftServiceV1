ALTER TABLE trazabilidad_permiso DROP CONSTRAINT traz_estado_tarea_fk;
ALTER TABLE trazabilidad_permiso DROP COLUMN id_estado_permiso;
CREATE TABLE operaciones_permiso (
	id int4 NOT NULL,
	descripcion varchar(255) NOT NULL
);
ALTER TABLE operaciones_permiso ADD CONSTRAINT operaciones_permiso_pk PRIMARY KEY(id);
ALTER TABLE trazabilidad_permiso ADD id_operacion int4 NOT NULL;
ALTER TABLE trazabilidad_permiso ADD nota text;
ALTER TABLE trazabilidad_permiso ADD CONSTRAINT opr_traza_fk FOREIGN KEY (id_operacion) REFERENCES operaciones_permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE operaciones_permiso RENAME TO operacion_permiso;
ALTER TABLE trazabilidad_permiso ADD usuario varchar(500);
ALTER TABLE trazabilidad_permiso RENAME COLUMN usuario_o_grupo TO usr_grp_asignado;
ALTER TABLE trazabilidad_permiso DROP COLUMN razon_no_aprobacion;
CREATE UNIQUE INDEX tarea_ui1 ON tarea (id_permiso,consecutivo);
