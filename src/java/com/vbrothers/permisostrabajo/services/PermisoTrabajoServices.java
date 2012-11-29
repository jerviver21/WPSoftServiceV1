/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.services.AbstractFacade;
import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.*;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Users;
import com.vbrothers.util.EstadosPermiso;
import com.vbrothers.util.EstadosTraz;
import com.vbrothers.util.FechaUtils;
import java.text.ParseException;
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
 *
 * @author jerviver21
 */
@Stateless
public class PermisoTrabajoServices extends AbstractFacade<PermisoTrabajo>implements PermisoTrabajoServicesLocal {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @EJB
    AdminEstadosPermisosServicesLocal adminEstadosServices;

    @EJB
    ContratistaServicesLocal contratistaServices;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PermisoTrabajoServices() {
        super(PermisoTrabajo.class);
    }

    @Override
    public PermisoTrabajoTO findPermisoTrabajo(Object id){
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
            t.setPeligros(new ArrayList<PeligrosTarea>());
            t.setPermiso(permiso);
            pto.getTareasVista().add(t);
        }
        //-------------------------------------------------------------------------------------------------

        System.out.println("Cantidad sectores afectados :"+permiso.getSectoresAfectados().size()+" - Cantidad peligros: "+permiso.getTareas().size());
        pto.setPermiso(permiso);
        pto.setHoraIni(FechaUtils.getHora(permiso.getHoraIni()));
        pto.setHoraFin(FechaUtils.getHora(permiso.getHoraFin()));
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
    public List<PermisoTrabajo> findAll(){
        List<PermisoTrabajo> tareas = em.createNamedQuery("PermisoTrabajo.findAll").getResultList();
        return tareas;
    }

    @Override
    public PermisoTrabajo guardarPermiso(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
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
    public void crearPermiso(PermisoTrabajoTO pto)throws ParseException, LlaveDuplicadaException{
        PermisoTrabajo permiso = pto.getPermiso();
        if(pto.getHoraIni() != null){
            permiso.setHoraIni(FechaUtils.getTime(pto.getHoraIni()));
            permiso.setHoraFin(FechaUtils.getTime(pto.getHoraFin()));
        }
        permiso.setFechaHoraCreacion(new Date());

        List<Tarea> tareas = permiso.getTareas();

        if(pto.getContratista() != null){
            Contratista cont = contratistaServices.find(pto.getContratista().getId());
            String usr = cont.getUsuario();
            System.out.println("Usuario Contratista: "+usr);
            permiso.setUsuariosEjecutante(usr);
            permiso.setEjecutorContratista(true);
        }

        if(!pto.getEmpleados().isEmpty()){
            for(Empleado emp:pto.getEmpleados()){
                String usr = emp.getUsuario();
                System.out.println("Usuario empleado: "+usr);
                permiso.setUsuariosEjecutante(permiso.getUsuariosEjecutante() == null
                        ? usr : permiso.getUsuariosEjecutante()+";"+usr);
            }
            permiso.setEjecutorContratista(false);
        }
        permiso.setEstadoPermiso(EstadosPermiso.CREADO);
        //permiso.setProyecto(em.find(Proyecto.class, trabajo.getIdProyecto()));
        pto.setPermiso(em.merge(pto.getPermiso()));
        System.out.println("Id nuevo permiso de trabajo: -> "+pto.getPermiso().getId());
        adminEstadosServices.crearPermiso(pto);
    }

    @Override
    public void solicitarAprobacion(PermisoTrabajoTO pto)throws LlaveDuplicadaException{
        pto.getPermiso().setEstadoPermiso(EstadosPermiso.DILIGENCIADO);
        em.merge(pto.getPermiso());
        adminEstadosServices.solicitarAprobacion(pto);
    }

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

    
    
    
    /*public boolean isPermisoAvailable(PermisoTrabajo permiso, Users usr){
        String cond = "t.usuarioOGrupo = '"+usr.getUsr()+"'";
        for(Groups grp : usr.getGrupos()){
            cond = cond + " OR t.usuarioOGrupo = '"+grp.getCodigo()+"'";
        }
        
        List<TrazabilidadPermiso> permisosAsignados = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.estadoTraz =:estado AND t.permisoTrabajo =:permiso AND ("+cond+")")
                .setParameter("estado", EstadosTraz.ASIGNADO).setParameter("permiso", permiso)
                .getResultList();
        if(permisosAsignados.isEmpty()){
            return false;
        }else{
            return true;
        }
    }
    
    public void bloquearPermiso(PermisoTrabajo permiso, Users usr){
        Set<String> datosUsr = new HashSet<String>();
        datosUsr.add(usr.getUsr());
        for(Groups grp : usr.getGrupos()){
            datosUsr.add(grp.getCodigo());
        }
        List<TrazabilidadPermiso> permisosAsignados = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.estadoTraz =:estado AND t.permisoTrabajo =:permiso")
                .setParameter("estado", EstadosTraz.ASIGNADO).setParameter("permiso", permiso)
                .getResultList();
        for(TrazabilidadPermiso tt : permisosAsignados){
            if(!datosUsr.contains(tt.getUsrGrpAsignado())){
                tt.setEstadoTraz(EstadosTraz.BLOQUEADO);
            }
        }
    }

    public void desbloquearPermiso(PermisoTrabajo permiso)throws LlaveDuplicadaException{
        guardarPermiso(permiso);
        adminEstadosServices.desbloquearPermiso(permiso);
    }*/

    
}