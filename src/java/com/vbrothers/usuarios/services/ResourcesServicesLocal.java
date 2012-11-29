
package com.vbrothers.usuarios.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.usuarios.dominio.Resource;
import java.util.List;
import javax.ejb.Local;

/**
 * @author root
 */
@Local
public interface ResourcesServicesLocal {
    void create(Resource user)throws LlaveDuplicadaException;

    void edit(Resource user)throws LlaveDuplicadaException;

    void remove(Resource user);

    Resource find(Object id);

    public List<Resource> findAll(String language);

    public Resource findByUrl(String permisostrabajoactivar_empleadosxhtml);
}
