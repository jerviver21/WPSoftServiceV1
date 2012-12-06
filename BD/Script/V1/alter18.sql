ALTER TABLE proyecto DROP COLUMN contratista_evento;
ALTER TABLE proyecto ADD fecha_fin date;
ALTER TABLE proyecto ADD fecha_ini date;
ALTER TABLE empleados_proyecto ADD actividad text;
ALTER TABLE contratistas_proyecto ADD actividad text;
CREATE TABLE trazabilidad_activacion_emps (
	id bigserial NOT NULL,
	id_empleado bigint NOT NULL,
	fecha_activacion date,
	usuario_activador varchar(600)
);
ALTER TABLE trazabilidad_activacion_emps ADD CONSTRAINT trazabilidad_activacion_emps_pk PRIMARY KEY(id);
ALTER TABLE trazabilidad_activacion_emps ADD CONSTRAINT emp_traz_act_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
