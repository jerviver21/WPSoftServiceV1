/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.herramientas.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Equipo;
import java.util.List;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface EquiposServicesLocal {
    void create(Equipo equipo)throws LlaveDuplicadaException;

    void edit(Equipo equipo)throws LlaveDuplicadaException;

    void remove(Equipo equipo);

    Equipo find(Object id);

    List<Equipo> findAll();
}
