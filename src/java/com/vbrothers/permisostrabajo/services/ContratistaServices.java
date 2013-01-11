/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Users;
import com.vbrothers.usuarios.services.GruposServicesLocal;
import com.vbrothers.usuarios.services.UsuariosServicesLocal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author jerviver21
 */
@Stateless
public class ContratistaServices extends AbstractFacade<Contratista>implements ContratistaServicesLocal {
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @EJB
    UsuariosServicesLocal usuarioService;

    @EJB
    GruposServicesLocal grupoService;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContratistaServices() {
        super(Contratista.class);
    }
    
    @Override
    public List<Contratista> findAll(){
        List<Contratista> Contratistass = em.createNamedQuery("Contratista.findAll").getResultList();
        return Contratistass;
    }
    
    @Override
    public List<Contratista> findContratistasActivos(){
        List<Contratista> Contratistass = em.createQuery("SELECT c FROM Contratista c WHERE c.activo = true").getResultList();
        return Contratistass;
    }
    
    

    @Override
    public Contratista find(Object id) {
        Contratista contratista = getEntityManager().find(Contratista.class, id);
        System.out.println(contratista.getUsuario()+" - "+contratista.getEmpleados().size());
        contratista.setPwd(usuarioService.findByUser(contratista.getUsuario()).getPwd());
        return contratista;
    }
    
    @Override
    public Contratista findById(Long numId){
        Contratista contratista = null;
        try {
            contratista = (Contratista)em.createNamedQuery("Contratista.findByNumId")
                .setParameter("numId", numId).getSingleResult();
            System.out.println(contratista.getUsuario()+" - "+contratista.getEmpleados().size());
            contratista.setPwd(usuarioService.findByUser(contratista.getUsuario()).getPwd());
        } catch (NoResultException e) {
        }
        
        return contratista;
    }

    @Override
    public void guardar(Contratista entity) throws LlaveDuplicadaException, ParametroException{
        try {
            Users usr;
            if(entity.getId() == null || entity.getId() == 0){
                usr = new Users();
                String groupParam = locator.getParameter("grupoContratista");
                if(groupParam == null){
                    throw  new ParametroException("No existe el parámetro: grupoContratista");
                }
                Groups grupo = grupoService.findByCodigo(groupParam);
                if (grupo == null) {
                    throw new ParametroException("El grupo "+groupParam+" no existe, cambie el parámetro");
                }
                List<Groups> grupoUsr = new ArrayList<Groups>();
                grupoUsr.add(grupo);
                usr.setGrupos(grupoUsr);
            }else{
                usr = usuarioService.findByUser(entity.getUsuario());
            }
            
            usr.setEstado(entity.getActivo()?1:0);
            usr.setNombre(entity.getNombre());
            usr.setMail(entity.getMail());
            usr.setUsr(entity.getUsuario());
            usr.setPwd(entity.getPwd());
            usuarioService.edit(usr);
            
            getEntityManager().merge(entity);
        } catch (PersistenceException e) {
            if(e.getCause() instanceof ConstraintViolationException){
                throw new LlaveDuplicadaException("El contratista o usuario asociado ya existe");
            }
            throw e;
        }
    }

    

    @Override
    public Contratista findByUser(String usr) {
        List<Contratista> contratista = em.createNamedQuery("Contratista.findByUser").setParameter("usr", usr).getResultList();
        if(contratista.size() > 0){
            return contratista.get(0);
        }
        //contratista.getUsuario().getId();
        return null;
    }

    
    
}
