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
@Table(name = "peligros_tarea")
@NamedQueries({
    @NamedQuery(name = "PeligrosTarea.findAll", query = "SELECT p FROM PeligrosTarea p")})
public class PeligrosTarea implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @JoinColumn(name = "id_tarea", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Tarea tarea;
    @JoinColumn(name = "id_peligro", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Peligro peligro;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "peligrosTarea", fetch = FetchType.LAZY)
    private List<RiesgosPeligroTarea> riesgos;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "peligrosTarea", fetch = FetchType.LAZY)
    private List<ControlesPeligroTarea> controles;


    public PeligrosTarea() {
        riesgos = new ArrayList<RiesgosPeligroTarea>();
    }

    public PeligrosTarea(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tarea getTarea() {
        return tarea;
    }

    public void setTarea(Tarea tarea) {
        this.tarea = tarea;
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
        if (!(object instanceof PeligrosTarea)) {
            return false;
        }
        PeligrosTarea other = (PeligrosTarea) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.PeligrosPermiso[id=" + id + "]";
    }

    /**
     * @return the peligro
     */
    public Peligro getPeligro() {
        return peligro;
    }

    /**
     * @param peligro the peligro to set
     */
    public void setPeligro(Peligro peligro) {
        this.peligro = peligro;
    }

    /**
     * @return the riesgos
     */
    public List<RiesgosPeligroTarea> getRiesgos() {
        return riesgos;
    }

    /**
     * @param riesgos the riesgos to set
     */
    public void setRiesgos(List<RiesgosPeligroTarea> riesgos) {
        this.riesgos = riesgos;
    }

    /**
     * @return the controles
     */
    public List<ControlesPeligroTarea> getControles() {
        return controles;
    }

    /**
     * @param controles the controles to set
     */
    public void setControles(List<ControlesPeligroTarea> controles) {
        this.controles = controles;
    }

}
