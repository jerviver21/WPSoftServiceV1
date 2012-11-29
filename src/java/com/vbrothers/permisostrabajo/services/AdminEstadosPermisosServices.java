
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Users;
import com.vbrothers.util.EstadosPermiso;
import com.vbrothers.util.EstadosTraz;
import com.vbrothers.util.OperacionesPermiso;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class AdminEstadosPermisosServices implements AdminEstadosPermisosServicesLocal {
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    public void crearPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        
        TrazabilidadPermiso traza1 = new TrazabilidadPermiso();
        traza1.setPermisoTrabajo(permiso);
        traza1.setEstadoTraz(EstadosTraz.EJECUTADO);
        traza1.setUsrGrpAsignado(permiso.getUsuarioCreacion());
        traza1.setFechaHora(permiso.getFechaHoraCreacion());
        traza1.setUsuario(usuario.getUsr());
        traza1.setOperacion(OperacionesPermiso.CREAR);
        em.merge(traza1);
        
        System.out.println("Usuario ejecutante: "+permiso.getUsuariosEjecutante());
        String[] usrs = permiso.getUsuariosEjecutante().split(";");
        for(String usr : usrs){
            TrazabilidadPermiso traza2 = new TrazabilidadPermiso();
            traza2.setPermisoTrabajo(permiso);
            traza2.setEstadoTraz(EstadosTraz.ASIGNADO);
            traza2.setUsrGrpAsignado(usr);
            traza2.setFechaHora(permiso.getFechaHoraCreacion());
            traza2.setOperacion(OperacionesPermiso.DILIGENCIAR);
            em.merge(traza2);
        }
        
        
    }

    @Override
    public void solicitarAprobacion(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz = "+EstadosTraz.ASIGNADO.getId()+")")
                .setParameter("permiso", permiso)
                .getResultList();
        
        for(TrazabilidadPermiso traz : trazs){
            if(traz.getUsrGrpAsignado().trim().equalsIgnoreCase(usuario.getUsr().trim()) ||
                    usuario.getGruposUsr().contains(traz.getUsrGrpAsignado().trim())){
                traz.setEstadoTraz(EstadosTraz.EJECUTADO);
                traz.setUsuario(usuario.getUsr());
                traz.setFechaHora(new Date());
            }else{
                traz.setEstadoTraz(EstadosTraz.NO_EJECUTADO);
                traz.setUsuario(usuario.getUsr());
                traz.setFechaHora(new Date());
            }
            em.merge(traz);
        }
        
        TrazabilidadPermiso trazaAutoridadArea = new TrazabilidadPermiso();
        trazaAutoridadArea.setPermisoTrabajo(permiso);
        trazaAutoridadArea.setEstadoTraz(EstadosTraz.ASIGNADO);
        trazaAutoridadArea.setUsrGrpAsignado(permiso.getSector().getGrupo());//El grupo encargado del sector debe aprobar.
        trazaAutoridadArea.setFechaHora(new Date());
        trazaAutoridadArea.setOperacion(OperacionesPermiso.APROBAR);
        em.merge(trazaAutoridadArea);
        
        TrazabilidadPermiso trazaCalidad = new TrazabilidadPermiso();
        trazaCalidad.setPermisoTrabajo(permiso);
        trazaCalidad.setEstadoTraz(EstadosTraz.ASIGNADO);
        trazaCalidad.setUsrGrpAsignado(ServiceLocator.getInstance().getParameter("grupoCalidad"));
        trazaCalidad.setFechaHora(new Date());
        trazaCalidad.setOperacion(OperacionesPermiso.APROBAR);
        em.merge(trazaCalidad);
        
        TrazabilidadPermiso trazaSeguridad = new TrazabilidadPermiso();
        trazaSeguridad.setPermisoTrabajo(permiso);
        trazaSeguridad.setEstadoTraz(EstadosTraz.ASIGNADO);
        trazaSeguridad.setUsrGrpAsignado(ServiceLocator.getInstance().getParameter("grupoSeguridad"));
        trazaSeguridad.setFechaHora(new Date());
        trazaSeguridad.setOperacion(OperacionesPermiso.APROBAR);
        em.merge(trazaSeguridad);
    }
    
    
    
    

    @Override
    public void aprobarPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        String notaAprobacion = pto.getNota();
        if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO_CALIDAD.getId()){
            List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.usrGrpAsignado = '"+ServiceLocator.getInstance().getParameter("grupoCalidad")+"' "
                    + "AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
            TrazabilidadPermiso traz = trazs.get(0);
            traz.setEstadoTraz(EstadosTraz.EJECUTADO);
            traz.setFechaHora(new Date());
            traz.setUsuario(usuario.getUsr());
            traz.setNota(notaAprobacion);
            em.merge(traz);
        }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO_SEGURIDAD.getId()){
            List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.usrGrpAsignado = '"+ServiceLocator.getInstance().getParameter("grupoSeguridad")+"' "
                    + "AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
            TrazabilidadPermiso traz = trazs.get(0);
            traz.setEstadoTraz(EstadosTraz.EJECUTADO);
            traz.setFechaHora(new Date());
            traz.setUsuario(usuario.getUsr());
            traz.setNota(notaAprobacion);
            em.merge(traz);
        }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.APROBADO_JEFE.getId()){
            List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.usrGrpAsignado = '"+permiso.getSector().getGrupo()+"' "
                    + "AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
            TrazabilidadPermiso traz = trazs.get(0);
            traz.setEstadoTraz(EstadosTraz.EJECUTADO);
            traz.setFechaHora(new Date());
            traz.setUsuario(usuario.getUsr());
            traz.setNota(notaAprobacion);
            em.merge(traz);
        }

        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();

        if(trazs.isEmpty()){
            System.out.println("Usuario ejecutante: "+permiso.getUsuariosEjecutante());
            String[] usrs = permiso.getUsuariosEjecutante().split(";");
            for(String usr : usrs){
                TrazabilidadPermiso traza = new TrazabilidadPermiso();
                traza.setPermisoTrabajo(permiso);
                traza.setEstadoTraz(EstadosTraz.ASIGNADO);
                traza.setUsrGrpAsignado(usr);
                traza.setFechaHora(new Date());
                traza.setOperacion(OperacionesPermiso.TERMINAR);
                em.merge(traza);
            }
            permiso.setEstadoPermiso(EstadosPermiso.APROBADO);
            em.merge(permiso);
        }

      
    }

    @Override
    public void noAprobarPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        String notaDesaprobacion = pto.getNota();
        TrazabilidadPermiso traz = new TrazabilidadPermiso();
        traz.setEstadoTraz(EstadosTraz.EJECUTADO);
        traz.setFechaHora(new Date());
        traz.setUsuario(usuario.getUsr());
        traz.setNota(notaDesaprobacion);
        traz.setOperacion(OperacionesPermiso.NO_APROBAR);
        traz.setPermisoTrabajo(permiso);
        if(permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO_CALIDAD.getId()){
            traz.setUsrGrpAsignado(ServiceLocator.getInstance().getParameter("grupoCalidad"));
        }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO_SEGURIDAD.getId()){
            traz.setUsrGrpAsignado(ServiceLocator.getInstance().getParameter("grupoSeguridad"));
        }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.NO_APROBADO_JEFE.getId()){
            traz.setUsrGrpAsignado(permiso.getSector().getGrupo());
        }
        em.merge(traz);

        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
        for(TrazabilidadPermiso traza : trazs){
            traza.setEstadoTraz(EstadosTraz.NO_EJECUTADO);
            em.merge(traza);
        }

        System.out.println("Usuario ejecutante: "+permiso.getUsuariosEjecutante());
        String[] usrs = permiso.getUsuariosEjecutante().split(";");
        for(String usr : usrs){
            TrazabilidadPermiso traza = new TrazabilidadPermiso();
            traza.setPermisoTrabajo(permiso);
            traza.setEstadoTraz(EstadosTraz.ASIGNADO);
            traza.setUsrGrpAsignado(usr);
            traza.setFechaHora(new Date());
            traza.setOperacion(OperacionesPermiso.DILIGENCIAR);
            em.merge(traza);
        }

    }

    @Override
    public void terminarPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        String nota = pto.getNota();
        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz = "+EstadosTraz.ASIGNADO.getId()+")")
                .setParameter("permiso", permiso)
                .getResultList();

        for(TrazabilidadPermiso traz : trazs){
            if(traz.getUsrGrpAsignado().trim().equalsIgnoreCase(usuario.getUsr()) ||
                    usuario.getGruposUsr().contains(traz.getUsrGrpAsignado().trim())){
                traz.setEstadoTraz(EstadosTraz.EJECUTADO);
                traz.setUsuario(usuario.getUsr());
                traz.setFechaHora(new Date());
                traz.setNota(nota);
            }else{
                traz.setEstadoTraz(EstadosTraz.NO_EJECUTADO);
                traz.setUsuario(usuario.getUsr());
                traz.setFechaHora(new Date());
            }
            em.merge(traz);
        }

        TrazabilidadPermiso trazaAutoridadArea = new TrazabilidadPermiso();
        trazaAutoridadArea.setPermisoTrabajo(permiso);
        trazaAutoridadArea.setEstadoTraz(EstadosTraz.ASIGNADO);
        trazaAutoridadArea.setUsrGrpAsignado(permiso.getSector().getGrupo());//El grupo encargado del sector debe aprobar.
        trazaAutoridadArea.setFechaHora(new Date());
        trazaAutoridadArea.setOperacion(OperacionesPermiso.CANCELAR);
        em.merge(trazaAutoridadArea);

        TrazabilidadPermiso trazaCalidad = new TrazabilidadPermiso();
        trazaCalidad.setPermisoTrabajo(permiso);
        trazaCalidad.setEstadoTraz(EstadosTraz.ASIGNADO);
        trazaCalidad.setUsrGrpAsignado(ServiceLocator.getInstance().getParameter("grupoCalidad"));
        trazaCalidad.setFechaHora(new Date());
        trazaCalidad.setOperacion(OperacionesPermiso.CANCELAR);
        em.merge(trazaCalidad);

        TrazabilidadPermiso trazaSeguridad = new TrazabilidadPermiso();
        trazaSeguridad.setPermisoTrabajo(permiso);
        trazaSeguridad.setEstadoTraz(EstadosTraz.ASIGNADO);
        trazaSeguridad.setUsrGrpAsignado(ServiceLocator.getInstance().getParameter("grupoSeguridad"));
        trazaSeguridad.setFechaHora(new Date());
        trazaSeguridad.setOperacion(OperacionesPermiso.CANCELAR);
        em.merge(trazaSeguridad);
    }

    @Override
    public void cancelarPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        String nota = pto.getNota();
        if(permiso.getEstadoPermiso().getId() == EstadosPermiso.CANCELADO_CALIDAD.getId()){
            List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.usrGrpAsignado = '"+ServiceLocator.getInstance().getParameter("grupoCalidad")+"' "
                    + "AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
            TrazabilidadPermiso traz = trazs.get(0);
            traz.setEstadoTraz(EstadosTraz.EJECUTADO);
            traz.setFechaHora(new Date());
            traz.setUsuario(usuario.getUsr());
            traz.setNota(nota);
            em.merge(traz);
        }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.CANCELADO_SEGURIDAD.getId()){
            List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.usrGrpAsignado = '"+ServiceLocator.getInstance().getParameter("grupoSeguridad")+"' "
                    + "AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
            TrazabilidadPermiso traz = trazs.get(0);
            traz.setEstadoTraz(EstadosTraz.EJECUTADO);
            traz.setFechaHora(new Date());
            traz.setUsuario(usuario.getUsr());
            traz.setNota(nota);
            em.merge(traz);
        }else if(permiso.getEstadoPermiso().getId() == EstadosPermiso.CANCELADO_JEFE.getId()){
            List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.usrGrpAsignado = '"+permiso.getSector().getGrupo()+"' "
                    + "AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();
            TrazabilidadPermiso traz = trazs.get(0);
            traz.setEstadoTraz(EstadosTraz.EJECUTADO);
            traz.setFechaHora(new Date());
            traz.setUsuario(usuario.getUsr());
            traz.setNota(nota);
            em.merge(traz);
        }

        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", permiso)
                    .getResultList();

        if(trazs.isEmpty()){
            TrazabilidadPermiso traza = new TrazabilidadPermiso();
            traza.setPermisoTrabajo(permiso);
            traza.setEstadoTraz(EstadosTraz.ASIGNADO);
            traza.setUsrGrpAsignado(permiso.getUsuarioCreacion());
            traza.setFechaHora(new Date());
            traza.setOperacion(OperacionesPermiso.CANCELAR);
            em.merge(traza);
            permiso.setEstadoPermiso(EstadosPermiso.APROBADA_CANCELACION);
            em.merge(permiso);
        }
    }
    
    @Override
    public void finalizarPermiso(PermisoTrabajoTO pto){
        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz.id = "+EstadosTraz.ASIGNADO.getId())
                    .setParameter("permiso", pto.getPermiso())
                    .getResultList();
        TrazabilidadPermiso traz = trazs.get(0);
        traz.setEstadoTraz(EstadosTraz.EJECUTADO);
        traz.setFechaHora(new Date());
        traz.setUsuario(pto.getPermiso().getUsuarioCreacion());
        traz.setNota(pto.getNota());
        em.merge(traz);
        
    }



    
    /*@Override
    public void desbloquearPermiso(PermisoTrabajo permiso) {
        em.createNativeQuery("UPDATE trazabilidad_permiso SET id_estado_trazabilidad = "
                +EstadosTraz.ASIGNADO.getId()+" WHERE id_permiso = "+permiso.getId()+" AND id_estado_trazabilidad = "
                +EstadosTraz.BLOQUEADO.getId()).executeUpdate();

    }*/
    
    
    
}
