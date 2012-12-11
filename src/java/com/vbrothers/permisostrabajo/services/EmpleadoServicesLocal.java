
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

    void guardar(Empleado empleado)throws LlaveDuplicadaException, ParametroException;
    
    String cargarCertificado(String nombre, long cedula, InputStream input)throws ParametroException, IOException;

    public void updateEmpleados(List<Empleado> empleadosContratista);

    public void activarEmpleado(Empleado emp)throws EmpActivoOtroContException;

    public List<Empleado> findEmpleadosXContratita(Long idContratista);

    public List<Empleado> findEmpleadosActivosXContratita(Long idContratista);
    
    public List<Empleado> findEmpleadosActivosPlanta();
    
}
