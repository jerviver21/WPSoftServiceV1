
package com.vbrothers.usuarios.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Resource;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class ResourcesServices extends AbstractFacade<Resource>  implements ResourcesServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResourcesServices() {
        super(Resource.class);
    }

    @Override
    public List<Resource> findAll(String language){
        List<Resource> recursos = em.createNamedQuery("Resource.findAll").getResultList();
        List<Resource> recursosIdioma = new ArrayList<Resource>();

        for(Resource recurso : recursos){
            if(recurso.getIdioma() != null && recurso.getIdioma().equalsIgnoreCase(language)){
                recursosIdioma.add(recurso);
            }
        }


        return recursosIdioma;
    }

    @Override
    public Resource findByUrl(String url) {
        Resource resource = null;
        List<Resource> recursos = em.createNamedQuery("Resource.findByUrl").setParameter("url", url).getResultList();
        if(recursos.size() > 0){
            return recursos.get(0);
        }
        return resource;
    }

 
}
