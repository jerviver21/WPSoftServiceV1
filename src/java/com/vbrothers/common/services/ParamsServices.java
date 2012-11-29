
package com.vbrothers.common.services;

import com.vbrothers.common.dominio.Parametro;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Jerson Viveros
 */
@Stateless
public class ParamsServices extends AbstractFacade<Parametro> implements ParamsServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ParamsServices() {
        super(Parametro.class);
    }

    @Override
    public List<Parametro> findAll(){
        List<Parametro> parametros = em.createNamedQuery("Parametro.findAll").getResultList();
        return parametros;
    }
 
}
