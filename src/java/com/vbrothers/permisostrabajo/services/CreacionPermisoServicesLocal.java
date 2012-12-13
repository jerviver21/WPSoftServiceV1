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
import java.text.ParseException;
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
    
    List<PermisoTrabajo> findPermisosEnProceso(String user);
    
    List<PermisoTrabajo> findPermisos(String user, int estado, Date fechaIni, Date fechaFin);

    void crearPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException, ValidacionException;
    
    void actualizarPermiso(PermisoTrabajoTO pto);
    
    void deletePermiso(PermisoTrabajo pt)throws EstadoException;

    public EstadoPermiso findEstadoById(int estado);

}
