/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ValidacionException;
import com.vbrothers.permisostrabajo.dominio.EstadoPermiso;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Users;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author jerviver21
 */
@Local
public interface CreacionPermisoServicesLocal {

    PermisoTrabajoTO findPermisoTrabajo(Object id);
    
    List<PermisoTrabajo> findPermisosEnProceso(Users user);
    
    List<PermisoTrabajo> findPermisos(Users user, int estado, Date fechaIni, Date fechaFin);

    void crearPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException, ValidacionException;
    
    void actualizarPermiso(PermisoTrabajoTO pto);
    
    void deletePermiso(PermisoTrabajo pt)throws EstadoException;

    public EstadoPermiso findEstadoById(int estado);

}
