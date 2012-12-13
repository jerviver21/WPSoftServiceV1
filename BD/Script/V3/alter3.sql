ALTER TABLE permiso_trabajo DROP COLUMN hora_ini;
ALTER TABLE permiso_trabajo DROP COLUMN fecha_fin;
ALTER TABLE permiso_trabajo DROP COLUMN hora_fin;
ALTER TABLE permiso_trabajo DROP COLUMN fecha_ini;
ALTER TABLE permiso_trabajo ADD fecha_hora_fin timestamp;
ALTER TABLE permiso_trabajo ADD fecha_hora_ini timestamp;
