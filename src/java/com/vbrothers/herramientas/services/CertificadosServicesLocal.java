package com.vbrothers.herramientas.services;

import com.vi.comun.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.Certificado;
import java.io.IOException;
import java.util.List;
import javax.ejb.Local;

/**
 * @author jerviver21
 */
@Local
public interface CertificadosServicesLocal {
    
    void guardarCertificado(Certificado cert)throws ParametroException, IOException;
    
    void borrarCertificado(Certificado cert);
    
    List<Certificado> findAll();

    Certificado find(Object idSector);
    
    
    
}
