ALTER TABLE users ADD nombre varchar(1500);
ALTER TABLE users ADD mail varchar(1500);

CREATE TABLE empleados_permiso (
	id bigserial NOT NULL,
	id_permiso bigint NOT NULL,
	id_empleado bigint NOT NULL
);
ALTER TABLE empleados_permiso ADD CONSTRAINT empleados_permiso_pk PRIMARY KEY(id);
ALTER TABLE empleados_permiso ADD CONSTRAINT pt_emp_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE empleados_permiso ADD CONSTRAINT emp_ep_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE permiso_trabajo DROP COLUMN usuarios_ejecutante;
ALTER TABLE permiso_trabajo ADD id_contratista bigint;
ALTER TABLE permiso_trabajo ADD CONSTRAINT pt_cont_fk FOREIGN KEY (id_contratista) REFERENCES contratista(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE empleados_permiso DROP CONSTRAINT pt_emp_fk;
ALTER TABLE empleados_permiso ADD CONSTRAINT pt_emp_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

DROP INDEX tarea_ui1;

ALTER TABLE users DROP COLUMN estado;
ALTER TABLE users ADD vetado boolean DEFAULT false;
ALTER TABLE users ADD activo boolean DEFAULT true;
CREATE TABLE administradoras (
	codigo varchar(10) NOT NULL,
	nombre varchar(1500) NOT NULL,
	tipo int4 NOT NULL
);
ALTER TABLE administradoras ADD CONSTRAINT administradoras_pk PRIMARY KEY(codigo);
ALTER TABLE administradoras DROP COLUMN tipo;
ALTER TABLE administradoras ADD tipo varchar(200) NOT NULL;
ALTER TABLE users ADD estado int4 NOT NULL default 1;

INSERT INTO administradoras VALUES ('EPS001', 'COOMEVA', 'EPS');
INSERT INTO administradoras VALUES ('ARP001', 'SURA', 'ARP');

ALTER TABLE users DROP COLUMN activo;

ALTER TABLE empleado ADD mail varchar(500);

ALTER TABLE empleado ALTER telefono TYPE varchar(150);
ALTER TABLE trazabilidad_activacion_emps ADD fecha_induccion date;
ALTER TABLE trazabilidad_activacion_emps ADD fecha_vetacion date;
ALTER TABLE trazabilidad_activacion_emps ADD vetar boolean;
ALTER TABLE trazabilidad_activacion_emps ADD activar boolean;

delete from parametro where  nombre='grupoValidador';
update parametro set nombre = 'rolCalidad', valor = 'CALIDAD', tipo='AU' where nombre='grupoCalidad';
update parametro set nombre = 'rolSeguridad', valor = 'SEGURIDAD', tipo='AU' where nombre='grupoSeguridad';
update parametro set valor='CALIDAD,SEGURIDAD,SECTOR' where nombre = 'aprueba_defecto';
update parametro set valor='CALIDAD,SEGURIDAD,SECTOR' where nombre = 'cancela_defecto';
INSERT INTO parametro (nombre, valor, tipo) VALUES ('rolAprobador','APROBADOR','AU');
update rol set codigo = 'APROBADOR' WHERE codigo = 'aprobadores';

update parametro set valor='ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR' WHERE nombre = 'aprueba_defecto';
update parametro set valor='ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR' WHERE nombre = 'cancela_defecto';
update trazabilidad_permiso set usr_grp_asignado='ADMINISTRADORES CALIDAD' WHERE usr_grp_asignado='CALIDAD';
update trazabilidad_permiso set usr_grp_asignado='ADMINISTRADORES SEGURIDAD' WHERE usr_grp_asignado='SEGURIDAD';

INSERT INTO parametro (nombre, valor, tipo) VALUES ('rolRecepcionista','RECEPCIONISTA','AU');

