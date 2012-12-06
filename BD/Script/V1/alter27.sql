ALTER TABLE riesgos_trabajo DROP CONSTRAINT riesgo_ries_trab_fk;
ALTER TABLE controles_trabajo DROP CONSTRAINT control_cont_trab_fk;
ALTER TABLE control DROP CONSTRAINT control_riesgo_fk;
DROP TABLE control;
DROP TABLE riesgo;
CREATE TABLE riesgo (
	id serial,
	codigo varchar(255),
	descripcion text,
	activo boolean
);
ALTER TABLE riesgo ADD CONSTRAINT riesgo_pk PRIMARY KEY(id);
CREATE TABLE control (
	id serial,
	codigo varchar(255),
	descripcion text,
	activo boolean,
	id_riesgo int4
);
ALTER TABLE control ADD CONSTRAINT control1_pks PRIMARY KEY(id);
ALTER TABLE control ADD CONSTRAINT control_riesgo_fk FOREIGN KEY (id_riesgo) REFERENCES riesgo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE controles_trabajo ADD CONSTRAINT cont_tarea_cont_fk FOREIGN KEY (id_control) REFERENCES control(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE riesgos_trabajo ADD CONSTRAINT riesgo_tarea_riesgo_fk FOREIGN KEY (id_riesgo) REFERENCES riesgo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE riesgos_trabajo RENAME TO riesgos_tarea;
ALTER TABLE controles_trabajo RENAME TO controles_tarea;

