package com.vbrothers.usuarios.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Resource;
import com.vbrothers.usuarios.dominio.Rol;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class RolesServices extends AbstractFacade<Rol> implements RolesServicesLocal {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RolesServices() {
        super(Rol.class);
    }

    @Override
    public void remove(Rol rol){
        rol.setRecursos(new HashSet<Resource>());
        Rol r = em.merge(rol);
        em.remove(r);
    }


    @Override
    public Set<Resource> findResourceByRol(Rol rol){
        rol = (Rol)em.find(Rol.class, rol.getId());
        rol.getRecursos().size();
        return rol.getRecursos();
    }


    @Override
    public List<Rol> findAll(){
        List<Rol> roles = em.createNamedQuery("Rol.findAll").getResultList();
        return roles;
    }

    @Override
    public Rol findByCodigo(String codigo) {
        Rol rol = null;
        List<Rol> roles = em.createNamedQuery("Rol.findByCodigo").setParameter("codigo", codigo).getResultList();
        if(roles.size() > 0){
            return roles.get(0);
        }
        return rol;
    }

    public List<Groups> findGruposByRol(String rol) {
        List<Groups> grupos = em.createQuery("SELECT g "
                + "FROM Groups g JOIN g.roles r"
                + "WHERE r.codigo =:rol ").setParameter("rol", rol).getResultList();
        return grupos;
    }


    
}
