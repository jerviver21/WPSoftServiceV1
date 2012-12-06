ALTER TABLE empleado DROP CONSTRAINT usuario_empleado_fk;
ALTER TABLE empleado DROP COLUMN id_usuario;
ALTER TABLE contratista DROP CONSTRAINT contratista_user_fk;
ALTER TABLE contratista DROP COLUMN id_user;
ALTER TABLE empleado ADD usuario varchar(500);
ALTER TABLE contratista ADD usuario varchar(300);
CREATE UNIQUE INDEX empleado_ui2 ON empleado (usuario);
CREATE UNIQUE INDEX contratista_ui3 ON contratista (usuario);
