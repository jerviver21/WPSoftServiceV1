
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ValidacionException;
import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.*;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Users;
import com.vbrothers.util.EstadosPermiso;
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
        if(permiso.isEjecutorContratista()){
            Contratista cont = contratistaServices.findByUser(permiso.getUsuariosEjecutante());
            pto.setContratista(cont);
        }else{
            String[] usrs = permiso.getUsuariosEjecutante().split(";");
            for(String usr : usrs){
                pto.getEmpleados().add(empleadoServices.findByUser(usr));
            }
        }
        return pto;
    }
    
    @Override
    public void crearPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException, ValidacionException{
        PermisoTrabajo permiso = pto.getPermiso();
        permiso.setFechaHoraCreacion(new Date());
        
        if(permiso.getEquipo().getId() == null || permiso.getEquipo().getId() == 0 ){
            permiso.setEquipo(null);
        }

        if(pto.getContratista() != null){
            permiso.setEjecutorContratista(true);
            Contratista cont = contratistaServices.find(pto.getContratista().getId());
            String usr = cont.getUsuario();
            System.out.println("Usuario Contratista: "+usr);
            permiso.setUsuariosEjecutante(usr);
        }

        if(pto.getContratista() == null){
            permiso.setEjecutorContratista(false);
            if(pto.getEmpleados().isEmpty()){
                throw new ValidacionException("Debe agregar empleados ejecutantes");
            }
            for(Empleado emp:pto.getEmpleados()){
                String usr = emp.getUsuario();
                System.out.println("Usuario empleado: "+usr);
                permiso.setUsuariosEjecutante(permiso.getUsuariosEjecutante() == null
                        ? usr : permiso.getUsuariosEjecutante()+";"+usr);
            }
        }
        permiso.setEstadoPermiso(EstadosPermiso.CREADO);
        //permiso.setProyecto(em.find(Proyecto.class, trabajo.getIdProyecto()));
        pto.setPermiso(em.merge(pto.getPermiso()));
        System.out.println("Id nuevo permiso de trabajo: -> "+pto.getPermiso().getId());
        adminEstadosServices.crearPermiso(pto);
    }
    
    @Override
    public void actualizarPermiso(PermisoTrabajoTO pto){
        PermisoTrabajo permiso = pto.getPermiso();
        pto.setPermiso(em.merge(pto.getPermiso()));
    }

    @Override
    public List<PermisoTrabajo> findPermisosEnProceso(Users usr) {
        String rolAdmin = ServiceLocator.getInstance().getParameter("rolAdmin") ;
        String rolGerente = ServiceLocator.getInstance().getParameter("rolGerente") ;
        String query = "SELECT p FROM PermisoTrabajo p WHERE p.usuarioCreacion = '"+usr.getUsr()+"' "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId();
        if(usr.getRoles().contains(rolAdmin) || usr.getRoles().contains(rolGerente))  {
            query = "SELECT p FROM PermisoTrabajo p WHERE "
                + " p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId();
            
        }
        return em.createQuery(query).getResultList();
    }

    @Override
    public List<PermisoTrabajo> findPermisos(Users user, int estado, Date fechaIni, Date fechaFin) {
        String rolAdmin = ServiceLocator.getInstance().getParameter("rolAdmin") ;
        String rolGerente = ServiceLocator.getInstance().getParameter("rolGerente") ;
        List<PermisoTrabajo> permisos = em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE p.usuarioCreacion =:user "
                + "AND p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion BETWEEN :fechaIni AND :fechaFin ")
                .setParameter("user", user.getUsr())
                .setParameter("estado", estado)
                .setParameter("fechaIni",fechaIni)
                .setParameter("fechaFin", fechaFin)
                .getResultList();
        if(user.getRoles().contains(rolAdmin) || user.getRoles().contains(rolGerente))  {
            permisos = em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE  p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion BETWEEN :fechaIni AND :fechaFin ")
                .setParameter("estado", estado)
                .setParameter("fechaIni",fechaIni)
                .setParameter("fechaFin", fechaFin)
                .getResultList();
            
        }
        return permisos;
    }
    
    
    @Override
    public void deletePermiso(PermisoTrabajo pt)throws EstadoException{
        pt.setProyecto(null);
        if(!pt.getEstadoPermiso().equals(EstadosPermiso.CREADO)){
            throw new EstadoException("El permiso se encuentra en un estado en el cual no se puede borrar, cambie estado a SUSPENDIDO");
        }
        em.remove(em.merge(pt));
    }

    @Override
    public EstadoPermiso findEstadoById(int estado) {
        return (EstadoPermiso) em.find(EstadoPermiso.class, estado);
    }

    

    
}
