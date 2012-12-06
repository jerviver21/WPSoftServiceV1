ALTER TABLE resource ADD language varchar(2) default 'es';
ALTER TABLE menu ADD language varchar(2) default 'es';
ALTER TABLE resource RENAME COLUMN language TO idioma;
ALTER TABLE menu RENAME COLUMN language TO idioma;
