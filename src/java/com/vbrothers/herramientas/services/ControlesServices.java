package com.vbrothers.herramientas.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Control;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class ControlesServices extends AbstractFacade<Control>  implements ControlesServicesLocal {
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ControlesServices() {
        super(Control.class);
    }

    @Override
    public List<Control> findAll(){
        List<Control> Contratistass = em.createNamedQuery("Control.findAll").getResultList();
        return Contratistass;
    }
 
}
