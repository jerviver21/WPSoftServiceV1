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
public interface PermisoTrabajoServicesLocal {
    //Métodos básicos
    PermisoTrabajo find(Object id);

    void edit(PermisoTrabajo tarea)throws LlaveDuplicadaException;

    void remove(PermisoTrabajo trabajo);

    List<PermisoTrabajo> findAll();



    //Métodos para servicios de la entidad PermisoTrabajo

    PermisoTrabajoTO findPermisoTrabajo(Object id);

    List<PermisoTrabajo> findPermisosPendientes(Users usr);

    PermisoTrabajo guardarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void crearPermiso(PermisoTrabajoTO pto)throws ParseException, LlaveDuplicadaException;

    void solicitarAprobacion(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void aprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    public void noAprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void terminarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    public void cancelarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    public void finalizarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;
   
    

}
