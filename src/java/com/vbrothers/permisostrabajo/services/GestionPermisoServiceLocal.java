/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Users;
import java.text.ParseException;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author jerviver21
 */
@Local
public interface GestionPermisoServiceLocal {


    //Métodos para servicios de la entidad PermisoTrabajo

    PermisoTrabajoTO findPermisoTrabajo(Object id);

    PermisoTrabajo guardarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void solicitarAprobacion(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void aprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void noAprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void terminarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void cancelarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void finalizarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;
    
    List<PermisoTrabajo> findPermisosPendientes(Users usr);
    
}
