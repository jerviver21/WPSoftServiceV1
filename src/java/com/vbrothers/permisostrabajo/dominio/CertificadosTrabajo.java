/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "certificados_trabajo")
@NamedQueries({
    @NamedQuery(name = "CertificadosTrabajo.findAll", query = "SELECT c FROM CertificadosTrabajo c")})
public class CertificadosTrabajo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permiso;
    @JoinColumn(name = "id_certificado", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Certificado certificado;
    @Column(name = "restriccion")
    private String restriccion;


    public CertificadosTrabajo() {
    }

    public CertificadosTrabajo(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public PermisoTrabajo getPermiso() {
        return permiso;
    }

    public void setPermiso(PermisoTrabajo fkPermisoId) {
        this.permiso = fkPermisoId;
    }

    public Certificado getCertificado() {
        return certificado;
    }

    public void setCertificado(Certificado fkCertificadosId) {
        this.certificado = fkCertificadosId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if(certificado.getId() != null){
            hash = certificado.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CertificadosTrabajo)) {
            return false;
        }
        CertificadosTrabajo other = (CertificadosTrabajo) object;
        if(this.getCertificado().getId() != null && other.getCertificado().getId() != null && this.getCertificado().equals(other.getCertificado())){
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.CertificadosTrabajo[ id=" + id + " ]";
    }

    /**
     * @return the restriccion
     */
    public String getRestriccion() {
        return restriccion;
    }

    /**
     * @param restriccion the restriccion to set
     */
    public void setRestriccion(String restriccion) {
        this.restriccion = restriccion;
    }
    
}
