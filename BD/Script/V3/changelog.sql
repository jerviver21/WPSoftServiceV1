ALTER TABLE certificados_trabajo ADD CONSTRAINT cert_cert_trabajo_fk FOREIGN KEY (id_certificado) REFERENCES certificado(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

