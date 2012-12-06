ALTER TABLE empleados ADD ruta_cert_cm varchar(1000);
ALTER TABLE empleados ADD ruta_cert_ta varchar(1000);
ALTER TABLE empleados ADD certificado_medico boolean NOT NULL DEFAULT false;
ALTER TABLE contratistas ADD activo boolean NOT NULL DEFAULT true;
ALTER TABLE contratistas ADD telefono_contacto varchar(15);
