/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vi.comun.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface AdminEstadosPermisosServicesLocal {

    void crearPermiso(PermisoTrabajo permiso);

    void solicitarAprobacion(PermisoTrabajo permiso)throws ParametroException;

    void aprobarPermiso(PermisoTrabajo permiso);

    void terminarPermiso(PermisoTrabajo permiso)throws ParametroException;

    void noAprobarPermiso(PermisoTrabajo permiso);
    
    void agregarAprobador(PermisoTrabajo pto, String usrGrupo);

    void cancelarPermiso(PermisoTrabajo permiso);

    void finalizarPermiso(PermisoTrabajo pto);
    
    //void desbloquearPermiso(PermisoTrabajo permiso);
    
}
