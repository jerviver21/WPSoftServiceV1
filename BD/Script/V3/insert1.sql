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

