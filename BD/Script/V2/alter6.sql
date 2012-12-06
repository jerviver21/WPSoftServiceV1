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

DELETE FROM trazabilidad_permiso ;
DELETE FROM peligros_tarea;
DELETE FROM tarea;
DELETE FROM permiso_trabajo;
delete from estado_permiso;
delete from estado_trazabilidad where descripcion = 'BLOQUEADO';

INSERT INTO estado_permiso VALUES (0, 'VENCIDO');
INSERT INTO estado_permiso VALUES (1, 'CREADO');
INSERT INTO estado_permiso VALUES (2, 'DILIGENCIADO');
INSERT INTO estado_permiso VALUES (3, 'APROBADO CALIDAD');
INSERT INTO estado_permiso VALUES (4, 'APROBADO SEGURIDAD');
INSERT INTO estado_permiso VALUES (5, 'APROBADO JEFE');
INSERT INTO estado_permiso VALUES (6, 'NO APROBADO CALIDAD');
INSERT INTO estado_permiso VALUES (7, 'NO APROBADO SEGURIDAD');
INSERT INTO estado_permiso VALUES (8, 'NO APROBADO JEFE');
INSERT INTO estado_permiso VALUES (9, 'TERMINADO');
INSERT INTO estado_permiso VALUES (10, 'SUSPENDIDO');
INSERT INTO estado_permiso VALUES (11, 'CANCELADO CALIDAD');
INSERT INTO estado_permiso VALUES (12, 'CANCELADO SEGURIDAD');
INSERT INTO estado_permiso VALUES (13, 'CANCELADO JEFE');
INSERT INTO estado_permiso VALUES (14, 'CANCELADO');
INSERT INTO estado_permiso VALUES (15, 'APROBADO');
INSERT INTO estado_permiso VALUES (16, 'APROBADA_CANCELACION');

INSERT INTO operacion_permiso VALUES (0, 'CREAR');
INSERT INTO operacion_permiso VALUES (1, 'DILIGENCIAR');
INSERT INTO operacion_permiso VALUES (2, 'APROBAR');
INSERT INTO operacion_permiso VALUES (3, 'TERMINAR');
INSERT INTO operacion_permiso VALUES (4, 'CANCELAR');
INSERT INTO operacion_permiso VALUES (5, 'SUSPENDER');
INSERT INTO operacion_permiso VALUES (6, 'NO APROBAR');

ALTER TABLE trazabilidad_permiso ADD usuario varchar(500);
ALTER TABLE trazabilidad_permiso RENAME COLUMN usuario_o_grupo TO usr_grp_asignado;
ALTER TABLE trazabilidad_permiso DROP COLUMN razon_no_aprobacion;
CREATE UNIQUE INDEX tarea_ui1 ON tarea (id_permiso,consecutivo);


