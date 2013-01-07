
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.locator.ServiceLocator;
import com.vbrothers.util.Log;
import java.io.File;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.ejb.Timeout;
import javax.ejb.Timer;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author jerviver21
 */
@Stateless
@LocalBean
public class PermisoTimerService {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Resource
    javax.ejb.TimerService timerService;
    
    @EJB
    EmpleadoServicesLocal empleadoService;
    
    
    
    public void stopTimer(){
       
    }

    public void initTimer(){
        //Primero cancela los timers que se hayan iniciado con anterioridad 
        Collection col = timerService.getTimers();
        Iterator iterator = col.iterator();
        while(iterator.hasNext()){
           Timer timer = (Timer)iterator.next();
           timer.cancel();
           System.out.println("Timer Cancelado");
        }
        
        //Se calcula la fecha de activación del timer
        String diaDesactivacion = ServiceLocator.getInstance().getParameter("diaDesactivacion");
        if(diaDesactivacion == null){
            Log.getLogger().log(Level.WARNING, "No existe el parámetro diaDesactivacion, los empleados no se desactivaran automaticamente");
            return;
        }
        Calendar calendario = Calendar.getInstance();
        calendario.set(Calendar.DATE, Integer.parseInt(diaDesactivacion));
        calendario.add(Calendar.MONTH, 1);
        long millisMesIni = calendario.getTime().getTime();
        calendario.add(Calendar.MONTH, 1);
        long millisMesFin = calendario.getTime().getTime();
        
        //Se programan de nuevo los timers de ejecución automática
        timerService.createTimer(calendario.getTime(), millisMesFin-millisMesIni, null);
        System.out.println("Timer creado!!");
    }
    
    @Timeout
    public void tareaAutomatica(Timer timer){
        Log.getLogger().log(Level.WARNING, "Tarea autom\u00e1tica de desactivaci\u00f3n de empleados: {0}", Calendar.getInstance().getTime());
        empleadoService.desactivarEmpleados();
    }

}
