ALTER TABLE permiso_trabajo ADD id_estado_anterior int4;
ALTER TABLE permiso_trabajo ADD CONSTRAINT estado_anterior_fk FOREIGN KEY (id_estado_anterior) REFERENCES estado_permiso(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
