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
 * @author E. Alexander Ospina Castiblanco
 */
@Entity
@Table(name = "empleados_proyecto")
@NamedQueries({
    @NamedQuery(name = "EmpleadosProyecto.findAll", query = "SELECT e FROM EmpleadosProyecto e")})
public class EmpleadosProyecto implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name = "actividad")
    private String actividad;
    @JoinColumn(name = "id_proyecto", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Proyecto proyecto;
    @JoinColumn(name = "id_empleado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Empleado empleado;

    public EmpleadosProyecto() {
    }

    public EmpleadosProyecto(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    public Proyecto getProyecto() {
        return proyecto;
    }

    public void setProyecto(Proyecto proyecto) {
        this.proyecto = proyecto;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
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
        if (!(object instanceof EmpleadosProyecto)) {
            return false;
        }
        EmpleadosProyecto other = (EmpleadosProyecto) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.EmpleadosProyecto[id=" + id + "]";
    }

}
