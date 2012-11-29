package com.vbrothers.usuarios.services;


import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.usuarios.dominio.Menu;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class MenusServices extends AbstractFacade<Menu>  implements MenusServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MenusServices() {
        super(Menu.class);
    }

    @Override
    public List<Menu> findAll(String language){
        List<Menu> menus = em.createNamedQuery("Menu.findAll").getResultList();
        List<Menu> menusIdioma = new ArrayList<Menu>();
        for(Menu menu:menus){
            if(menu.getIdioma() != null &&  menu.getIdioma().equalsIgnoreCase(language)){
                menusIdioma.add(menu);
            }
        }
        return menusIdioma;
    }

    @Override
    public Menu findByNombre(String nombre) {
        List<Menu> menus = em.createQuery("Select m FROM Menu m WHERE m.nombre = :nombre")
                .setParameter("nombre", nombre).getResultList();
        if(!menus.isEmpty()){
            return menus.get(0);
        }
        return null;
    }
 
}
