/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Jerson Viveros
 */
@Entity
@Table(name = "tarea")
@NamedQueries({
    @NamedQuery(name = "Tarea.findAll", query = "SELECT t FROM Tarea t")})
public class Tarea implements Serializable, Comparable<Tarea> {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Basic(optional = false)
    @Column(name = "datos")
    private String datos;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permiso;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tarea", fetch = FetchType.LAZY)
    private List<PeligrosTarea> peligros;

    @Basic(optional = false)
    @Column(name = "consecutivo")
    private int consecutivo;

    public Tarea() {
        peligros = new ArrayList<PeligrosTarea>();
    }

    public Tarea(Long id) {
        this.id = id;
    }

    public Tarea(Long id, String datos) {
        this.id = id;
        this.datos = datos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
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
        if (!(object instanceof Tarea)) {
            return false;
        }
        Tarea other = (Tarea) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return consecutivo+" - "+datos;
    }

    /**
     * @return the permiso
     */
    public PermisoTrabajo getPermiso() {
        return permiso;
    }

    /**
     * @param permiso the permiso to set
     */
    public void setPermiso(PermisoTrabajo permiso) {
        this.permiso = permiso;
    }

    /**
     * @return the peligros
     */
    public List<PeligrosTarea> getPeligros() {
        return peligros;
    }

    /**
     * @param peligros the peligros to set
     */
    public void setPeligros(List<PeligrosTarea> peligros) {
        this.peligros = peligros;
    }

    /**
     * @return the consecutivo
     */
    public int getConsecutivo() {
        return consecutivo;
    }

    /**
     * @param consecutivo the consecutivo to set
     */
    public void setConsecutivo(int consecutivo) {
        this.consecutivo = consecutivo;
    }

    public int compareTo(Tarea o) {
        return new Integer(consecutivo).compareTo(o.getConsecutivo());
    }

}
