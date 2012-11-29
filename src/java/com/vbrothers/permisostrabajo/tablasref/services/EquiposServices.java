/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.tablasref.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Equipo;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class EquiposServices extends AbstractFacade<Equipo> implements EquiposServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EquiposServices() {
        super(Equipo.class);
    }

    @Override
    public List<Equipo> findAll(){
        List<Equipo> Contratistass = em.createNamedQuery("Equipo.findAll").getResultList();
        return Contratistass;
    }
 
}
