/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author jerviver21
 */
@Local
public interface ContratistaServicesLocal {
    void create(Contratista Contratistas)throws LlaveDuplicadaException;

    void edit(Contratista Contratistas)throws LlaveDuplicadaException;

    void remove(Contratista Contratistas);

    Contratista find(Object id);
    
    Contratista findById(Long numId);

    List<Contratista> findAll();
    
    List<Contratista> findActivos();
 
    public void guardar(Contratista entity) throws LlaveDuplicadaException, ParametroException;

    public Contratista findByUser(String usr);

    
}
