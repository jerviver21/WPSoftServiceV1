/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vi.comun.exceptions.LlaveDuplicadaException;
import com.vi.comun.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author jerviver21
 */
@Local
public interface ContratistaServicesLocal {
    void create(Contratista Contratistas)throws LlaveDuplicadaException;

    void edit(Contratista Contratistas)throws LlaveDuplicadaException, Exception;

    void remove(Contratista Contratistas);

    Contratista find(Object id);
    
    Contratista findById(Long numId);

    List<Contratista> findAll();
    
    List<Contratista> findContratistasActivos();
 
    void guardar(Contratista entity) throws LlaveDuplicadaException, ParametroException, Exception;

    Contratista findByUser(String usr);

    
}
