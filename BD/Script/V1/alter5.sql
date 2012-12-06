ALTER TABLE parametro_reporte DROP CONSTRAINT param_reporte_fk;
ALTER TABLE archivo DROP CONSTRAINT archivo_reporte_fk;
ALTER TABLE reporte DROP CONSTRAINT reporte_pk;
ALTER TABLE reporte ADD id integer NOT NULL;
ALTER TABLE reporte ADD CONSTRAINT reporte_pk PRIMARY KEY(id);
ALTER TABLE parametro_reporte DROP COLUMN fk_reporte;
ALTER TABLE parametro_reporte ADD fk_reporte integer;
ALTER TABLE parametro_reporte ADD CONSTRAINT param_rep_reporte_fk FOREIGN KEY (fk_reporte) REFERENCES reporte(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE archivo DROP COLUMN fk_reporte;
ALTER TABLE archivo ADD fk_reporte integer;
ALTER TABLE archivo ADD CONSTRAINT archivo_reporte_fk FOREIGN KEY (fk_reporte) REFERENCES reporte(id) ON DELETE CASCADE ON UPDATE CASCADE;
