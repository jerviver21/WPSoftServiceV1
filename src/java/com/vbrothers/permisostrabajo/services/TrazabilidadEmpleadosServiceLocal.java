/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.permisostrabajo.dominio.Empleado;
import javax.ejb.Local;

/**
 *
 * @author jerviver21
 */
@Local
public interface TrazabilidadEmpleadosServiceLocal {

    void trazBetarEmpleado(Empleado emp, String usr);

    void trazActivarEmpleado(Empleado emp, String usr);
    
}
