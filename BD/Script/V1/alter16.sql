ALTER TABLE rol_resource DROP CONSTRAINT resource_rol_res_fk;
ALTER TABLE rol_resource ADD CONSTRAINT resource_rol_res_fk FOREIGN KEY (id_resource) REFERENCES resource(id) ON DELETE CASCADE ON UPDATE CASCADE;
