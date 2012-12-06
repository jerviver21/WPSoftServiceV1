ALTER TABLE rol_resource DROP CONSTRAINT rol_rol_res_fk;
ALTER TABLE rol_resource DROP COLUMN FK_rol_id;
ALTER TABLE rol_resource DROP CONSTRAINT resource_rol_res_fk;
ALTER TABLE rol_resource DROP COLUMN FK_resource_id;
DROP TABLE rol_resource;
