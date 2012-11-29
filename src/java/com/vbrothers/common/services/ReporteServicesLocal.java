
package com.vbrothers.common.services;

import com.vbrothers.common.dominio.Reporte;
import com.vbrothers.common.dto.ResultReporteDTO;
import com.vbrothers.common.exceptions.LlaveDuplicadaException;
import java.util.List;
import java.util.Map;
import javax.ejb.Local;

/**
 * @author Jerson Viveros
 */
@Local
public interface ReporteServicesLocal {
    void create(Reporte param) throws LlaveDuplicadaException;

    void edit(Reporte param) throws LlaveDuplicadaException;

    void remove(Reporte param);

    Reporte find(Object id);

    public List<Reporte> findAll();

    ResultReporteDTO generarReporte(Reporte reporte, Map<String, Object> params) throws Exception;
}
