
package com.vbrothers.usuarios.services;

import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Resource;
import com.vbrothers.usuarios.dominio.Rol;
import com.vbrothers.usuarios.dominio.Users;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class UsuariosServices extends AbstractFacade<Users> implements UsuariosServicesLocal {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuariosServices() {
        super(Users.class);
    }
    
    @Override
    public void remove(Users user){
        user.setGrupos(new ArrayList<Groups>());
        Users u = em.merge(user);
        em.remove(u);
    }
    
    /*@Override
    public void create(Users entity) throws LlaveDuplicadaException{
        try {
            List<Groups> grupos = entity.getGrupos();
            entity.setGrupos(null);
            getEntityManager().persist(entity);
            entity.setGrupos(grupos);
            getEntityManager().merge(entity);
        } catch (ConstraintViolationException e) {
            throw new LlaveDuplicadaException("El usuario "+entity.getUsr()+" ya existe");
        }
    }*/

    @Override
    public List<Users> findAll(){
        List<Users> usuarios = em.createNamedQuery("Users.findAll").getResultList();
        return usuarios;
    }

    @Override
    public Users findByUser(String usr){
        List<Users> usuarios = em.createQuery("SELECT u FROM Users u WHERE u.usr = '"+usr+"'").getResultList();
        if(usuarios.size() > 0){
            return usuarios.get(0);
        }
        return null;
    }


    @Override
    public List<Users> findByUserFragment(String usr){
        List<Users> usuarios = em.createQuery("SELECT u FROM Users u WHERE u.usr LIKE '%"+usr+"%'").getResultList();
        return usuarios;
    }
    
    @Override
    public List<Groups> findGroupsUser(Users usr){
        usr = (Users)em.find(Users.class, usr.getId());
        usr.getGrupos().size();
        return usr.getGrupos();
    }
    
    @Override
    public Users findFullUser(String usr)throws NoResultException{
        Users usuario = (Users)em.createNamedQuery("Users.findUserByUsr")
                .setParameter("usr", usr).getSingleResult();
        usuario.setRecursosUsr(new TreeSet<Resource>());
        List<Groups> grupos = usuario.getGrupos();
        for(Groups grupo:grupos){
            List<Rol> roles = grupo.getRoles();
            for(Rol rol : roles){
                Set<Resource> recursos = rol.getRecursos();
                for(Resource recurso:recursos){
                    System.out.println(recurso.getNombre()+" - "+recurso.getUrl());
                }
                usuario.getRecursosUsr().addAll(recursos);
            }
        }
        return usuario;
    }
    
}
