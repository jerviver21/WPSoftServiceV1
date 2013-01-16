
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.permisostrabajo.dominio.Empleado;
import com.vbrothers.permisostrabajo.dominio.TrazabilidadActivacionEmps;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author jerviver21
 */
@Stateless
public class TrazabilidadEmpleadosService implements TrazabilidadEmpleadosServiceLocal {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;
    
    @Override
    public void trazBetarEmpleado(Empleado emp, String usr) {
        Calendar calendario = Calendar.getInstance();
        calendario.set(Calendar.MILLISECOND, 0);
        calendario.set(Calendar.SECOND, 0);
        calendario.set(Calendar.MINUTE, 0);
        calendario.set(Calendar.HOUR, 0);
        Date fechaActual = calendario.getTime();
        
        List<TrazabilidadActivacionEmps> trazas = em.createQuery("SELECT t FROM TrazabilidadActivacionEmps t "
                + "WHERE t.vetar =:vetar AND t.fechaVetacion =:fechaVetacion AND t.empleado =:emp")
                .setParameter("vetar", emp.getActivo())
                .setParameter("fechaVetacion", fechaActual)
                .setParameter("emp", emp).getResultList();
        if(trazas.isEmpty()){
            TrazabilidadActivacionEmps tae = new TrazabilidadActivacionEmps();
            tae.setVetar(emp.getBetado());
            tae.setFechaVetacion(fechaActual);
            tae.setUsuarioActivador(usr);
            tae.setEmpleado(emp);
            em.merge(tae);    
        }
    }

    @Override
    public void trazActivarEmpleado(Empleado emp, String usr) {
        Calendar calendario = Calendar.getInstance();
        calendario.set(Calendar.MILLISECOND, 0);
        calendario.set(Calendar.SECOND, 0);
        calendario.set(Calendar.MINUTE, 0);
        calendario.set(Calendar.HOUR, 0);
        Date fechaActual = calendario.getTime();
        List<TrazabilidadActivacionEmps> trazas;
        if(emp.getActivo()){
            trazas = em.createQuery("SELECT t FROM TrazabilidadActivacionEmps t "
                + "WHERE t.activar =:activar AND t.fechaActivacion =:fechaAct "
                + "AND t.fechaInduccion =:fechaInduccion AND t.empleado =:emp")
                .setParameter("activar", emp.getActivo())
                .setParameter("fechaAct", fechaActual)
                .setParameter("fechaInduccion", emp.getFechaInduccion())
                .setParameter("emp", emp).getResultList();
        }else{
            trazas = em.createQuery("SELECT t FROM TrazabilidadActivacionEmps t "
                + "WHERE t.activar =:activar AND t.fechaActivacion =:fechaAct AND t.empleado =:emp")
                .setParameter("activar", emp.getActivo())
                .setParameter("fechaAct", fechaActual)
                .setParameter("emp", emp).getResultList();
        }
        
        
        if(trazas.isEmpty()){
            TrazabilidadActivacionEmps tae = new TrazabilidadActivacionEmps();
            tae.setActivar(emp.getActivo());
            tae.setFechaActivacion(fechaActual);
            tae.setFechaInduccion(emp.getActivo()?emp.getFechaInduccion():null);
            tae.setUsuarioActivador(usr);
            tae.setEmpleado(emp);
            em.merge(tae);
        }
    }

    

}
