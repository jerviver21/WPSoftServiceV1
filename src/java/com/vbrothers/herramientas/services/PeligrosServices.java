package com.vbrothers.herramientas.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Control;
import com.vbrothers.permisostrabajo.dominio.Peligro;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.hibernate.exception.ConstraintViolationException;

/**
 * @author Jerson Viveros Aguirre
 */
@Stateless
public class PeligrosServices extends AbstractFacade<Peligro>  implements PeligrosServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PeligrosServices() {
        super(Peligro.class);
    }


    @Override
    public List<Peligro> findAll(){
        List<Peligro> Contratistass = em.createNamedQuery("Peligro.findAll").getResultList();
        return Contratistass;
    }

    @Override
    public List<Control> findControlsByRiesgo(Peligro riesgo){
        List<Control> controles = em.createQuery("Select c FROM Control c WHERE c.riesgo =:riesgo").setParameter("riesgo", riesgo).getResultList();
        return controles;
    }
 
}
