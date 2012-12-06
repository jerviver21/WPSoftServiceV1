ALTER TABLE parametro_reporte DROP CONSTRAINT param_data_fk;
ALTER TABLE parametro_reporte ALTER id TYPE integer;
ALTER TABLE parametro_reporte ALTER fk_data TYPE integer;
ALTER TABLE parametro_reporte DROP COLUMN fk_data;
ALTER TABLE parametro_reporte ADD fk_data integer;
ALTER TABLE parametro_reporte ADD CONSTRAINT data_param_rep_fk FOREIGN KEY (fk_data) REFERENCES data(id) ON DELETE CASCADE ON UPDATE CASCADE;
