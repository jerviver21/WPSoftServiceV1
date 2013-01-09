delete from parametro where  nombre='grupoValidador';
update parametro set nombre = 'rolCalidad', valor = 'CALIDAD', tipo='AU' where nombre='grupoCalidad';
update parametro set nombre = 'rolSeguridad', valor = 'SEGURIDAD', tipo='AU' where nombre='grupoSeguridad';
update parametro set valor='CALIDAD,SEGURIDAD,SECTOR' where nombre = 'aprueba_defecto';
update parametro set valor='CALIDAD,SEGURIDAD,SECTOR' where nombre = 'cancela_defecto';
INSERT INTO parametro (nombre, valor, tipo) VALUES ('rolAprobador','APROBADOR','AU');
update rol set codigo = 'APROBADOR' WHERE codigo = 'aprobadores';


