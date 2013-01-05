ALTER TABLE precauciones_trabajo DROP CONSTRAINT precaucion_prec_trab_fk;
DROP TABLE precaucion;
ALTER TABLE precauciones_trabajo DROP COLUMN id_precaucion;
ALTER TABLE precauciones_trabajo DROP COLUMN nota;
ALTER TABLE precauciones_trabajo ADD nota varchar(2500) NOT NULL;
ALTER TABLE precauciones_trabajo RENAME TO notas_permiso;
