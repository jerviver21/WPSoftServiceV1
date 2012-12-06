ALTER TABLE equipos_afectados RENAME TO equipos_afectados_permiso;
ALTER TABLE trabajo ADD nombre varchar(600) NOT NULL;
ALTER TABLE permiso ADD nombre varchar(600);
