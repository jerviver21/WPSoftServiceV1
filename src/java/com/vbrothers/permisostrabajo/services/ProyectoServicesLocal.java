/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.Proyecto;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 * @author jerviver21
 */
@Local
public interface ProyectoServicesLocal {

    void create(Proyecto proyecto)throws LlaveDuplicadaException;

    void edit(Proyecto proyecto)throws LlaveDuplicadaException;

    void remove(Proyecto proyecto);

    Proyecto find(Object id);

    List<Proyecto> findAll();

    public List<Proyecto> findProyectosContratista(Contratista contratista);
    
    public List<Proyecto> findProyectosActivos();

    public List<Proyecto> findProyectos(String usr, Date fechaDesde, Date fechaHasta);
    
}
