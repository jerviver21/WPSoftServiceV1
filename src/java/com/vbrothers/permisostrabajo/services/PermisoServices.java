package com.vbrothers.permisostrabajo.services;
 
import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ValidacionException;
import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.Disciplina;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import com.vbrothers.permisostrabajo.dominio.EstadoPermiso;
import com.vbrothers.permisostrabajo.dominio.PeligrosTarea;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.RiesgosPeligroTarea;
import com.vbrothers.permisostrabajo.dominio.Sector;
import com.vbrothers.permisostrabajo.dominio.Tarea;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Users;
import com.vbrothers.util.EstadosPermiso;
import com.vbrothers.util.EstadosTraz;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class PermisoServices implements PermisoServicesLocal {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @EJB
    AdminEstadosPermisosServicesLocal adminEstadosServices;

    @EJB
    ContratistaServicesLocal contratistaServices;
    
    @EJB
    EmpleadoServicesLocal empleadoServices;
    
    //Servicios generales del permiso de trabajo
    @Override
    public List<PermisoTrabajo> findPermisos(Users user, int estado, Date fechaIni, Date fechaFin) {
        String rolAdmin = ServiceLocator.getInstance().getParameter("rolAdmin") ;
        String rolGerente = ServiceLocator.getInstance().getParameter("rolGerente") ;
        List<PermisoTrabajo> permisos = em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE p.usuarioCreacion =:user "
                + "AND p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion BETWEEN :fechaIni AND :fechaFin ")
                .setParameter("user", user.getUsr())
                .setParameter("estado", estado)
                .setParameter("fechaIni",fechaIni)
                .setParameter("fechaFin", fechaFin)
                .getResultList();
        if(user.getRoles().contains(rolAdmin) || user.getRoles().contains(rolGerente))  {
            permisos = em.createQuery("SELECT p "
                + "FROM PermisoTrabajo p "
                + "WHERE  p.estadoPermiso.id =:estado "
                + "AND p.fechaHoraCreacion BETWEEN :fechaIni AND :fechaFin ")
                .setParameter("estado", estado)
                .setParameter("fechaIni",fechaIni)
                .setParameter("fechaFin", fechaFin)
                .getResultList();
            
        }
        return permisos;
    }
     
    @Override
    public void actualizarPermiso(PermisoTrabajoTO pto){
        PermisoTrabajo permiso = pto.getPermiso();
        pto.setPermiso(em.merge(pto.getPermiso()));
    }
    
    @Override
    public void deletePermiso(PermisoTrabajo pt)throws EstadoException{
        pt.setProyecto(null);
        if(!pt.getEstadoPermiso().equals(EstadosPermiso.CREADO)){
            throw new EstadoException("El permiso se encuentra en un estado en el cual no se puede borrar, cambie estado a SUSPENDIDO");
        }
        em.remove(em.merge(pt));
    }

    @Override
    public void cambiarEstado(PermisoTrabajo pt, int estado) {
        pt.setEstadoAnterior(pt.getEstadoPermiso());
        pt.setEstadoPermiso(em.find(EstadoPermiso.class, estado));
        em.merge(pt);
    }
    
    //Servicios para la creación de permisos de trabajo

    @Override
    public PermisoTrabajoTO findPermisoForCreacion(Object id){
        PermisoTrabajoTO pto = new PermisoTrabajoTO();
        PermisoTrabajo permiso = em.find(PermisoTrabajo.class, id);
        pto.setPermiso(permiso);
        if(permiso.isEjecutorContratista()){
            Contratista cont = contratistaServices.findByUser(permiso.getUsuariosEjecutante());
            pto.setContratista(cont);
        }else{
            String[] usrs = permiso.getUsuariosEjecutante().split(";");
            for(String usr : usrs){
                pto.getEmpleados().add(empleadoServices.findByUser(usr));
            }
        }
        return pto;
    }
    
    @Override
    public List<PermisoTrabajo> findPermisosEnProceso(Users usr) {
        String rolAdmin = ServiceLocator.getInstance().getParameter("rolAdmin") ;
        String rolGerente = ServiceLocator.getInstance().getParameter("rolGerente") ;
        String query = "SELECT p FROM PermisoTrabajo p WHERE p.usuarioCreacion = '"+usr.getUsr()+"' "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId();
        if(usr.getRoles().contains(rolAdmin) || usr.getRoles().contains(rolGerente))  {
            query = "SELECT p FROM PermisoTrabajo p WHERE "
                + " p.estadoPermiso.id != "+EstadosPermiso.CANCELADO.getId()+" "
                + "AND p.estadoPermiso.id != "+EstadosPermiso.SUSPENDIDO.getId();
            
        }
        return em.createQuery(query).getResultList();
    }
    
    @Override
    public void crearPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException, ValidacionException{
        PermisoTrabajo permiso = pto.getPermiso();
        permiso.setFechaHoraCreacion(new Date());
        
        if(permiso.getEquipo().getId() == null || permiso.getEquipo().getId() == 0 ){
            permiso.setEquipo(null);
        }

        if(pto.getContratista() != null){
            permiso.setEjecutorContratista(true);
            Contratista cont = contratistaServices.find(pto.getContratista().getId());
            String usr = cont.getUsuario();
            System.out.println("Usuario Contratista: "+usr);
            permiso.setUsuariosEjecutante(usr);
        }

        if(pto.getContratista() == null){
            permiso.setEjecutorContratista(false);
            if(pto.getEmpleados().isEmpty()){
                throw new ValidacionException("Debe agregar empleados ejecutantes");
            }
            for(Empleado emp:pto.getEmpleados()){
                String usr = emp.getUsuario();
                System.out.println("Usuario empleado: "+usr);
                permiso.setUsuariosEjecutante(permiso.getUsuariosEjecutante() == null
                        ? usr : permiso.getUsuariosEjecutante()+";"+usr);
            }
        }
        permiso.setEstadoPermiso(EstadosPermiso.CREADO);
        permiso.setEstadoAnterior(EstadosPermiso.SUSPENDIDO);
        //permiso.setProyecto(em.find(Proyecto.class, trabajo.getIdProyecto()));
        pto.setPermiso(em.merge(pto.getPermiso()));
        System.out.println("Id nuevo permiso de trabajo: -> "+pto.getPermiso().getId());
        adminEstadosServices.crearPermiso(pto);
    }

    //Servicios para gestion en general del permiso de trabajo
    @Override
    public PermisoTrabajoTO findPermisoForGestion(Object id){
        PermisoTrabajoTO pto = new PermisoTrabajoTO();
        PermisoTrabajo permiso = em.find(PermisoTrabajo.class, id);
        List<Sector> sectoresAfectados = permiso.getSectoresAfectados();
        if(sectoresAfectados == null){
            sectoresAfectados = new ArrayList<Sector>();
            permiso.setSectoresAfectados(sectoresAfectados);
        }
        Disciplina disciplina = permiso.getDisciplina();
        if(disciplina == null){
            disciplina = new Disciplina(-1);
            permiso.setDisciplina(disciplina);
        }
        List<Tarea> tareas = permiso.getTareas();
        if(tareas == null){
            tareas = new ArrayList<Tarea>();
            permiso.setTareas(tareas);
        }

        pto.setTareasVista(new ArrayList<Tarea>());
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
                }
            }
            pto.getTareasVista().add(t);
        }
        
        Collections.sort(pto.getTareasVista());
        
        //Esto se hace por especificación del cliente! Que quiere que por defecto el cuadro tenga 6 tareas. (Trate de encontrar una forma más limpia de hacer esto)
        while(pto.getTareasVista().size() < 6){
            Tarea t = new Tarea();
            t.setConsecutivo(pto.getTareasVista().size()+1);
            t.setPermiso(permiso);
            pto.getTareasVista().add(t);
        }
        //-------------------------------------------------------------------------------------------------

        System.out.println("Cantidad sectores afectados :"+permiso.getSectoresAfectados().size()+" - Cantidad peligros: "+permiso.getTareas().size());
        pto.setPermiso(permiso);
        if(permiso.isEjecutorContratista()){
            Contratista cont = new Contratista();
            //Aqui se llama al service que con el nombre de usuario me trae el contratista
            pto.setContratista(cont);
        }else{
            List<Empleado> empleados = new ArrayList<Empleado>();
            if(permiso.getUsuariosEjecutante() != null){
                String[] usrs = permiso.getUsuariosEjecutante().split(";");
                for(String usr : usrs){
                    //Aqui llamamos al servicio que conecta mis usuarios con mis empleados
                }
            }
            
            pto.setEmpleados(empleados);
        }

        if(permiso.getEstadoPermiso() != null){
            if(permiso.getEstadoPermiso().getId() == EstadosPermiso.CREADO.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO_CALIDAD.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO_SEGURIDAD.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO_JEFE.getId()){
                pto.setEtapa(pto.getSOLICITAR_APROBACION());
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.DILIGENCIADO.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO_CALIDAD.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO_SEGURIDAD.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO_JEFE.getId()){
                pto.setEtapa(pto.getAPROBAR());
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO.getId()){
                pto.setEtapa(pto.getTERMINAR());
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.TERMINADO.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.CANCELADO_CALIDAD.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.CANCELADO_SEGURIDAD.getId()
                    || permiso.getEstadoPermiso().getId() == EstadosPermiso.CANCELADO_JEFE.getId()){
                pto.setEtapa(pto.getCANCELAR());
            }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADA_CANCELACION.getId()){
                pto.setEtapa(pto.getFINALIZAR());
            }

        }
        return pto;
    }
    
    @Override
    public PermisoTrabajo guardarPasos(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        List<Tarea> tareas = new ArrayList<Tarea>();
        Set<Integer> cons = new HashSet<Integer>();//Nos aseguramos de no guardar 2 veces el mismo paso
        for(Tarea t : pto.getTareasVista()){
            if(t.getDatos() != null && !t.getDatos().equalsIgnoreCase("") && !cons.contains(t.getConsecutivo())){
                tareas.add(t);
                cons.add(t.getConsecutivo());
            }
        }
        pto.getPermiso().setTareas(tareas);
        pto.setPermiso(em.merge(pto.getPermiso()));
        return pto.getPermiso();
    }
    
    @Override
    public List<PermisoTrabajo> findPermisosPendientes(Users usr) {
        String cond = "t.usrGrpAsignado = '"+usr.getUsr()+"'";
        for(Groups grp : usr.getGrupos()){
            cond = cond + " OR t.usrGrpAsignado = '"+grp.getCodigo()+"'";
        }
        String sql = "SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.estadoTraz =:estado AND ("+cond+")";


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
        List<TrazabilidadPermiso> trazPermiso = em.createQuery("SELECT t FROM TrazabilidadPermiso t WHERE t.permisoTrabajo =:permiso ORDER by t.fechaHora")
                .setParameter("permiso", permiso).getResultList();
        return trazPermiso;
    }

    
    //Servicios para el diligenciamiento del permiso de trabajo
    @Override
    public void solicitarAprobacion(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        pto.getPermiso().setEstadoPermiso(EstadosPermiso.DILIGENCIADO);
        em.merge(pto.getPermiso());
        adminEstadosServices.solicitarAprobacion(pto);
    }
    
    
    //Servicios para la aprobacion del permiso de trabajo
    @Override
    public void aprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        String CALIDAD = ServiceLocator.getInstance().getParameter("grupoCalidad");
        String SEGURIDAD = ServiceLocator.getInstance().getParameter("grupoSeguridad");
        String AUTORIDAD_AREA = ServiceLocator.getInstance().getParameter("rolAutArea");

        Users usuario = pto.getUsr();
        if(usuario.getGruposUsr().contains(CALIDAD)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.APROBADO_CALIDAD);
            em.merge(pto.getPermiso());
        }else if(usuario.getGruposUsr().contains(SEGURIDAD)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.APROBADO_SEGURIDAD);
            em.merge(pto.getPermiso());
        }else if(usuario.getRoles().contains(AUTORIDAD_AREA)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.APROBADO_JEFE);
            em.merge(pto.getPermiso());
        }
        adminEstadosServices.aprobarPermiso(pto);
    }

    @Override
    public void noAprobarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        String CALIDAD = ServiceLocator.getInstance().getParameter("grupoCalidad");
        String SEGURIDAD = ServiceLocator.getInstance().getParameter("grupoSeguridad");
        String AUTORIDAD_AREA = ServiceLocator.getInstance().getParameter("rolAutArea");

        Users usuario = pto.getUsr();
        if(usuario.getGruposUsr().contains(CALIDAD)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.NO_APROBADO_CALIDAD);
            em.merge(pto.getPermiso());
        }else if(usuario.getGruposUsr().contains(SEGURIDAD)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.NO_APROBADO_SEGURIDAD);
            em.merge(pto.getPermiso());
        }else if(usuario.getRoles().contains(AUTORIDAD_AREA)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.NO_APROBADO_JEFE);
            em.merge(pto.getPermiso());
        }
        adminEstadosServices.noAprobarPermiso(pto);
    }

    
    //Servicios para etapas finales de gestion del permiso
    @Override
    public void terminarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        pto.getPermiso().setEstadoPermiso(EstadosPermiso.TERMINADO);
        em.merge(pto.getPermiso());
        adminEstadosServices.terminarPermiso(pto);
    }

    @Override
    public void cancelarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        String CALIDAD = ServiceLocator.getInstance().getParameter("grupoCalidad");
        String SEGURIDAD = ServiceLocator.getInstance().getParameter("grupoSeguridad");
        String AUTORIDAD_AREA = ServiceLocator.getInstance().getParameter("rolAutArea");

        Users usuario = pto.getUsr();
        if(usuario.getGruposUsr().contains(CALIDAD)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.CANCELADO_CALIDAD);
            em.merge(pto.getPermiso());
        }else if(usuario.getGruposUsr().contains(SEGURIDAD)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.CANCELADO_SEGURIDAD);
            em.merge(pto.getPermiso());
        }else if(usuario.getRoles().contains(AUTORIDAD_AREA)){
            pto.getPermiso().setEstadoPermiso(EstadosPermiso.CANCELADO_JEFE);
            em.merge(pto.getPermiso());
        }
        adminEstadosServices.cancelarPermiso(pto);
    }


    @Override
    public void finalizarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        pto.getPermiso().setEstadoPermiso(EstadosPermiso.CANCELADO);
        em.merge(pto.getPermiso());
        adminEstadosServices.finalizarPermiso(pto);
    }
    
    


}
