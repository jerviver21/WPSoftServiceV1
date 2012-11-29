package com.vbrothers.usuarios.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.usuarios.dominio.Groups;
import com.vbrothers.usuarios.dominio.Resource;
import com.vbrothers.usuarios.dominio.Rol;
import java.util.List;
import java.util.Set;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface RolesServicesLocal {
    void create(Rol user)throws LlaveDuplicadaException;

    void edit(Rol user)throws LlaveDuplicadaException;

    void remove(Rol user);

    Rol find(Object id);

    public List<Rol> findAll();

    public Set<Resource> findResourceByRol(Rol rol);

    public Rol findByCodigo(String admistradoR);

    List<Groups> findGruposByRol(String rol);
}
