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
    private Long id;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permiso;
    @JoinColumn(name = "id_certificado", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Certificado certificado;


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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CertificadosTrabajo)) {
            return false;
        }
        CertificadosTrabajo other = (CertificadosTrabajo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.CertificadosTrabajo[ id=" + id + " ]";
    }
    
}
