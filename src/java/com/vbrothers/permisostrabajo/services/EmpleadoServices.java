package com.vbrothers.permisostrabajo.services;

import com.vbrothers.exceptions.EmpActivoOtroContException;
import com.vi.comun.exceptions.LlaveDuplicadaException;
import com.vi.comun.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import com.vi.usuarios.dominio.Groups;
import com.vi.usuarios.dominio.Users;
import com.vi.usuarios.services.GruposServicesLocal;
import com.vi.usuarios.services.UsuariosServicesLocal;
import com.vbrothers.util.FilesUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
 * @author Jerson Viveros
 */
@Stateless
public class EmpleadoServices extends AbstractFacade<Empleado> implements EmpleadoServicesLocal {
    
    //Constantes
    private final String nombreArchCM = "CM";
    private final String nombreArchTA = "TA";

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @EJB
    UsuariosServicesLocal usuarioService;

    @EJB
    GruposServicesLocal grupoService;
    
    @EJB
    TrazabilidadEmpleadosServiceLocal trazService;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EmpleadoServices() {
        super(Empleado.class);
    }
    
    @Override
    public Empleado find(Object id){
        Empleado empleado = getEntityManager().find(Empleado.class, id);
        System.out.println(empleado.getUsuario()+" - "+empleado.getContratista()+" - "+empleado.getCertificados());
        empleado.setPwd(usuarioService.findByUser(empleado.getUsuario()).getPwd());
        return empleado;
    }
    
    @Override
    public Empleado findById(Long numId){
        Empleado empleado = null;
        try {
            empleado = (Empleado)em.createNamedQuery("Empleado.findByNumId")
                .setParameter("numId", numId).getSingleResult();
            System.out.println(""+empleado.getUsuario()+" - "+empleado.getContratista()+" - "+empleado.getCertificados());
            empleado.setPwd(usuarioService.findByUser(empleado.getUsuario()).getPwd());
        } catch (NoResultException e) {
        }
        
        return empleado;
    }
    
    @Override
    public List<Empleado> findAll(){
        List<Empleado> empleados = em.createNamedQuery("Empleado.findAll").getResultList();
        return empleados;
    }

    @Override
    public void guardar(Empleado entity) throws LlaveDuplicadaException, ParametroException, IOException{
        try {
            Users usr = usuarioService.findByUser(entity.getUsuario());
            if(usr  == null){
                usr = new Users();
                String groupParam = locator.getParameter("grupoEmpleado");
                if(groupParam == null){
                    throw  new ParametroException("No existe el parámetro: grupoEmpleado");
                }
                Groups grupo = grupoService.findByCodigo(groupParam);
                if (grupo == null) {
                    throw new ParametroException("El grupo "+groupParam+" no existe, cambie el parámetro");
                }
                 List<Groups> grupoUsr = new ArrayList<Groups>();
                grupoUsr.add(grupo);
                usr.setGrupos(grupoUsr);
            }
            
            usr.setEstado(entity.getActivo()?1:0);
            usr.setNombre(entity.getNombresApellidos());
            usr.setMail(entity.getMail());
            usr.setUsr(entity.getUsuario());
            usr.setPwd(entity.getPwd());
            usuarioService.edit(usr);

            if(entity.getCertMedico() != null){
                entity.setRutaCertCm(cargarCertificado(nombreArchCM+"."+entity.getExtCM(), entity.getNumId(), entity.getCertMedico()));
                entity.setCertificadoMedico(true);
            }
            
            if(entity.getCertTrabAlt() != null){
                entity.setRutaCertTA(cargarCertificado(nombreArchTA+"."+entity.getExtCTA(), entity.getNumId(), entity.getCertTrabAlt()));
                entity.setTrabajoAlturas(true);
            }
            getEntityManager().merge(entity);
        } catch (PersistenceException e) {
            if(e.getCause() instanceof ConstraintViolationException){
                throw new LlaveDuplicadaException("El empleado ya existe para el contratista seleccionado");
            }
            throw e;
        }
    }
    
    public String cargarCertificado(String nombre, long cedula, InputStream input)throws ParametroException, IOException{
        String dirCertificados = locator.getParameter("dirCertificados");
        if(dirCertificados == null){
            throw new ParametroException("El parámetro dirCertificados no existe " );
        }
        return new FilesUtils().crearArchivo(dirCertificados+File.separator+cedula, nombre, input);
    }

    @Override
    public void updateEmpleados(List<Empleado> empleadosContratista) {
        for(Empleado empleado : empleadosContratista){
            //System.out.println("Empleado: "+empleado.getNombresApellidos()+" - "+empleado.getFechaInduccion()+" - "+empleado.getActivo());
            em.merge(empleado);
        }
    }

    

    @Override
    public List<Empleado> findEmpleadosXContratita(Long idContratista) {
        Contratista contratista = null;
        List<Empleado> empleados = null;
        //Convención -1: empleados de planta, -2: todos los empleados
        if(idContratista != -1 && idContratista != -2){
            contratista = new Contratista(idContratista);
            empleados = em.createNamedQuery("Empleado.findByContratist").setParameter("idContratista", contratista).getResultList();
        }else if(idContratista == -1){
            empleados = em.createNamedQuery("Empleado.findPlanta").getResultList();
        }else{
            empleados = em.createNamedQuery("Empleado.findAll").getResultList();
        }
        //System.out.println("--> Cont: "+contratista);
        return empleados;
    }

    @Override
    public List<Empleado> findEmpleadosActivosXContratita(Long idContratista) {
        Contratista contratista = null;
        contratista = new Contratista(idContratista);
        List<Empleado> empleados = em.createNamedQuery("Empleado.findActivesByContratist").setParameter("idContratista", contratista).getResultList();
        return empleados;
    }
    
    @Override
    public List<Empleado> findEmpleadosActivosPlanta() {
        Contratista contratista = null;
        List<Empleado> empleados = em.createNamedQuery("Empleado.findActivesPlanta").getResultList();
        return empleados;
    }

    @Override
    public Empleado findByUser(String usr) {
        return (Empleado)em.createQuery("SELECT e FROM Empleado e WHERE e.usuario =:usr").setParameter("usr", usr).getSingleResult();
    }

    @Override
    public void eliminarCM(Empleado emp) throws Exception {
        FilesUtils.borrarArchivo(emp.getRutaCertCm());
        emp.setRutaCertCm(null);
        emp.setCertificadoMedico(Boolean.FALSE);
        getEntityManager().merge(emp);
    }
    
    @Override
    public void eliminarCA(Empleado emp) throws Exception {
        FilesUtils.borrarArchivo(emp.getRutaCertTA());
        emp.setRutaCertTA(null);
        emp.setTrabajoAlturas(Boolean.FALSE);
        getEntityManager().merge(emp);
    }
    
    //Servicios de activación de empleados
    @Override
    public void activarEmpleado(Empleado emp, String usradm) throws EmpActivoOtroContException {
        if(emp.getActivo()){
            List datos = em.createNamedQuery("Empleado.findEmpleadoActivo").setParameter("numId", emp.getNumId()).getResultList();
            if(datos.size() > 1){
                throw new EmpActivoOtroContException("El empleado se encuentra activo con otro contratista");
            }
        }
        Users usr = usuarioService.findByUser(emp.getUsuario());
        usr.setEstado(emp.getActivo()?1:0);
        em.merge(usr);
        em.merge(emp);
        
        trazService.trazActivarEmpleado(emp, usradm);
    }

    @Override
    public void betarEmpleado(Empleado emp, String usradm) {
        Users usr = usuarioService.findByUser(emp.getUsuario());
        usr.setEstado(0);
        em.merge(usr);
        em.merge(emp);
        
        trazService.trazBetarEmpleado(emp, usradm);
    }

    @Override
    public void cambiarFechaInduccion(Empleado emp, String usradm) {
        em.merge(emp);
        trazService.trazActivarEmpleado(emp, usradm);
    }

    @Override
    public void desactivarEmpleados() {
        List<Empleado> empleados = findAll();
        for(Empleado empleado : empleados){
            em.createNativeQuery("UPDATE users SET estado = 0 WHERE usr = '"+empleado.getUsuario()+"'").executeUpdate();
        }
        em.createNativeQuery("UPDATE empleado SET activo = false").executeUpdate();
    }

   
    
}
