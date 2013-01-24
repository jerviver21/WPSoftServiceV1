/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.common.dominio;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "campos_validacion")
@NamedQueries({
    @NamedQuery(name = "CamposValidacion.findAll", query = "SELECT c FROM CamposValidacion c")})
public class CamposValidacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "id_campo")
    private Integer idCampo;
    @Column(name = "id_validacion")
    private Integer idValidacion;

    public CamposValidacion() {
    }

    public CamposValidacion(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdCampo() {
        return idCampo;
    }

    public void setIdCampo(Integer idCampo) {
        this.idCampo = idCampo;
    }

    public Integer getIdValidacion() {
        return idValidacion;
    }

    public void setIdValidacion(Integer idValidacion) {
        this.idValidacion = idValidacion;
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
        if (!(object instanceof CamposValidacion)) {
            return false;
        }
        CamposValidacion other = (CamposValidacion) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.CamposValidaciones[ id=" + id + " ]";
    }
    
}
