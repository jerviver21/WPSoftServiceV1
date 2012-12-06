DROP INDEX empleados_ui1;
CREATE UNIQUE INDEX empleados_ui1 ON empleado (num_id,id_contratista);
