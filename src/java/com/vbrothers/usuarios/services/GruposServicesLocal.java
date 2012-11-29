/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.usuarios.services;


import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Rol;
import java.util.List;
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

    public List<Groups> findAll();

    public List<Rol> findRolesByGroup(Groups group);

    Groups findByCodigo(String codigo);
}
