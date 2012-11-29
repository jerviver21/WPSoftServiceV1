/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.usuarios.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.usuarios.dominio.Menu;
import java.util.List;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface MenusServicesLocal {
    void create(Menu user) throws LlaveDuplicadaException;

    void edit(Menu user) throws LlaveDuplicadaException;

    void remove(Menu user);

    Menu find(Object id);

    public List<Menu> findAll(String language);

    public Menu findByNombre(String string);
    
}
