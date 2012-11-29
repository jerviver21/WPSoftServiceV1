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
@Table(name = "precauciones_trabajo")
@NamedQueries({
    @NamedQuery(name = "PrecaucionesTrabajo.findAll", query = "SELECT p FROM PrecaucionesTrabajo p")})
public class PrecaucionesTrabajo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "otros_cual")
    private String otrosCual;
    @JoinColumn(name = "id_precaucion", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Precaucion precaucion;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permiso;

    public PrecaucionesTrabajo() {
    }

    public PrecaucionesTrabajo(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOtrosCual() {
        return otrosCual;
    }

    public void setOtrosCual(String otrosCual) {
        this.otrosCual = otrosCual;
    }

    public Precaucion getPrecaucion() {
        return precaucion;
    }

    public void setPrecaucion(Precaucion fkPrecaucionId) {
        this.precaucion = fkPrecaucionId;
    }

    public PermisoTrabajo getPermiso() {
        return permiso;
    }

    public void setPermiso(PermisoTrabajo fkPermisoId) {
        this.permiso = fkPermisoId;
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
        if (!(object instanceof PrecaucionesTrabajo)) {
            return false;
        }
        PrecaucionesTrabajo other = (PrecaucionesTrabajo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.PrecaucionesTrabajo[ id=" + id + " ]";
    }
    
}
