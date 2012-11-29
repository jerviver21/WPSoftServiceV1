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
@Table(name = "campos_formulario")
@NamedQueries({
    @NamedQuery(name = "CamposFormulario.findAll", query = "SELECT c FROM CamposFormulario c")})
public class CamposFormulario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "id_formulario")
    private int idFormulario;

    public CamposFormulario() {
    }

    public CamposFormulario(Integer id) {
        this.id = id;
    }

    public CamposFormulario(Integer id, int idFormulario) {
        this.id = id;
        this.idFormulario = idFormulario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getIdFormulario() {
        return idFormulario;
    }

    public void setIdFormulario(int idFormulario) {
        this.idFormulario = idFormulario;
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
        if (!(object instanceof CamposFormulario)) {
            return false;
        }
        CamposFormulario other = (CamposFormulario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.CamposFormulario[ id=" + id + " ]";
    }
    
}
