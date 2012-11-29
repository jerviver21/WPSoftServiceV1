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
@Table(name = "validaciones_formulario")
@NamedQueries({
    @NamedQuery(name = "ValidacionesFormulario.findAll", query = "SELECT v FROM ValidacionesFormulario v")})
public class ValidacionesFormulario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "id_campo_formulario")
    private int idCampoFormulario;

    public ValidacionesFormulario() {
    }

    public ValidacionesFormulario(Integer id) {
        this.id = id;
    }

    public ValidacionesFormulario(Integer id, int idCampoFormulario) {
        this.id = id;
        this.idCampoFormulario = idCampoFormulario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getIdCampoFormulario() {
        return idCampoFormulario;
    }

    public void setIdCampoFormulario(int idCampoFormulario) {
        this.idCampoFormulario = idCampoFormulario;
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
        if (!(object instanceof ValidacionesFormulario)) {
            return false;
        }
        ValidacionesFormulario other = (ValidacionesFormulario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.ValidacionesFormulario[ id=" + id + " ]";
    }
    
}
