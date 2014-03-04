package com.vbrothers.herramientas.services;

import com.vbrothers.permisostrabajo.dominio.Control;
import com.vbrothers.permisostrabajo.dominio.ControlesPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.Peligro;
import com.vbrothers.permisostrabajo.dominio.PeligrosTarea;
import com.vbrothers.permisostrabajo.dominio.RiesgosPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.Tarea;
import com.vbrothers.permisostrabajo.services.AbstractFacade;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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

    @Override
    public PeligrosTarea findPeligroTarea(Peligro peligro, Tarea tarea) {
        peligro = find(peligro.getId());
        PeligrosTarea pelTarea = new PeligrosTarea();
        pelTarea.setTarea(tarea);
        pelTarea.setPeligro(peligro);
        List<ControlesPeligroTarea> controles = new ArrayList<ControlesPeligroTarea>();
        for(Control c : peligro.getControles()){
            ControlesPeligroTarea cpt = new ControlesPeligroTarea();
            cpt.setControl(c.getNombre());
            cpt.setPeligrosTarea(pelTarea);
            controles.add(cpt);
        }
        pelTarea.setControles(controles);
        pelTarea.setRiesgos(new ArrayList<RiesgosPeligroTarea>());
        return pelTarea;
    }
 
}
