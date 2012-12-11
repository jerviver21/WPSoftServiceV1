ALTER TABLE proyecto ADD usuario_creacion varchar(300) NOT NULL;
ALTER TABLE proyecto ADD fecha_hora_creacion timestamp NOT NULL DEFAULT now();
