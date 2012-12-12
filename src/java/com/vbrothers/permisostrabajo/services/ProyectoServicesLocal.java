/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EstadoException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Contratista;
import com.vbrothers.permisostrabajo.dominio.EstadosProyecto;
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
    
    void borrarProyecto(Proyecto proyecto) throws EstadoException;

    Proyecto find(Object id);
    
    Proyecto findProyecto(Long id);

    List<Proyecto> findAll();

    List<Proyecto> findProyectosContratista(Contratista contratista);
    
    List<Proyecto> findProyectosActivos();

    List<Proyecto> findProyectos(String usr, Date fechaDesde, Date fechaHasta);

    public EstadosProyecto findEstadoById(int estado);

    
    
    
    
}
