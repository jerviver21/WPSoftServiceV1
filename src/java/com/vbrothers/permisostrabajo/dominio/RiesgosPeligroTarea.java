/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import javax.persistence.Basic;
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
import javax.persistence.Table;

/**
 *
 * @author Jerson Viveros
 */
@Entity
@Table(name = "riesgos_peligro_tarea")
@NamedQueries({
    @NamedQuery(name = "RiesgosPeligroTarea.findAll", query = "SELECT r FROM RiesgosPeligroTarea r")})
public class RiesgosPeligroTarea implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name = "consecutivo")
    private Integer consecutivo;
    @Column(name = "nombre")
    private String nombre;
    @JoinColumn(name = "id_peligro_tarea", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private PeligrosTarea peligrosTarea;

    public RiesgosPeligroTarea() {
    }

    public RiesgosPeligroTarea(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getConsecutivo() {
        return consecutivo;
    }

    public void setConsecutivo(Integer consecutivo) {
        this.consecutivo = consecutivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public PeligrosTarea getPeligrosTarea() {
        return peligrosTarea;
    }

    public void setPeligrosTarea(PeligrosTarea peligrosTarea) {
        this.peligrosTarea = peligrosTarea;
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
        if (!(object instanceof RiesgosPeligroTarea)) {
            return false;
        }
        RiesgosPeligroTarea other = (RiesgosPeligroTarea) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return consecutivo+" - "+nombre;
    }

}
