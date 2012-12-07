/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.herramientas.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Control;
import java.util.List;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface ControlesServicesLocal {
    void create(Control Control)throws LlaveDuplicadaException;

    void edit(Control Control)throws LlaveDuplicadaException;

    void remove(Control Control);

    Control find(Object id);

    List<Control> findAll();
}
