ALTER TABLE empleado ALTER telefono TYPE varchar(150);
ALTER TABLE trazabilidad_activacion_emps ADD fecha_induccion date;
ALTER TABLE trazabilidad_activacion_emps ADD fecha_vetacion date;
ALTER TABLE trazabilidad_activacion_emps ADD vetar boolean;
ALTER TABLE trazabilidad_activacion_emps ADD activar boolean;
