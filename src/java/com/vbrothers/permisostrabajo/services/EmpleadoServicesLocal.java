
package com.vbrothers.permisostrabajo.services;

import com.vbrothers.common.exceptions.EmpActivoOtroContException;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import com.vbrothers.common.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.Empleado;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.ejb.Local;

/**
 * @author jerviver21
 */
@Local
public interface EmpleadoServicesLocal {
    void create(Empleado empleado)throws LlaveDuplicadaException;

    void edit(Empleado empleado)throws LlaveDuplicadaException;

    void remove(Empleado empleado);

    Empleado find(Object id);
    
    Empleado findById(Long numId);
    
    Empleado findByUser(String usr);

    List<Empleado> findAll();

    void guardar(Empleado empleado)throws LlaveDuplicadaException, ParametroException,IOException;

    void updateEmpleados(List<Empleado> empleadosContratista);

    

    List<Empleado> findEmpleadosXContratita(Long idContratista);

    List<Empleado> findEmpleadosActivosXContratita(Long idContratista);
    
    List<Empleado> findEmpleadosActivosPlanta();

    void eliminarCM(Empleado emp) throws java.lang.Exception;
    
    void eliminarCA(Empleado emp) throws java.lang.Exception;
    
    void activarEmpleado(Empleado emp, String usr)throws EmpActivoOtroContException;
    
    void desactivarEmpleados();

    void betarEmpleado(Empleado emp, String usr);

    void cambiarFechaInduccion(Empleado emp, String usr);
    
}
