package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.permisostrabajo.dominio.PermisoTrabajo;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso;
import com.vbrothers.permisostrabajo.to.PermisoTrabajoTO;
import com.vbrothers.usuarios.dominio.Groups;
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
    ServiceLocator locator;
    
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    public AdminEstadosPermisosServices(){
        locator = ServiceLocator.getInstance();
    }

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
    public void solicitarAprobacion(PermisoTrabajoTO pto) throws ParametroException{
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz =:estado AND t.operacion =:operacion ")
                .setParameter("permiso", permiso)
                .setParameter("estado", EstadosTraz.ASIGNADO)
                .setParameter("operacion", OperacionesPermiso.DILIGENCIAR)
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
        
        trazs = em.createQuery("SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.permisoTrabajo =:permiso AND t.estadoTraz =:estado AND t.operacion =:operacion ")
                .setParameter("permiso", permiso)
                .setParameter("estado", EstadosTraz.NO_EJECUTADO)
                .setParameter("operacion", OperacionesPermiso.APROBAR)
                .getResultList();
        if(trazs.isEmpty()){
            String paramAprobDefecto = locator.getParameter("aprueba_defecto");
            if(paramAprobDefecto == null){
                throw new ParametroException("No existe el parámetro aprueba_defecto");
            }
            String[] gruposAprobacion = paramAprobDefecto.split(","); 
            for(String grupo: gruposAprobacion){
                if(grupo.equals("SECTOR")){
                    grupo = permiso.getSector().getGrupo();
                }else{
                    grupo = locator.getParameter(grupo) != null ? locator.getParameter(grupo) : grupo;
                }
                TrazabilidadPermiso traza = new TrazabilidadPermiso();
                traza.setPermisoTrabajo(permiso);
                traza.setEstadoTraz(EstadosTraz.ASIGNADO);
                traza.setUsrGrpAsignado(grupo);
                traza.setFechaHora(new Date());
                traza.setOperacion(OperacionesPermiso.APROBAR);
                em.merge(traza);
            }
        }else{
            for(TrazabilidadPermiso t : trazs){
                t.setEstadoTraz(EstadosTraz.ASIGNADO);
                t.setFechaHora(new Date());
            }
        }
        
        
        

    }

    @Override
    public void aprobarPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        String notaAprobacion = pto.getNota();
        
        String cond = "t.usrGrpAsignado = '"+usuario.getUsr()+"'";
        for(Groups grp : usuario.getGrupos()){
            cond = cond + " OR t.usrGrpAsignado = '"+grp.getCodigo()+"'";
        }
        String sql = "SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.estadoTraz =:estado "
                + "AND t.permisoTrabajo =:permiso "
                + "AND t.operacion =:operacion "
                + "AND ("+cond+")";


        List<TrazabilidadPermiso> trazs = em.createQuery(sql)
                .setParameter("estado", EstadosTraz.ASIGNADO)
                .setParameter("permiso", permiso)
                .setParameter("operacion", OperacionesPermiso.APROBAR).getResultList();
        
        TrazabilidadPermiso traz = trazs.get(0);
        traz.setEstadoTraz(EstadosTraz.EJECUTADO);
        traz.setFechaHora(new Date());
        traz.setUsuario(usuario.getUsr());
        traz.setNota(notaAprobacion);
        em.merge(traz);

        trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.estadoTraz =:estado "
                    + "AND t.operacion =:operacion ")
                    .setParameter("permiso", permiso)
                    .setParameter("estado", EstadosTraz.ASIGNADO)
                    .setParameter("operacion", OperacionesPermiso.APROBAR)
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
        traz.setUsrGrpAsignado(usuario.getUsr());
        em.merge(traz);

        List<TrazabilidadPermiso> trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.estadoTraz =:estado "
                    + "AND t.operacion =:operacion ")
                    .setParameter("permiso", permiso)
                    .setParameter("estado", EstadosTraz.ASIGNADO)
                    .setParameter("operacion", OperacionesPermiso.APROBAR)
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
    public void agregarAprobador(PermisoTrabajoTO pto, String usrGrupo){
        TrazabilidadPermiso traza = new TrazabilidadPermiso();
        traza.setPermisoTrabajo(pto.getPermiso());
        traza.setEstadoTraz(EstadosTraz.ASIGNADO);
        traza.setUsrGrpAsignado(usrGrupo);
        traza.setFechaHora(new Date());
        traza.setOperacion(OperacionesPermiso.APROBAR);
        em.merge(traza);
    }

    @Override
    public void terminarPermiso(PermisoTrabajoTO pto) throws ParametroException{
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
        
        String paramAprobDefecto = locator.getParameter("cancela_defecto");
        if(paramAprobDefecto == null){
            throw new ParametroException("No existe el parámetro aprueba_defecto");
        }
        String[] gruposAprobacion = paramAprobDefecto.split(","); 
        for(String grupo: gruposAprobacion){
            if(grupo.equals("SECTOR")){
                grupo = permiso.getSector().getGrupo();
            }else{
                grupo = locator.getParameter(grupo) != null ? locator.getParameter(grupo) : grupo;
            }
            TrazabilidadPermiso traza = new TrazabilidadPermiso();
            traza.setPermisoTrabajo(permiso);
            traza.setEstadoTraz(EstadosTraz.ASIGNADO);
            traza.setUsrGrpAsignado(grupo);//El grupo encargado del sector debe aprobar.
            traza.setFechaHora(new Date());
            traza.setOperacion(OperacionesPermiso.CANCELAR);
            em.merge(traza);
        }
    }

    @Override
    public void cancelarPermiso(PermisoTrabajoTO pto) {
        PermisoTrabajo permiso = pto.getPermiso();
        Users usuario = pto.getUsr();
        String nota = pto.getNota();
        
        String cond = "t.usrGrpAsignado = '"+usuario.getUsr()+"'";
        for(Groups grp : usuario.getGrupos()){
            cond = cond + " OR t.usrGrpAsignado = '"+grp.getCodigo()+"'";
        }
        String sql = "SELECT t "
                + "FROM TrazabilidadPermiso t "
                + "WHERE t.estadoTraz =:estado "
                + "AND t.permisoTrabajo =:permiso "
                + "AND t.operacion =:operacion "
                + "AND ("+cond+")";


        List<TrazabilidadPermiso> trazs = em.createQuery(sql)
                .setParameter("estado", EstadosTraz.ASIGNADO)
                .setParameter("permiso", permiso)
                .setParameter("operacion", OperacionesPermiso.CANCELAR).getResultList();
        
        TrazabilidadPermiso traz = trazs.get(0);
        traz.setEstadoTraz(EstadosTraz.EJECUTADO);
        traz.setFechaHora(new Date());
        traz.setUsuario(usuario.getUsr());
        traz.setNota(nota);
        em.merge(traz);
        
        trazs = em.createQuery("SELECT t "
                    + "FROM TrazabilidadPermiso t "
                    + "WHERE t.permisoTrabajo =:permiso "
                    + "AND t.estadoTraz =:estado "
                    + "AND t.operacion =:operacion ")
                    .setParameter("permiso", permiso)
                    .setParameter("estado", EstadosTraz.ASIGNADO)
                    .setParameter("operacion", OperacionesPermiso.CANCELAR)
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

    
    
}
