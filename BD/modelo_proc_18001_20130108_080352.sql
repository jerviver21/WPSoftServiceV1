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
