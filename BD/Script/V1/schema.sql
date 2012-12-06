CREATE TABLE users (
	id bigserial NOT NULL,
	usr varchar(300) NOT NULL,
	pwd varchar(250) NOT NULL,
	estado int4 NOT NULL DEFAULT 1
);
CREATE UNIQUE INDEX usuario_ui1 ON users (usr);
ALTER TABLE users ADD CONSTRAINT usuario_pk PRIMARY KEY(id);
CREATE TABLE rol (
	id bigserial NOT NULL,
	codigo varchar(100) NOT NULL,
	descripcion varchar(300) NOT NULL
);
ALTER TABLE rol ADD CONSTRAINT perfil_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX perfil_ui1 ON rol (codigo);
CREATE TABLE groups (
	id bigserial NOT NULL,
	codigo varchar(100) NOT NULL,
	descripcion varchar(300)
);
ALTER TABLE groups ADD CONSTRAINT rol_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX rol_ui1 ON groups (codigo);
CREATE TABLE resource (
	id bigserial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(300),
	id_menu bigint NOT NULL,
	url varchar(500) NOT NULL
);
ALTER TABLE resource ADD CONSTRAINT recurso_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX recurso_ui1 ON resource (nombre,id_menu);
CREATE TABLE menu (
	id bigserial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(300) NOT NULL,
	id_menu bigint
);
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX menu_ui1 ON menu (nombre);
CREATE TABLE rol_resource (
	id bigserial NOT NULL,
	FK_resource_id bigint NOT NULL,
	FK_rol_id bigint
);
ALTER TABLE rol_resource ADD CONSTRAINT perfil_recurso_pk PRIMARY KEY(id);
CREATE TABLE parametros (
	id bigserial NOT NULL,
	nombre varchar(50) NOT NULL,
	valor text NOT NULL,
	tipo varchar(20)
);
ALTER TABLE parametros ADD CONSTRAINT parametros_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX parametros_ui1 ON parametros (nombre,tipo);
CREATE TABLE estado_trabajo (
	id int4 NOT NULL,
	descripcion varchar(100) NOT NULL
);
ALTER TABLE estado_trabajo ADD CONSTRAINT estado_trabajo_pk PRIMARY KEY(id);
CREATE TABLE trabajo (
	id bigserial NOT NULL,
	fecha_hora_inicio timestamp,
	fecha_hora_fin timestamp,
	tarea text,
	num_orden_trabajo int8 NOT NULL DEFAULT 0,
	num_trab_correctivo bigint,
	FK_proyecto_id bigint NOT NULL,
	FK_areas_trabajo_id int4 NOT NULL,
	FK_equipos_id int4 NOT NULL,
	FK_solicitante_id bigint,
	FK_ejecutante_id bigint,
	FK_estado_trabajo_id int4 NOT NULL
);
ALTER TABLE trabajo ADD CONSTRAINT trabajo_pk PRIMARY KEY(id);
CREATE TABLE trazabilidad_trabajo (
	id bigserial NOT NULL,
	fecha_hora timestamp NOT NULL DEFAULT now(),
	FK_usuario_id bigint NOT NULL,
	FK_estado_trazabilidad_id int4 NOT NULL,
	FK_trabajo_id bigint NOT NULL,
	razon_no_aprobacion text
);
ALTER TABLE trazabilidad_trabajo ADD CONSTRAINT trazabilidad_trabajo_pk PRIMARY KEY(id);
CREATE TABLE estado_trazabilidad (
	id int4 NOT NULL,
	descripcion varchar(250) NOT NULL
);
ALTER TABLE estado_trazabilidad ADD CONSTRAINT estado_trazabilidad_pk PRIMARY KEY(id);
CREATE TABLE formularios (
	id serial NOT NULL,
	nombre varchar(250) NOT NULL,
	descripcion text NOT NULL
);
ALTER TABLE formularios ADD CONSTRAINT formularios_pk PRIMARY KEY(id);
CREATE TABLE campos_formulario (
	id serial NOT NULL,
	id_formulario int4 NOT NULL
);
ALTER TABLE campos_formulario ADD CONSTRAINT campos_formulario_pk PRIMARY KEY(id);
CREATE TABLE validaciones_formulario (
	id serial NOT NULL,
	id_campo_formulario int4 NOT NULL
);
ALTER TABLE validaciones_formulario ADD CONSTRAINT validaciones_formulario_pk PRIMARY KEY(id);
CREATE TABLE precauciones_trabajo (
	id serial NOT NULL,
	otros_cual varchar(1000),
	FK_permiso_id bigint NOT NULL,
	FK_precaucion_id int4 NOT NULL,
	FK_autoridades_id int4 NOT NULL
);
ALTER TABLE precauciones_trabajo ADD CONSTRAINT precauciones_permiso_pk PRIMARY KEY(id);
CREATE TABLE equipos (
	id serial NOT NULL,
	nombre varchar(255) NOT NULL,
	descripcion text NOT NULL,
	id_area int4
);
ALTER TABLE equipos ADD CONSTRAINT equipos_pk PRIMARY KEY(id);
CREATE TABLE areas_trabajo (
	id serial NOT NULL,
	nombre varchar(255) NOT NULL,
	descripcion text NOT NULL,
	FK_autoridades_id int4 NOT NULL
);
ALTER TABLE areas_trabajo ADD CONSTRAINT areas_trabajo_pk PRIMARY KEY(id);
CREATE TABLE disciplinas (
	id serial NOT NULL,
	nombre varchar(250) NOT NULL,
	descripcion text
);
ALTER TABLE disciplinas ADD CONSTRAINT disciplinas_pk PRIMARY KEY(id);
CREATE TABLE riesgos_trabajo (
	id bigserial NOT NULL,
	FK_riesgo_id int4 NOT NULL,
	FK_permiso_id bigint NOT NULL
);
ALTER TABLE riesgos_trabajo ADD CONSTRAINT riesgos_trabajo_pk PRIMARY KEY(id);
CREATE TABLE riesgo (
	id int4 NOT NULL,
	descripcion varchar(1500) NOT NULL,
	activo boolean NOT NULL,
	codigo varchar(50)
);
ALTER TABLE riesgo ADD CONSTRAINT riesgo_pk PRIMARY KEY(id);
CREATE TABLE precaucion (
	id int4 NOT NULL,
	descripcion varchar(1500) NOT NULL,
	activo boolean NOT NULL
);
ALTER TABLE precaucion ADD CONSTRAINT precaucion_pk PRIMARY KEY(id);
CREATE TABLE proyecto (
	id bigserial NOT NULL,
	num_cuenta_cargada bigint NOT NULL,
	contratista_evento boolean NOT NULL DEFAULT true,
	nombre varchar(1000) NOT NULL,
	num_gestion_cambio bigint NOT NULL
);
ALTER TABLE proyecto ADD CONSTRAINT proyecto_pk PRIMARY KEY(id);
CREATE TABLE contratistas_proyecto (
	id bigserial NOT NULL,
	FK_proyecto_id bigint NOT NULL,
	FK_contratistas_id bigint
);
ALTER TABLE contratistas_proyecto ADD CONSTRAINT contratistas_proyecto_pk PRIMARY KEY(id);
CREATE TABLE tipos_autoridades (
	id int4 NOT NULL,
	nombre varchar(250) NOT NULL
);
ALTER TABLE tipos_autoridades ADD CONSTRAINT tipos_autoridades_pk PRIMARY KEY(id);
CREATE TABLE campos_validaciones (
	id serial,
	id_campo int4,
	id_validacion int4
);
ALTER TABLE campos_validaciones ADD CONSTRAINT campos_validaciones_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX campos_validaciones_ui1 ON campos_validaciones (id_campo,id_validacion);
CREATE TABLE contratistas (
	id bigserial,
	num_id bigint,
	nombre varchar(500) NOT NULL
);
ALTER TABLE contratistas ADD CONSTRAINT contratistas_pk PRIMARY KEY(id);
CREATE TABLE empleados (
	id bigserial NOT NULL,
	num_id bigint NOT NULL,
	nombres_apellidos varchar(500) NOT NULL,
	foto varchar(1000),
	FK_usuario_id bigint NOT NULL,
	FK_contratistas_id bigint
);
ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX empleados_ui1 ON empleados (num_id);
CREATE TABLE permiso (
	id bigserial NOT NULL,
	FK_disciplinas_id int4,
	otra_disciplina varchar(1000),
	FK_trabajo_id bigint NOT NULL
);
ALTER TABLE permiso ADD CONSTRAINT permiso_pk PRIMARY KEY(id);
CREATE TABLE autoridades (
	id serial NOT NULL,
	FK_usuario_id bigint NOT NULL,
	FK_tipos_autoridades_id int4 NOT NULL
);
ALTER TABLE autoridades ADD CONSTRAINT autoridades_pk PRIMARY KEY(id);
CREATE TABLE areas_afectadas_permiso (
	id bigserial NOT NULL,
	FK_areas_trabajo_id int4 NOT NULL,
	FK_permiso_id bigint NOT NULL
);
ALTER TABLE areas_afectadas_permiso ADD CONSTRAINT areas_afectadas_permiso_pk PRIMARY KEY(id);
CREATE TABLE certificados (
	id int4 NOT NULL,
	descripcion varchar(1500),
	ruta_check_list varchar(1500),
	activo boolean
);
ALTER TABLE certificados ADD CONSTRAINT certificados_pk PRIMARY KEY(id);
CREATE TABLE certificados_trabajo (
	id bigserial NOT NULL,
	FK_permiso_id bigint NOT NULL,
	FK_certificados_id int4 NOT NULL,
	FK_autoridades_id int4 NOT NULL
);
ALTER TABLE certificados_trabajo ADD CONSTRAINT certificados_trabajo_pk PRIMARY KEY(id);
CREATE TABLE control (
	id int4 NOT NULL,
	codigo varchar(50),
	descripcion text,
	activo boolean,
	FK_riesgo_id int4 NOT NULL
);
ALTER TABLE control ADD CONSTRAINT control_pk PRIMARY KEY(id);
CREATE TABLE controles_trabajo (
	id bigserial NOT NULL,
	FK_control_id int4 NOT NULL,
	FK_permiso_id bigint NOT NULL
);
ALTER TABLE controles_trabajo ADD CONSTRAINT controles_trabajo_fk PRIMARY KEY(id);
CREATE TABLE user_group (
	id serial NOT NULL,
	FK_user_id bigint NOT NULL,
	FK_group_id bigint NOT NULL
);
ALTER TABLE user_group ADD CONSTRAINT user_group_pk PRIMARY KEY(id);
CREATE TABLE group_rol (
	id serial,
	FK_rol_id bigint NOT NULL,
	FK_group_id bigint NOT NULL
);
ALTER TABLE group_rol ADD CONSTRAINT group_rol_pk PRIMARY KEY(id);
ALTER TABLE resource ADD CONSTRAINT recurso_menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE menu ADD CONSTRAINT menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE empleados ADD CONSTRAINT usuario_empleado_fk FOREIGN KEY (FK_usuario_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE empleados ADD CONSTRAINT empleado_contratista_fk FOREIGN KEY (FK_contratistas_id) REFERENCES contratistas(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE contratistas_proyecto ADD CONSTRAINT contra_proy_proy_fk FOREIGN KEY (FK_proyecto_id) REFERENCES proyecto(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE contratistas_proyecto ADD CONSTRAINT contra_proy_contra FOREIGN KEY (FK_contratistas_id) REFERENCES contratistas(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trabajo ADD CONSTRAINT trabajo_proyecto FOREIGN KEY (FK_proyecto_id) REFERENCES proyecto(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trabajo ADD CONSTRAINT trabajo_area_fk FOREIGN KEY (FK_areas_trabajo_id) REFERENCES areas_trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trabajo ADD CONSTRAINT equipo_trabajo_fk FOREIGN KEY (FK_equipos_id) REFERENCES equipos(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trabajo ADD CONSTRAINT trabajo_solicitante_fk FOREIGN KEY (FK_solicitante_id) REFERENCES empleados(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trabajo ADD CONSTRAINT trabajo_ejecutante_fk FOREIGN KEY (FK_ejecutante_id) REFERENCES empleados(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trabajo ADD CONSTRAINT trabajo_estado_fk FOREIGN KEY (FK_estado_trabajo_id) REFERENCES estado_trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trazabilidad_trabajo ADD CONSTRAINT usuario_traz_trab_fk FOREIGN KEY (FK_usuario_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trazabilidad_trabajo ADD CONSTRAINT estado_traz_trab_fk FOREIGN KEY (FK_estado_trazabilidad_id) REFERENCES estado_trazabilidad(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE trazabilidad_trabajo ADD CONSTRAINT trabajo_traz_trab_fk FOREIGN KEY (FK_trabajo_id) REFERENCES trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE autoridades ADD CONSTRAINT autoridad_usuario_fk FOREIGN KEY (FK_usuario_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE autoridades ADD CONSTRAINT autoridad_tipo_fk FOREIGN KEY (FK_tipos_autoridades_id) REFERENCES tipos_autoridades(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE areas_trabajo ADD CONSTRAINT autoridad_area_fk FOREIGN KEY (FK_autoridades_id) REFERENCES autoridades(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE areas_afectadas_permiso ADD CONSTRAINT areas_afectadas_area_fk FOREIGN KEY (FK_areas_trabajo_id) REFERENCES areas_trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE areas_afectadas_permiso ADD CONSTRAINT areas_afectadas_permiso_fk FOREIGN KEY (FK_permiso_id) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE permiso ADD CONSTRAINT permiso_disciplina_fk FOREIGN KEY (FK_disciplinas_id) REFERENCES disciplinas(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE permiso ADD CONSTRAINT permiso_trabajo_fk FOREIGN KEY (FK_trabajo_id) REFERENCES trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE riesgos_trabajo ADD CONSTRAINT riesgo_ries_trab_fk FOREIGN KEY (FK_riesgo_id) REFERENCES riesgo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE riesgos_trabajo ADD CONSTRAINT permiso_ries_trab_fk FOREIGN KEY (FK_permiso_id) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE precauciones_trabajo ADD CONSTRAINT permiso_prec_trab_fk FOREIGN KEY (FK_permiso_id) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE precauciones_trabajo ADD CONSTRAINT precaucion_prec_trab_fk FOREIGN KEY (FK_precaucion_id) REFERENCES precaucion(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE certificados_trabajo ADD CONSTRAINT permiso_cert_trab_fk FOREIGN KEY (FK_permiso_id) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE certificados_trabajo ADD CONSTRAINT certificado_cert_trab_fk FOREIGN KEY (FK_certificados_id) REFERENCES certificados(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE control ADD CONSTRAINT control_riesgo_fk FOREIGN KEY (FK_riesgo_id) REFERENCES riesgo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE controles_trabajo ADD CONSTRAINT control_cont_trab_fk FOREIGN KEY (FK_control_id) REFERENCES control(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE controles_trabajo ADD CONSTRAINT permiso_cont_trab_fk FOREIGN KEY (FK_permiso_id) REFERENCES permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE certificados_trabajo ADD CONSTRAINT autoridad_cert_trab FOREIGN KEY (FK_autoridades_id) REFERENCES autoridades(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE precauciones_trabajo ADD CONSTRAINT autoridad_prec_trab_fk FOREIGN KEY (FK_autoridades_id) REFERENCES autoridades(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE user_group ADD CONSTRAINT user_group_fk FOREIGN KEY (FK_user_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE user_group ADD CONSTRAINT group_user_fk FOREIGN KEY (FK_group_id) REFERENCES groups(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE group_rol ADD CONSTRAINT rol_group_rol_fk FOREIGN KEY (FK_rol_id) REFERENCES rol(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE group_rol ADD CONSTRAINT group_group_rol_fk FOREIGN KEY (FK_group_id) REFERENCES groups(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE rol_resource ADD CONSTRAINT rol_rol_res_fk FOREIGN KEY (FK_rol_id) REFERENCES rol(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE rol_resource ADD CONSTRAINT resource_rol_res_fk FOREIGN KEY (FK_resource_id) REFERENCES resource(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

INSERT INTO menu (nombre, descripcion) VALUES ('RAIZ','RAIZ');
