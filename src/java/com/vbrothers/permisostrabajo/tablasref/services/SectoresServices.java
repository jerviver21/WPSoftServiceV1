package com.vbrothers.permisostrabajo.tablasref.services;



import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Sector;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class SectoresServices extends AbstractFacade<Sector> implements SectoresServicesLocal {
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SectoresServices() {
        super(Sector.class);
    }


    @Override
    public List<Sector> findAll(){
        List<Sector> Contratistass = em.createNamedQuery("Sector.findAll").getResultList();
        return Contratistass;
    }
 
}
