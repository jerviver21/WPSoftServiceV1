/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.common.dominio;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "reporte")
@NamedQueries({
    @NamedQuery(name = "Reporte.findAll", query = "SELECT r FROM Reporte r")})
public class Reporte implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "roles")
    private String roles;
    @JoinColumn(name = "id_proceso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private TipoProcesoReporte proceso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reporte", fetch = FetchType.LAZY)
    private List<Archivo> archivos;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reporte", fetch = FetchType.LAZY)
    private List<ParametrosReporte> parametrosReporte;

    public Reporte() {
    }

    public Reporte(String nombre) {
        this.nombre = nombre;
    }

    public Reporte(String nombre, String roles, TipoProcesoReporte proceso) {
        this.nombre = nombre;
        this.roles = roles;
        this.proceso = proceso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public List<Archivo> getArchivos() {
        return archivos;
    }

    public void setArchivos(List<Archivo> archivoList) {
        this.archivos = archivoList;
    }

    public List<ParametrosReporte> getParametrosReporte() {
        return parametrosReporte;
    }

    public void setParametrosReporte(List<ParametrosReporte> parametroReporteList) {
        this.parametrosReporte = parametroReporteList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombre != null ? nombre.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reporte)) {
            return false;
        }
        Reporte other = (Reporte) object;
        if ((this.nombre == null && other.nombre != null) || (this.nombre != null && !this.nombre.equals(other.nombre))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.common.dominio.Reporte[ nombre=" + nombre + " ]";
    }

    /**
     * @return the proceso
     */
    public TipoProcesoReporte getProceso() {
        return proceso;
    }

    /**
     * @param proceso the proceso to set
     */
    public void setProceso(TipoProcesoReporte proceso) {
        this.proceso = proceso;
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }
    
}
