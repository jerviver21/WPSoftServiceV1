package com.vbrothers.herramientas.services;




import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Sector;
import java.util.List;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface SectoresServicesLocal {
    void create(Sector area)throws LlaveDuplicadaException;

    void edit(Sector area)throws LlaveDuplicadaException;

    void remove(Sector area);

    Sector find(Object id);

    List<Sector> findAll();
    
}
