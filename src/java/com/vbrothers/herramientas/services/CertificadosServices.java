
package com.vbrothers.herramientas.services;

import com.vi.comun.exceptions.ParametroException;
import com.vbrothers.permisostrabajo.dominio.Certificado;
import com.vbrothers.permisostrabajo.services.AbstractFacade;
import com.vbrothers.util.FilesUtils;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author Jerson Viveros
 */
@Stateless
public class CertificadosServices extends AbstractFacade<Certificado> implements CertificadosServicesLocal {
    @PersistenceContext(unitName = "WPSoftPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CertificadosServices() {
        super(Certificado.class);
    }
    
    @Override
    public void guardarCertificado(Certificado cert)throws ParametroException, IOException{
        String dirCertificados = locator.getParameter("dirChecklist");
        if(dirCertificados == null){
            throw new ParametroException("El parámetro dirChecklist no existe" );
        }
        File dir = new File(dirCertificados);
        if(!dir.exists()){
            dir.mkdirs();
        }
        String rutaArchivo = new FilesUtils().crearArchivo(dirCertificados, cert.getNombre(), cert.getDatosArchivo());
        cert.setRutaCheckList(rutaArchivo);
        em.merge(cert);
        cert.setClCargado(Boolean.TRUE);
    }
    
    @Override
    public List<Certificado> findAll(){
        return em.createNamedQuery("Certificado.findAll").getResultList();
    }

    @Override
    public void borrarCertificado(Certificado cert) {
        File archivo = new File(cert.getRutaCheckList());
        if(archivo.exists()){
            archivo.delete();
        }
        getEntityManager().remove(getEntityManager().merge(cert));
    }

}
