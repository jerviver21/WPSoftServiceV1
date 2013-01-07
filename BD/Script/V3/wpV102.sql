ALTER TABLE certificados_trabajo DROP CONSTRAINT certificado_cert_trab_fk;
DROP TABLE certificado;
CREATE TABLE certificado (
	id serial NOT NULL,
	nombre varchar(1500) NOT NULL,
	ruta_check_list varchar(1500) NOT NULL,
	cl_cargado boolean
);
ALTER TABLE certificado ADD CONSTRAINT certificado_pk PRIMARY KEY(id);
ALTER TABLE certificados_trabajo ADD CONSTRAINT cert_cert_trabajo_fk FOREIGN KEY (id_certificado) REFERENCES certificado(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE certificados_trabajo ADD restriccion varchar(1500);

ALTER TABLE precauciones_trabajo DROP CONSTRAINT precaucion_prec_trab_fk;
DROP TABLE precaucion;
ALTER TABLE precauciones_trabajo DROP COLUMN id_precaucion;
ALTER TABLE precauciones_trabajo DROP COLUMN otros_cual;
ALTER TABLE precauciones_trabajo ADD nota varchar(2500) NOT NULL;
ALTER TABLE precauciones_trabajo RENAME TO notas_permiso;
ALTER TABLE notas_permiso ADD usr varchar(255) NOT NULL DEFAULT 'VALIDADOR';

INSERT INTO parametro (nombre, valor, tipo) VALUES ('dirChecklist','../../jbossas-7/data/checklist','FILE');
INSERT INTO parametro (nombre, valor, tipo) VALUES ('grupoValidador','VALIDADORES','AU');
