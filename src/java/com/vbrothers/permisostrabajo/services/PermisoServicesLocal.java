package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ValidacionException;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso;
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
public interface PermisoServicesLocal {
    
    //Servicios generales del permiso de trabajo
    List<PermisoTrabajo> findPermisos(Users user, int estado, Date fechaIni, Date fechaFin);
    
    void actualizarPermiso(PermisoTrabajoTO pto);
    
    void deletePermiso(PermisoTrabajo pt)throws EstadoException;

    void cambiarEstado(PermisoTrabajo pt, int estado);
    
    //Servicios para la creación de permisos de trabajo
    PermisoTrabajoTO findPermisoForCreacion(Object id);
    
    List<PermisoTrabajo> findPermisosEnProceso(Users user);
    
    void crearPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException, ValidacionException;

    //Servicios para gestion en general del permiso de trabajo
    PermisoTrabajoTO findPermisoForGestion(Object id);

    PermisoTrabajo guardarPasos(PermisoTrabajoTO pto)throws LlaveDuplicadaException;
    
    List<PermisoTrabajo> findPermisosPendientes(Users usr);
    
    List<TrazabilidadPermiso> findTrazabilidadPermiso(PermisoTrabajo permiso);

    //Servicios para el diligenciamiento del permiso de trabajo
    void solicitarAprobacion(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    //Servicios para la aprobacion del permiso de trabajo
    void aprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;
   
    void noAprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    //Servicios para etapas finales de gestion del permiso
    void terminarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void cancelarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;

    void finalizarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException;
    
}