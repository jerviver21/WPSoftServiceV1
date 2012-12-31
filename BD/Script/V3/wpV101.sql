ALTER TABLE tarea DROP CONSTRAINT permiso_trab_tarea_fk;
ALTER TABLE tarea ADD CONSTRAINT permiso_trab_tarea_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE peligros_tarea DROP CONSTRAINT peligros_tarea_fk;
ALTER TABLE peligros_tarea ADD CONSTRAINT peligros_tarea_fk FOREIGN KEY (id_tarea) REFERENCES tarea(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE control DROP CONSTRAINT control_riesgo_fk;
ALTER TABLE control ADD CONSTRAINT control_riesgo_fk FOREIGN KEY (id_peligro) REFERENCES peligro(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE precauciones_trabajo DROP CONSTRAINT permiso_prec_trab_fk;
ALTER TABLE precauciones_trabajo ADD CONSTRAINT permiso_prec_trab_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE certificados_trabajo DROP CONSTRAINT permiso_cert_trab_fk;
ALTER TABLE certificados_trabajo ADD CONSTRAINT permiso_cert_trab_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sectores_afectados_permiso DROP CONSTRAINT areas_afectadas_permiso_fk;
ALTER TABLE sectores_afectados_permiso ADD CONSTRAINT areas_afectadas_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trazabilidad_permiso DROP CONSTRAINT trazabilidad_permiso_fk;
ALTER TABLE trazabilidad_permiso ADD CONSTRAINT trazabilidad_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE proyecto ADD usuario_creacion varchar(300) NOT NULL;
ALTER TABLE proyecto ADD fecha_hora_creacion timestamp NOT NULL DEFAULT now();
ALTER TABLE contratistas_proyecto DROP CONSTRAINT contra_proy_contra;
ALTER TABLE contratistas_proyecto DROP COLUMN id_contratista;
ALTER TABLE contratistas_proyecto DROP CONSTRAINT contra_proy_proy_fk;
ALTER TABLE contratistas_proyecto DROP COLUMN id_proyecto;
DROP TABLE contratistas_proyecto;
ALTER TABLE empleados_proyecto DROP CONSTRAINT proy_emp_proy_fk;
ALTER TABLE empleados_proyecto DROP COLUMN id_proyecto;
ALTER TABLE empleados_proyecto DROP CONSTRAINT emp_proy_emp_fk;
ALTER TABLE empleados_proyecto DROP COLUMN id_empleado;
DROP TABLE empleados_proyecto;
ALTER TABLE permiso_trabajo DROP COLUMN hora_ini;
ALTER TABLE permiso_trabajo DROP COLUMN fecha_fin;
ALTER TABLE permiso_trabajo DROP COLUMN hora_fin;
ALTER TABLE permiso_trabajo DROP COLUMN fecha_ini;
ALTER TABLE permiso_trabajo ADD fecha_hora_fin timestamp;
ALTER TABLE permiso_trabajo ADD fecha_hora_ini timestamp;
ALTER TABLE permiso_trabajo ADD id_estado_anterior int4;
ALTER TABLE permiso_trabajo ADD CONSTRAINT estado_anterior_fk FOREIGN KEY (id_estado_anterior) REFERENCES estado_permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE TABLE controles_peligro_tarea (
	id bigserial NOT NULL,
	id_peligro_tarea bigint NOT NULL,
	control text NOT NULL
);
ALTER TABLE controles_peligro_tarea ADD CONSTRAINT controles_peligro_tarea_pk PRIMARY KEY(id);
ALTER TABLE controles_peligro_tarea ADD CONSTRAINT cont_peligro_tarea_fk FOREIGN KEY (id_peligro_tarea) REFERENCES peligros_tarea(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE permiso_trabajo ADD consideraciones text;
INSERT INTO parametro (nombre, valor, tipo) VALUES ('aprueba_defecto','grupoCalidad,grupoSeguridad,SECTOR','Gestion');
INSERT INTO parametro (nombre, valor, tipo) VALUES ('cancela_defecto','grupoCalidad,grupoSeguridad,SECTOR','Gestion');
DELETE FROM permiso_trabajo WHERE id_estado_permiso > 2;
DELETE FROM estado_permiso where id > 2;
INSERT INTO estado_permiso VALUES (0, 'VENCIDO ');
INSERT INTO estado_permiso VALUES (1, 'CREADO ');
INSERT INTO estado_permiso VALUES (2, 'DILIGENCIADO ');
INSERT INTO estado_permiso VALUES (3, 'PREAPROBADO ');
INSERT INTO estado_permiso VALUES (4, 'NO_APROBADO');
INSERT INTO estado_permiso VALUES (5, 'APROBADO ');
INSERT INTO estado_permiso VALUES (6, 'TERMINADO ');
INSERT INTO estado_permiso VALUES (7, 'SUSPENDIDO ');
INSERT INTO estado_permiso VALUES (8, 'PRECANCELADO ');
INSERT INTO estado_permiso VALUES (9, 'APROBADA_CANCELACION ');
INSERT INTO estado_permiso VALUES (10, 'CANCELADO ');