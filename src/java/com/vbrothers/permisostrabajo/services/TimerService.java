
package com.vbrothers.permisostrabajo.services;

import java.util.Collection;
import java.util.Iterator;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author jerviver21
 */
@Stateless
@LocalBean
public class TimerService {

    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Resource
    javax.ejb.TimerService timerService;
    
    
    public void initTimer(){
        Collection col = timerService.getTimers();
        Iterator iterator = col.iterator();
        if(!iterator.hasNext()){
            timerService.createTimer(10*1000, 10*1000, null);
            System.out.println("Timer creado!!");
        }
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

}
