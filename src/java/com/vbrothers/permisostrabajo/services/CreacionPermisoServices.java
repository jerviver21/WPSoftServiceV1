
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.*;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.util.EstadosPermiso;
import com.vbrothers.util.FechaUtils;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class CreacionPermisoServices implements CreacionPermisoServicesLocal {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @EJB
    AdminEstadosPermisosServicesLocal adminEstadosServices;

    @EJB
    ContratistaServicesLocal contratistaServices;
    
    @EJB
    EmpleadoServicesLocal empleadoServices;


    @Override
    public PermisoTrabajoTO findPermisoTrabajo(Object id){
        PermisoTrabajoTO pto = new PermisoTrabajoTO();
        PermisoTrabajo permiso = em.find(PermisoTrabajo.class, id);
        pto.setPermiso(permiso);
        pto.setHoraIni(FechaUtils.getHora(permiso.getHoraIni()));
        pto.setHoraFin(FechaUtils.getHora(permiso.getHoraFin()));
        if(permiso.isEjecutorContratista()){
            Contratista cont = contratistaServices.findByUser(permiso.getUsuariosEjecutante());
            pto.setContratista(cont);
        }else{
            if(permiso.getUsuariosEjecutante() != null){
                String[] usrs = permiso.getUsuariosEjecutante().split(";");
                for(String usr : usrs){
                    pto.getEmpleados().add(empleadoServices.findByUser(usr));
                }
            }
        }
        return pto;
    }
    
    @Override
    public void crearPermiso(PermisoTrabajoTO pto)throws ParseException, LlaveDuplicadaException{
        PermisoTrabajo permiso = pto.getPermiso();
        if(pto.getHoraIni() != null){
            permiso.setHoraIni(FechaUtils.getTime(pto.getHoraIni()));
            permiso.setHoraFin(FechaUtils.getTime(pto.getHoraFin()));
        }
        permiso.setFechaHoraCreacion(new Date());

        if(pto.getContratista() != null){
            Contratista cont = contratistaServices.find(pto.getContratista().getId());
            String usr = cont.getUsuario();
            System.out.println("Usuario Contratista: "+usr);
            permiso.setUsuariosEjecutante(usr);
            permiso.setEjecutorContratista(true);
        }

        if(!pto.getEmpleados().isEmpty()){
            for(Empleado emp:pto.getEmpleados()){
                String usr = emp.getUsuario();
                System.out.println("Usuario empleado: "+usr);
                permiso.setUsuariosEjecutante(permiso.getUsuariosEjecutante() == null
                        ? usr : permiso.getUsuariosEjecutante()+";"+usr);
            }
            permiso.setEjecutorContratista(false);
        }
        permiso.setEstadoPermiso(EstadosPermiso.CREADO);
        //permiso.setProyecto(em.find(Proyecto.class, trabajo.getIdProyecto()));
        pto.setPermiso(em.merge(pto.getPermiso()));
        System.out.println("Id nuevo permiso de trabajo: -> "+pto.getPermiso().getId());
        adminEstadosServices.crearPermiso(pto);
    }
    
    @Override
    public void actualizarPermiso(PermisoTrabajoTO pto)throws ParseException{
        PermisoTrabajo permiso = pto.getPermiso();
        if(pto.getHoraIni() != null){
            permiso.setHoraIni(FechaUtils.getTime(pto.getHoraIni()));
            permiso.setHoraFin(FechaUtils.getTime(pto.getHoraFin()));
        }
        pto.setPermiso(em.merge(pto.getPermiso()));
    }

    @Override
    public List<PermisoTrabajo> findPermisosEnProceso(String user) {
        return em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE p.usuarioCreacion = '"+user+"' "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId()).getResultList();
    }

    @Override
    public List<PermisoTrabajo> findPermisos(String user, int estado, Date fechaIni, Date fechaFin) {
        return em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE p.usuarioCreacion =:user "
                + "AND p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion BETWEEN :fechaIni AND :fechaFin ")
                .setParameter("user", user)
                .setParameter("estado", estado)
                .setParameter("fechaIni",fechaIni)
                .setParameter("fechaFin", fechaFin)
                .getResultList();
    }
    
    
    @Override
    public void deletePermiso(PermisoTrabajo pt)throws EstadoException{
        if(pt.getEstadoPermiso().equals(EstadosPermiso.CREADO)){
            em.remove(em.merge(pt));
        }else{
            throw new EstadoException("El permiso se encuentra en un estado en el cual no se puede borrar, cambie estado a SUSPENDIDO");
        }
        
    }

    

    
}
