package com.vbrothers.permisostrabajo.services;
 
import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.common.exceptions.ValidacionException;
import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.CertificadosTrabajo;
import com.vbrothers.permisostrabajo.dominio.ControlesPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.Disciplina;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import com.vbrothers.permisostrabajo.dominio.EstadoPermiso;
import com.vbrothers.permisostrabajo.dominio.NotasPermiso;
import com.vbrothers.permisostrabajo.dominio.PeligrosTarea;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.RiesgosPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.Sector;
import com.vbrothers.permisostrabajo.dominio.Tarea;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Users;
import com.vbrothers.usuarios.services.GruposServicesLocal;
import com.vbrothers.usuarios.services.UsuariosServicesLocal;
import com.vbrothers.util.EstadosPermiso;
import com.vbrothers.util.EstadosTraz;
import com.vbrothers.util.EtapaPermiso;
import com.vbrothers.util.OperacionesPermiso;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class PermisoServices implements PermisoServicesLocal {
    
    ServiceLocator locator;

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @EJB
    AdminEstadosPermisosServicesLocal adminEstadosServices;

    @EJB
    ContratistaServicesLocal contratistaServices;
    
    @EJB
    EmpleadoServicesLocal empleadoServices;
    
    @EJB
    GruposServicesLocal gruposServices;
    
    @EJB
    UsuariosServicesLocal usersServices;
    
    
    public PermisoServices(){
        locator = ServiceLocator.getInstance();
    }
    
    //Servicios generales del permiso de trabajo
    @Override
    public void cambiarEstado(PermisoTrabajo pt, int estado) {
        pt.setEstadoAnterior(pt.getEstadoPermiso());
        pt.setEstadoPermiso(em.find(EstadoPermiso.class, estado));
        em.merge(pt);
    }
    
    @Override
    public PermisoTrabajo actualizarPermiso(PermisoTrabajo pto){
        return em.merge(pto);
    }
    
    //Servicios para la creación de permisos de trabajo
    @Override
    public List<PermisoTrabajo> findPermisos(Users user, int estado, Date fechaIni, Date fechaFin) {
        String rolAdmin = locator.getParameter("rolAdmin") ;
        String rolGerente = locator.getParameter("rolGerente") ;
        Calendar calIni = Calendar.getInstance();
        Calendar calFin = Calendar.getInstance();
        calIni.setTime(fechaIni);
        calFin.setTime(fechaFin);
        calIni.set(Calendar.HOUR_OF_DAY, 0);
        calFin.set(Calendar.HOUR_OF_DAY, 23);
        List<PermisoTrabajo> permisos = em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE p.usuarioCreacion =:user "
                + "AND p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion >= :fechaIni AND p.fechaHoraCreacion <=  :fechaFin ")
                .setParameter("user", user.getUsr())
                .setParameter("estado", estado)
                .setParameter("fechaIni",calIni.getTime())
                .setParameter("fechaFin",calFin.getTime())
                .getResultList();
        if(user.getRolesUsr().contains(rolAdmin) || user.getRolesUsr().contains(rolGerente))  {
            permisos = em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE  p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion >= :fechaIni AND p.fechaHoraCreacion <= :fechaFin ")
                .setParameter("estado", estado)
                .setParameter("fechaIni",calIni.getTime())
                .setParameter("fechaFin",calFin.getTime())
                .getResultList();
            
        }
        return permisos;
    }

    @Override
    public PermisoTrabajo findPermisoForCreacion(Object id){
        PermisoTrabajo permiso = em.find(PermisoTrabajo.class, id);

        List<NotasPermiso> notas = permiso.getNotas();
        if(notas == null){
            notas = new ArrayList<NotasPermiso>();
            permiso.setNotas(notas);
        }
        List<Empleado> empleados = permiso.getEmpleados();
        if(empleados == null){
            empleados = new ArrayList<Empleado>();
            permiso.setEmpleados(empleados);
        }
        
        permiso.getNotas().size();
        permiso.getEmpleados().size();
        
        return permiso;
    }
    
    @Override
    public List<PermisoTrabajo> findPermisosEnProceso(Users usr) {
        String rolAdmin = locator.getParameter("rolAdmin") ;
        String rolGerente = locator.getParameter("rolGerente") ;
        String query = "SELECT p FROM PermisoTrabajo p WHERE p.usuarioCreacion = '"+usr.getUsr()+"' "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId();
        if(usr.getRolesUsr().contains(rolAdmin) || usr.getRolesUsr().contains(rolGerente))  {
            query = "SELECT p FROM PermisoTrabajo p WHERE "
                + " p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId();
            
        }
        return em.createQuery(query).getResultList();
    }
    
    @Override
    public void crearPermiso(PermisoTrabajo permiso)throws LlaveDuplicadaException, ValidacionException{
        permiso.setFechaHoraCreacion(new Date());
        permiso.setUsuarioCreacion(permiso.getUsuario().getUsr());
        
        if(permiso.getEquipo().getId() == null || permiso.getEquipo().getId() == 0 ){
            permiso.setEquipo(null);
        }

        permiso.setEjecutorContratista(false);
        if(permiso.getContratista() != null){
            permiso.setEjecutorContratista(true);
            permiso.setContratista(contratistaServices.find(permiso.getContratista().getId()));
            List<Empleado> empleadosContratista = empleadoServices.findEmpleadosXContratita(permiso.getContratista().getId());
            permiso.getEmpleados().addAll(empleadosContratista);
        }
        
        if(permiso.getEmpleados().isEmpty()){
            throw new ValidacionException("Debe agregar empleados ejecutantes");
        }
        permiso.setEstadoPermiso(EstadosPermiso.CREADO);
        permiso.setEstadoAnterior(EstadosPermiso.SUSPENDIDO);

        permiso.setId(em.merge(permiso).getId());
        System.out.println("Id nuevo permiso de trabajo: -> "+permiso.getId()+" - Usr: "+permiso.getUsuario());
        adminEstadosServices.crearPermiso(permiso);
    }
    
    @Override
    public void deletePermiso(PermisoTrabajo pt)throws EstadoException{
        pt.setProyecto(null);
        if(!pt.getEstadoPermiso().equals(EstadosPermiso.CREADO)){
            throw new EstadoException("El permiso se encuentra en un estado en el cual no se puede borrar, cambie estado a SUSPENDIDO");
        }
        em.remove(em.merge(pt));
    }

    //Servicios para gestion en general del permiso de trabajo
    @Override
    public PermisoTrabajo findPermisoForGestion(Object id){
        PermisoTrabajo permiso = em.find(PermisoTrabajo.class, id);
        List<Sector> sectoresAfectados = permiso.getSectoresAfectados();
        if(sectoresAfectados == null){
            sectoresAfectados = new ArrayList<Sector>();
            permiso.setSectoresAfectados(sectoresAfectados);
        }
        List<CertificadosTrabajo> certificados = permiso.getCertificados();
        if(certificados == null){
            certificados = new ArrayList<CertificadosTrabajo>();
            permiso.setCertificados(certificados);
        }
        Disciplina disciplina = permiso.getDisciplina();
        if(disciplina == null){
            disciplina = new Disciplina(-1);
            permiso.setDisciplina(disciplina);
        }
        
        List<NotasPermiso> notas = permiso.getNotas();
        if(notas == null){
            notas = new ArrayList<NotasPermiso>();
            permiso.setNotas(notas);
        }
        
        List<Empleado> empleados = permiso.getEmpleados();
        if(empleados == null){
            empleados = new ArrayList<Empleado>();
            permiso.setEmpleados(empleados);
        }
        
        permiso.setOtrosAprobadores(new ArrayList<String>());
        
        List<Tarea> tareas = permiso.getTareas();
        if(tareas == null){
            tareas = new ArrayList<Tarea>();
            permiso.setTareas(tareas);
        }

        for(Tarea t : tareas){
            List<PeligrosTarea> pst = t.getPeligros();
            if(pst == null){
                t.setPeligros(new ArrayList<PeligrosTarea>());
            }else {
                for(PeligrosTarea pt : pst){
                    List<RiesgosPeligroTarea> rspt = pt.getRiesgos();
                    for(RiesgosPeligroTarea rpt : rspt){
                        rpt.getNombre();
                    }
                    List<ControlesPeligroTarea> ctrpt = pt.getControles();
                    for(ControlesPeligroTarea cpr : ctrpt){
                        cpr.getControl();
                    }
                }
            }
        }
        Collections.sort(permiso.getTareas());
        System.out.println("Cantidad sectores afectados :"+permiso.getSectoresAfectados().size()
                +" - Cantidad peligros: "+permiso.getTareas().size()+" - Certificados: "
                +permiso.getCertificados().size()+" - Notas: "+permiso.getNotas()+" - Empleados: "
                +permiso.getEmpleados().size());

        if(permiso.getEstadoPermiso() != null){
            if(permiso.getEstadoPermiso().getId() == EstadosPermiso.CREADO.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO.getId()){
                permiso.setEtapa(EtapaPermiso.DILIGENCIAR);
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.DILIGENCIADO.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.PREAPROBADO.getId()){
                permiso.setEtapa(EtapaPermiso.APROBAR);
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO.getId()){
                permiso.setEtapa(EtapaPermiso.TERMINAR);
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.TERMINADO.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.PRECANCELADO.getId()){
                permiso.setEtapa(EtapaPermiso.CANCELAR);
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADA_CANCELACION.getId()){
                permiso.setEtapa(EtapaPermiso.FINALIZAR);
            }
        }
        return permiso;
    }
    
    @Override
    public void guardarGestion(PermisoTrabajo permiso)throws LlaveDuplicadaException{
        PermisoTrabajo pta = actualizarPermiso(permiso);
        permiso.setTareas(pta.getTareas());
        for(Tarea t : permiso.getTareas()){
            List<PeligrosTarea> pst = t.getPeligros();
            for(PeligrosTarea pt : pst){
                List<RiesgosPeligroTarea> rspt = pt.getRiesgos();
                for(RiesgosPeligroTarea rpt : rspt){
                    rpt.getNombre();
                }
                List<ControlesPeligroTarea> ctrpt = pt.getControles();
                for(ControlesPeligroTarea cpr : ctrpt){
                    cpr.getControl();
                }
            }
        }
    }
    
    @Override
    public List<PermisoTrabajo> findPermisosPendientes(Users usr) {
        String cond = "t.usrGrpAsignado = '"+usr.getUsr()+"'";
        for(Groups grp : usr.getGrupos()){
            cond = cond + " OR t.usrGrpAsignado = '"+grp.getCodigo()+"'";
        }
        String sql = "SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.estadoTraz =:estado "+ (usr.getRolesUsr().contains(locator.getParameter("rolValidador")) ?"":" AND ("+cond+")");

        List<TrazabilidadPermiso> permisosAsignados = em.createQuery(sql)
                .setParameter("estado", EstadosTraz.ASIGNADO).getResultList();
        System.out.println(sql);
        List<PermisoTrabajo> permisos = new ArrayList<PermisoTrabajo>();
        for(TrazabilidadPermiso tt : permisosAsignados){
            PermisoTrabajo permiso = tt.getPermisoTrabajo();
            permiso.getEstadoPermiso();
            permisos.add(permiso);
        }

        return permisos;
    }
    
    @Override
    public List<TrazabilidadPermiso> findTrazabilidadPermiso(PermisoTrabajo permiso){
        List<TrazabilidadPermiso> trazPermiso = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz != :traz ORDER by t.fechaHora")
                .setParameter("permiso", permiso)
                .setParameter("traz", EstadosTraz.NO_EJECUTADO).getResultList();
        return trazPermiso;
    }
    
    @Override
    public void borrarTarea(Tarea tarea){
        em.remove(em.merge(tarea));
    }
    
    @Override
    public void borrarPeligro(PeligrosTarea pt){
        em.remove(em.merge(pt));
    }
    
    @Override
    public void borrarRiesgo(RiesgosPeligroTarea rpt){
        em.remove(em.merge(rpt));
    }
    
    @Override
    public void borrarControl(ControlesPeligroTarea ctr){
        em.remove(em.merge(ctr));
    }
    
    @Override
    public void borrarNota(NotasPermiso nota) {
        em.remove(em.merge(nota));
    }

    
    //Servicios para el diligenciamiento del permiso de trabajo
    @Override
    public void solicitarAprobacion(PermisoTrabajo pto)throws LlaveDuplicadaException, ParametroException{
        pto.setEstadoPermiso(EstadosPermiso.DILIGENCIADO);
        actualizarPermiso(pto);
        adminEstadosServices.solicitarAprobacion(pto);
    }
    
    
    //Servicios para la aprobacion del permiso de trabajo
    @Override
    public void aprobarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException{
        for(String usr:pto.getOtrosAprobadores()){
            adminEstadosServices.agregarAprobador(pto, usr);
        }
        pto.setEstadoPermiso(EstadosPermiso.PREAPROBADO);
        em.merge(pto);
        adminEstadosServices.aprobarPermiso(pto);
    }

    @Override
    public void noAprobarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException{
        for(String usr:pto.getOtrosAprobadores()){
            adminEstadosServices.agregarAprobador(pto, usr);
        }
        pto.setEstadoPermiso(EstadosPermiso.NO_APROBADO);
        em.merge(pto);
        adminEstadosServices.noAprobarPermiso(pto);
    }
    
    @Override
    public List<Users> findUsersAprobadores(PermisoTrabajo pto) {
        List<Users> users = em.createQuery("SELECT u "
                + "FROM Users u JOIN u.grupos g JOIN g.roles r "
                + "WHERE r.codigo = '"+locator.getParameter("rolAprobador") +"' AND u.usr NOT IN (SELECT t.usrGrpAsignado "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso "
                + "AND t.operacion =:operacion)")
                .setParameter("permiso", pto)
                .setParameter("operacion", OperacionesPermiso.APROBAR).getResultList();        
        return users;
    }

    @Override
    public List<Groups> findGruposAprobadores(PermisoTrabajo pto) {
        List<Groups> groups = em.createQuery("SELECT g "
                + "FROM Groups g JOIN g.roles r "
                + "WHERE r.codigo = '"+locator.getParameter("rolAprobador") +"' AND g.codigo NOT IN (SELECT t.usrGrpAsignado "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso "
                + "AND t.operacion =:operacion)")
                .setParameter("permiso", pto)
                .setParameter("operacion", OperacionesPermiso.APROBAR).getResultList();   
        return groups;
    }

    
    //Servicios para etapas finales de gestion del permiso
    @Override
    public void terminarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException, ParametroException{
        pto.setEstadoPermiso(EstadosPermiso.TERMINADO);
        em.merge(pto);
        adminEstadosServices.terminarPermiso(pto);
    }

    @Override
    public void cancelarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException{
        pto.setEstadoPermiso(EstadosPermiso.PRECANCELADO);
        em.merge(pto);
        adminEstadosServices.cancelarPermiso(pto);
    }


    @Override
    public void finalizarPermiso(PermisoTrabajo pto)throws LlaveDuplicadaException{
        pto.setEstadoPermiso(EstadosPermiso.TERMINADO);
        em.merge(pto);
        adminEstadosServices.finalizarPermiso(pto);
    }

    

    
    
    


}
