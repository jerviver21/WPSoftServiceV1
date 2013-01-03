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
