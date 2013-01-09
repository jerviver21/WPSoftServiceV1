/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.usuarios.services;


import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Rol;
import java.util.List;
import java.util.Set;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface GruposServicesLocal {
    void create(Groups user)throws LlaveDuplicadaException;

    void edit(Groups user)throws LlaveDuplicadaException;

    void remove(Groups user);

    Groups find(Object id);

    List<Groups> findAll();

    List<Rol> findRolesByGroup(Groups group);

    Groups findByCodigo(String codigo);
}
