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
@Table(name = "notas_permiso")
@NamedQueries({
    @NamedQuery(name = "NotasPermiso.findAll", query = "SELECT p FROM NotasPermiso p")})
public class NotasPermiso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "nota")
    private String nota;
    @Column(name = "usr")
    private String usr;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permiso;

    public NotasPermiso() {
    }

    public NotasPermiso(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
        if (!(object instanceof NotasPermiso)) {
            return false;
        }
        NotasPermiso other = (NotasPermiso) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.PrecaucionesTrabajo[ id=" + id + " ]";
    }

    /**
     * @return the nota
     */
    public String getNota() {
        return nota;
    }

    /**
     * @param nota the nota to set
     */
    public void setNota(String nota) {
        this.nota = nota;
    }

    /**
     * @return the usr
     */
    public String getUsr() {
        return usr;
    }

    /**
     * @param usr the usr to set
     */
    public void setUsr(String usr) {
        this.usr = usr;
    }
    
}
