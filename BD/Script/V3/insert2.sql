update parametro set valor='ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR' WHERE nombre = 'aprueba_defecto';
update parametro set valor='ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR' WHERE nombre = 'cancela_defecto';
update trazabilidad_permiso set usr_grp_asignado='ADMINISTRADORES CALIDAD' WHERE usr_grp_asignado='CALIDAD';
update trazabilidad_permiso set usr_grp_asignado='ADMINISTRADORES SEGURIDAD' WHERE usr_grp_asignado='SEGURIDAD';
