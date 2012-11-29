/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.tablasref.services;

import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.permisostrabajo.dominio.Disciplina;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface DisciplinasServicesLocal {
    void create(Disciplina Disciplina)throws LlaveDuplicadaException;

    void edit(Disciplina Disciplina)throws LlaveDuplicadaException;

    void remove(Disciplina Disciplina);

    Disciplina find(Object id);

    List<Disciplina> findAll();
}
