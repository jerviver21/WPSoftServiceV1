ALTER TABLE empleados_proyecto DROP CONSTRAINT proy_emp_proy_fk;
ALTER TABLE empleados_proyecto DROP COLUMN id_proyecto;
ALTER TABLE empleados_proyecto DROP CONSTRAINT emp_proy_emp_fk;
ALTER TABLE empleados_proyecto DROP COLUMN id_empleado;
DROP TABLE empleados_proyecto;
CREATE TABLE empleados_proyecto (
	id bigserial NOT NULL,
	id_empleado bigint,
	id_proyecto bigint
);
ALTER TABLE empleados_proyecto ADD CONSTRAINT empleados_proyectos_pk PRIMARY KEY(id);
ALTER TABLE empleados_proyecto ADD CONSTRAINT emp_proy_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE empleados_proyecto ADD CONSTRAINT proy_pory_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id) ON DELETE CASCADE ON UPDATE CASCADE;

