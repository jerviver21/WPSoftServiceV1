/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface AdminEstadosPermisosServicesLocal {

    void crearPermiso(PermisoTrabajoTO permiso);

    void solicitarAprobacion(PermisoTrabajoTO permiso)throws ParametroException;

    void aprobarPermiso(PermisoTrabajoTO permiso);

    void terminarPermiso(PermisoTrabajoTO permiso)throws ParametroException;

    void noAprobarPermiso(PermisoTrabajoTO permiso);
    
    void agregarAprobador(PermisoTrabajoTO pto, String usrGrupo);

    void cancelarPermiso(PermisoTrabajoTO permiso);

    void finalizarPermiso(PermisoTrabajoTO pto);
    
    //void desbloquearPermiso(PermisoTrabajo permiso);
    
}
