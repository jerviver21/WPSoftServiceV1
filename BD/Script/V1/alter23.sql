ALTER TABLE estado_trabajo RENAME TO estado_tarea;
ALTER TABLE tarea RENAME COLUMN id_estado_trabajo TO id_estado_tarea;
ALTER TABLE tarea ADD CONSTRAINT estado_tarea_fk FOREIGN KEY (id_estado_tarea) REFERENCES estado_tarea(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trazabilidad_permiso DROP CONSTRAINT usuario_traz_trab_fk;
ALTER TABLE trazabilidad_permiso DROP COLUMN id_usuario;
ALTER TABLE trazabilidad_permiso ADD usuario varchar(600);
ALTER TABLE trazabilidad_permiso ADD etapa varchar(600);
ALTER TABLE trazabilidad_permiso RENAME COLUMN id_permiso TO id_tarea;
ALTER TABLE trazabilidad_permiso RENAME TO trazabilidad_tarea;
ALTER TABLE autoridad DROP CONSTRAINT autoridad_usuario_fk;
ALTER TABLE areas_trabajo RENAME COLUMN id_autoridades TO id_autoridad;
ALTER TABLE autoridad RENAME COLUMN id_tipos_autoridades TO id_tipos_autoridad;
ALTER TABLE autoridad DROP COLUMN id_usuario;
ALTER TABLE autoridad ADD usuario varchar(600);


INSERT INTO tipo_autoridad VALUES (1,'MASTER');
INSERT INTO autoridad (id_tipo_autoridad, usuario) VALUES (1, 'admin');
INSERT INTO areas_trabajo (nombre, descripcion, id_autoridad) VALUES ('LOBBY', 'PRUEBA', 1);
INSERT INTO equipo (nombre, descripcion, id_area) VALUES ('YUNQUE', 'PRUEBA', 1);
INSERT INTO estado_trazabilidad VALUES (1, 'ASIGNADO');
INSERT INTO estado_trazabilidad VALUES (2, 'EJECUTADO');

INSERT INTO estado_tarea VALUES (0, 'VENCIDO');
INSERT INTO estado_tarea VALUES (1, 'ASIGNADO');
INSERT INTO estado_tarea VALUES (2, 'APROBADO JEFE');
INSERT INTO estado_tarea VALUES (3, 'APROBADO CALIDAD');
INSERT INTO estado_tarea VALUES (4, 'APROBADO INGENIERIA');
INSERT INTO estado_tarea VALUES (5, 'NO APROBADO JEFE');
INSERT INTO estado_tarea VALUES (6, 'NO APROBADO CALIDAD');
INSERT INTO estado_tarea VALUES (7, 'NO APROBADO INGENIERIA');
INSERT INTO estado_tarea VALUES (8, 'TRABAJO TERMINADO');
INSERT INTO estado_tarea VALUES (9, 'CANCELADO AUTORIDAD EJECUTANTE');
INSERT INTO estado_tarea VALUES (10, 'CANCELADO AUTORIDAD DE AREA');
INSERT INTO estado_tarea VALUES (11, 'CANCELADO CALIDAD');
INSERT INTO estado_tarea VALUES (12, 'CANCELADO INGENIERIA');
INSERT INTO estado_tarea VALUES (13, 'CANCELADO');

