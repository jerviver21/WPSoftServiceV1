/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.usuarios.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Rol;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author root
 */
@Stateless
public class GruposServices extends AbstractFacade<Groups>  implements GruposServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GruposServices() {
        super(Groups.class);
    }

    @Override
    public void remove(Groups group){
        group.setRoles(new ArrayList<Rol>());
        Groups g = em.merge(group);
        em.remove(g);
    }
    
    @Override
    public List<Rol> findRolesByGroup(Groups group){
        group = (Groups)em.find(Groups.class, group.getId());
        group.getRoles().size();
        return group.getRoles();
    }

    @Override
    public List<Groups> findAll(){
        List<Groups> roles = em.createNamedQuery("Groups.findAll").getResultList();
        return roles;
    }
    
    
    @Override
    public List<Groups> findAllE(){
        List<Groups> roles = em.createQuery("SELECT g FROM Groups g WHERE g.id != 16 AND g.id != 17").getResultList();
        return roles;
    }

    @Override
    public Groups findByCodigo(String codigo) {
        List<Groups> grupo = em.createQuery("SELECT g FROM Groups g WHERE g.codigo =:codigo").setParameter("codigo", codigo).getResultList();
        if(grupo.size() > 0){
            return grupo.get(0);
        }
        return null;
    }




 
}
