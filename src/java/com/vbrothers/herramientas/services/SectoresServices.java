package com.vbrothers.herramientas.services;



import com.vbrothers.permisostrabajo.dominio.Sector;
import com.vbrothers.permisostrabajo.services.AbstractFacade;
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
