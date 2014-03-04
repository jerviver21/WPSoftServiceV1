package com.vbrothers.permisostrabajo.services;

import com.vi.comun.exceptions.EstadoException;
import com.vi.comun.exceptions.LlaveDuplicadaException;
import com.vi.comun.exceptions.ParametroException;
import com.vi.comun.exceptions.ValidacionException;
import com.vbrothers.permisostrabajo.dominio.ControlesPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.NotasPermiso;
import com.vbrothers.permisostrabajo.dominio.PeligrosTarea;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.RiesgosPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.Tarea;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso;
import com.vi.usuarios.dominio.Users;
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
    void cambiarEstado(PermisoTrabajo pt, int estado);
    
    PermisoTrabajo actualizarPermiso(PermisoTrabajo pto);
    
    //Servicios para la creación de permisos de trabajo
    List<PermisoTrabajo> findPermisos(Users user, int estado, Date fechaIni, Date fechaFin);
      
    PermisoTrabajo findPermisoForCreacion(Object id);
    
    List<PermisoTrabajo> findPermisosEnProceso(Users user);
    
    void crearPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException, ValidacionException;
    
    void deletePermiso(PermisoTrabajo pt)throws EstadoException;

    //Servicios para gestion en general del permiso de trabajo
    PermisoTrabajo findPermisoForGestion(Object id);

    void guardarGestion(PermisoTrabajo pto)throws LlaveDuplicadaException;
    
    List<PermisoTrabajo> findPermisosPendientes(Users usr);
    
    List<TrazabilidadPermiso> findTrazabilidadPermiso(PermisoTrabajo permiso);
    
    void borrarTarea(Tarea tarea);
    
    void borrarPeligro(PeligrosTarea pt);
    
    void borrarRiesgo(RiesgosPeligroTarea rpt);

    void borrarControl(ControlesPeligroTarea ctr);

    void borrarNota(NotasPermiso nota);

    //Servicios para el diligenciamiento del permiso de trabajo
    void solicitarAprobacion(PermisoTrabajo pto)throws LlaveDuplicadaException, ParametroException;

    //Servicios para la aprobacion del permiso de trabajo
    void aprobarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException;
   
    void noAprobarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException;
    
    List findUsersAprobadores(PermisoTrabajo pto);

    List findGruposAprobadores(PermisoTrabajo pto);

    //Servicios para etapas finales de gestion del permiso
    void terminarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException, ParametroException;

    void cancelarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException;

    void finalizarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException;

    
}
