/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.ContratistasProyecto;
import com.vbrothers.permisostrabajo.dominio.EmpleadosProyecto;
import com.vbrothers.permisostrabajo.dominio.EstadosProyecto;
import com.vbrothers.permisostrabajo.dominio.Proyecto;
import java.util.List;
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

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProyectoServices() {
        super(Proyecto.class);
    }

    @Override
    public void edit(Proyecto proyecto)throws LlaveDuplicadaException{
        List<ContratistasProyecto> contratistas = proyecto.getContratistas();
        List<EmpleadosProyecto> empleados = proyecto.getEmpleados();
        proyecto.setContratistas(null);
        proyecto.setEmpleados(null);
        proyecto.setEstado(new EstadosProyecto(1));
        try {
            proyecto = em.merge(proyecto);
            for(ContratistasProyecto cp:contratistas){
                cp.setProyecto(proyecto);
                em.merge(cp);
            }
            for(EmpleadosProyecto ep:empleados){
                ep.setProyecto(proyecto);
                em.merge(ep);
            }
        } catch (ConstraintViolationException e) {
            throw new LlaveDuplicadaException("El proyecto ya existe");
        }
       
    }
    
    @Override
    public List<Proyecto> findAll(){
        List<Proyecto> proyectos = em.createNamedQuery("Proyecto.findAll").getResultList();
        for(Proyecto p:proyectos){
            p.getEmpleados().size();
            p.getContratistas().size();
        }
        
        return proyectos;
    }

    @Override
    public List<Proyecto> findProyectosContratista(Contratista contratista) {
        List<Proyecto> proyectos = em.createNamedQuery("Proyecto.findProyectosContratista")
                .setParameter("idContratista", contratista.getId()).getResultList();
        for(Proyecto p:proyectos){
            p.getEmpleados().size();
        }
        
        return proyectos;
    }
    
    @Override
    public List<Proyecto> findProyectosActivos(){
        List<Proyecto> proyectos = em.createQuery("SELECT p FROM Proyecto p WHERE p.estado.id = 1").getResultList();
        for(Proyecto p:proyectos){
            p.getEmpleados().size();
        }
        return proyectos;
    }
    
}
