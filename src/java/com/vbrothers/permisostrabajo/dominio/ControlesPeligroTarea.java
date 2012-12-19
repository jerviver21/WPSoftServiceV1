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
 * @author jerviver21
 */
@Entity
@Table(name = "controles_peligro_tarea")
@NamedQueries({
    @NamedQuery(name = "ControlesPeligroTarea.findAll", query = "SELECT r FROM ControlesPeligroTarea r")})
public class ControlesPeligroTarea implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name = "control")
    private String control;
    @JoinColumn(name = "id_peligro_tarea", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private PeligrosTarea peligrosTarea;

    public ControlesPeligroTarea() {
    }

    public ControlesPeligroTarea(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        return control;
    }

    /**
     * @return the control
     */
    public String getControl() {
        return control;
    }

    /**
     * @param control the control to set
     */
    public void setControl(String control) {
        this.control = control;
    }

}