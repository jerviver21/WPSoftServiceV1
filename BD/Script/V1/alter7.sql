DROP INDEX empleados_ui1;
CREATE UNIQUE INDEX empleados_ui1 ON empleados (num_id,FK_contratistas_id);
DROP INDEX empleados_ui1;
CREATE UNIQUE INDEX empleados_ui1 ON empleados (num_id);
