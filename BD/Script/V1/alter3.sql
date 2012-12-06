CREATE TABLE procesos_reportes (
	id integer NOT NULL,
	nombre varchar(1000)
);
ALTER TABLE procesos_reportes ADD CONSTRAINT procesos_reportes_pk PRIMARY KEY(id);
ALTER TABLE reporte DROP COLUMN proceso;
ALTER TABLE reporte ADD fk_proceso integer;
ALTER TABLE reporte ADD CONSTRAINT reporte_proceso_fk FOREIGN KEY (fk_proceso) REFERENCES procesos_reportes(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

INSERT INTO procesos_reportes VALUES (1, 'REPORTES');
INSERT INTO procesos_reportes VALUES (2, 'ARCHIVOS');
