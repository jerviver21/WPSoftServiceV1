
package com.vbrothers.herramientas.services;

import com.vi.comun.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Control;
import com.vbrothers.permisostrabajo.dominio.Peligro;
import com.vbrothers.permisostrabajo.dominio.PeligrosTarea;
import com.vbrothers.permisostrabajo.dominio.Tarea;
import java.util.List;
import javax.ejb.Local;

/**
 * @author root
 */
@Local
public interface PeligrosServicesLocal {
    void create(Peligro riesgo)throws LlaveDuplicadaException;

    void edit(Peligro riesgo)throws LlaveDuplicadaException;

    List<Control> findControlsByRiesgo(Peligro riesgo);

    void remove(Peligro Riesgo);

    Peligro find(Object id);

    List<Peligro> findAll();

    PeligrosTarea findPeligroTarea(Peligro peligro, Tarea tarea);
}
