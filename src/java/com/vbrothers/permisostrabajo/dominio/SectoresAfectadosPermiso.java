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
@Table(name = "sectores_afectados_permiso")
@NamedQueries({
    @NamedQuery(name = "SectoresAfectadosPermiso.findAll", query = "SELECT a FROM SectoresAfectadosPermiso a")})
public class SectoresAfectadosPermiso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permiso;
    @JoinColumn(name = "id_sector", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Sector sector;

    public SectoresAfectadosPermiso() {
    }

    public SectoresAfectadosPermiso(Long id) {
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

    public Sector getSector() {
        return sector;
    }

    public void setSector(Sector fkAreasTrabajoId) {
        this.sector = fkAreasTrabajoId;
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
        if (!(object instanceof SectoresAfectadosPermiso)) {
            return false;
        }
        SectoresAfectadosPermiso other = (SectoresAfectadosPermiso) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.AreasAfectadasPermiso[ id=" + id + " ]";
    }
    
}
