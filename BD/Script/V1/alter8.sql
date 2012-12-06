DELETE FROM empleados;
DELETE FROM contratistas;
ALTER TABLE contratistas ADD mail varchar(500) NOT NULL;
ALTER TABLE contratistas ADD nombre_contacto varchar(500) NOT NULL;
ALTER TABLE contratistas ADD arp varchar(500) NOT NULL;
ALTER TABLE contratistas ADD telefono varchar(15) NOT NULL;
ALTER TABLE contratistas ALTER num_id TYPE bigint;
ALTER TABLE contratistas ADD nivel_riesgo varchar(500);
ALTER TABLE contratistas ADD user_id bigint;
ALTER TABLE contratistas ADD objeto_social varchar(1000);
ALTER TABLE contratistas ADD domicilio varchar(500);
ALTER TABLE contratistas ADD CONSTRAINT contratista_user_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE empleados RENAME COLUMN FK_contratistas_id TO contratistas_id;
ALTER TABLE empleados RENAME COLUMN FK_usuario_id TO usuario_id;
ALTER TABLE contratistas_proyecto RENAME COLUMN FK_proyecto_id TO proyecto_id;
ALTER TABLE contratistas_proyecto RENAME COLUMN FK_contratistas_id TO contratistas_id;
ALTER TABLE empleados RENAME COLUMN contratistas_id TO id_contratistas;
ALTER TABLE empleados RENAME COLUMN usuario_id TO id_usuario;
ALTER TABLE contratistas RENAME COLUMN user_id TO id_user;
ALTER TABLE contratistas_proyecto RENAME COLUMN proyecto_id TO id_proyecto;
ALTER TABLE contratistas_proyecto RENAME COLUMN contratistas_id TO id_contratistas;
ALTER TABLE user_group RENAME COLUMN FK_group_id TO id_group;
ALTER TABLE user_group RENAME COLUMN FK_user_id TO id_user;
ALTER TABLE rol_resource RENAME COLUMN FK_rol_id TO id_rol;
ALTER TABLE rol_resource RENAME COLUMN FK_resource_id TO id_resource;
ALTER TABLE group_rol RENAME COLUMN FK_group_id TO id_group;
ALTER TABLE group_rol RENAME COLUMN FK_rol_id TO id_rol;
ALTER TABLE empleados ADD telefono varchar(15);
ALTER TABLE empleados ADD fecha_induccion date;
ALTER TABLE empleados ADD tipo_sangre varchar(5);
ALTER TABLE empleados ADD eps varchar(255);
ALTER TABLE empleados ADD observaciones text;
ALTER TABLE empleados ADD betado boolean NOT NULL DEFAULT false;
CREATE TABLE certificados_emp (
	id serial NOT NULL,
	nombre varchar(500) NOT NULL,
	ruta varchar(1000) NOT NULL,
	id_tipo int4 NOT NULL
);
ALTER TABLE certificados_emp ADD CONSTRAINT certificados_emp_pk PRIMARY KEY(id);
ALTER TABLE certificados_emp ADD id_empleado bigint;
CREATE TABLE tipo_certificados_emp (
	id int4 NOT NULL,
	nombre varchar(500) NOT NULL
);
ALTER TABLE tipo_certificados_emp ADD CONSTRAINT tipo_certificados_emp_pk PRIMARY KEY(id);
ALTER TABLE certificados_emp ADD CONSTRAINT empleado_certificacion_fk FOREIGN KEY (id_empleado) REFERENCES empleados(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE certificados_emp ADD CONSTRAINT certificado_tipo_fk FOREIGN KEY (id_tipo) REFERENCES tipo_certificados_emp(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE TABLE empleados_proyecto (
	id bigint NOT NULL,
	id_proyecto bigint NOT NULL,
	id_empleado bigint NOT NULL
);
ALTER TABLE empleados_proyecto ADD CONSTRAINT empleados_proyecto_pk PRIMARY KEY(id);
ALTER TABLE empleados_proyecto ADD CONSTRAINT emp_proy_emp_fk FOREIGN KEY (id_empleado) REFERENCES empleados(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE empleados_proyecto ADD CONSTRAINT proy_emp_proy_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE contratistas_proyecto RENAME COLUMN id_contratistas TO id_contratista;
ALTER TABLE empleados RENAME COLUMN id_contratistas TO id_contratista;
ALTER TABLE empleados ADD restricciones_medicas boolean NOT NULL DEFAULT false;
ALTER TABLE empleados ADD trabajo_alturas boolean NOT NULL DEFAULT false;
