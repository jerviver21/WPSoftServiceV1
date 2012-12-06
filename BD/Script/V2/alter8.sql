ALTER TABLE menu ALTER descripcion TYPE varchar(300);
ALTER TABLE menu DROP COLUMN descripcion;
ALTER TABLE menu ADD descripcion varchar(2000);
ALTER TABLE rol DROP COLUMN descripcion;
ALTER TABLE rol ADD descripcion varchar(2000);
