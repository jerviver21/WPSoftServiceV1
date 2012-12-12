/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.EstadosProyecto;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.Proyecto;
import com.vbrothers.util.EstadosPermiso;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author jerviver21
 */
@Stateless
public class ProyectoServices extends AbstractFacade<Proyecto> implements ProyectoServicesLocal {
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @EJB
    CreacionPermisoServicesLocal permisoService;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProyectoServices() {
        super(Proyecto.class);
    }

    @Override
    public void edit(Proyecto proyecto)throws LlaveDuplicadaException{
        if(proyecto.getFechaHoraCreacion() == null){
            proyecto.setFechaHoraCreacion(new Date());
            proyecto.setEstado(new EstadosProyecto(1));
            proyecto.getEstado().setNombre("ACTIVO");
        }
        try {
            Proyecto p = em.merge(proyecto);
            proyecto.setId(p.getId());
        } catch (ConstraintViolationException e) {
            throw new LlaveDuplicadaException("El proyecto ya existe");
        }
       
    }
    
    @Override
    public List<Proyecto> findAll(){
        List<Proyecto> proyectos = em.createNamedQuery("Proyecto.findAll").getResultList();
        return proyectos;
    }

    @Override
    public List<Proyecto> findProyectosContratista(Contratista contratista) {
        List<Proyecto> proyectos = em.createNamedQuery("Proyecto.findProyectosContratista")
                .setParameter("idContratista", contratista.getId()).getResultList();
        return proyectos;
    }
    
    @Override
    public List<Proyecto> findProyectosActivos(){
        List<Proyecto> proyectos = em.createQuery("SELECT p FROM Proyecto p WHERE p.estado.id = 1").getResultList();
        return proyectos;
    }

    @Override
    public List<Proyecto> findProyectos(String usr, Date fechaDesde, Date fechaHasta) {
        List<Proyecto> proyectos = em.createQuery("SELECT p FROM Proyecto p "
                + "WHERE p.usuarioCreacion = :usr AND p.fechaHoraCreacion BETWEEN :fechaIni AND :fechaFin ")
                .setParameter("user", usr)
                .setParameter("fechaIni",fechaDesde)
                .setParameter("fechaFin", fechaHasta)
                .getResultList();
        return proyectos;
    }

    @Override
    public void borrarProyecto(Proyecto proyecto) throws EstadoException {
        proyecto = em.merge(proyecto);
        for (PermisoTrabajo p : proyecto.getPermisos()) {
            try {
                permisoService.deletePermiso(p);
            } catch (EstadoException e) {
                throw new EstadoException("El proyecto no se puede borrar, hay actividades que fueron iniciadas. Si desea puede inactivar el proyecto");
            }
        }
        em.remove(proyecto);
    }

    @Override
    public Proyecto findProyecto(Long id) {
        Proyecto p = (Proyecto) em.find(Proyecto.class, id);
        System.out.println("No Permisos del proyecto p: "+p.getPermisos().size());
        return p;
    }

    @Override
    public EstadosProyecto findEstadoById(int estado) {
        return (EstadosProyecto) em.find(EstadosProyecto.class, estado);
    }
    
}
