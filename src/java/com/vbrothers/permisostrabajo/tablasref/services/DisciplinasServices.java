/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.tablasref.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Disciplina;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class DisciplinasServices extends AbstractFacade<Disciplina> implements DisciplinasServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DisciplinasServices() {
        super(Disciplina.class);
    }

    @Override
    public List<Disciplina> findAll(){
        List<Disciplina> Contratistass = em.createNamedQuery("Disciplina.findAll").getResultList();
        return Contratistass;
    }
 
}
