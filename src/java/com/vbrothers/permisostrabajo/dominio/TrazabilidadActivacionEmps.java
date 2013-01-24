/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Jerson Viveros
 */
@Entity
@Table(name = "trazabilidad_activacion_emps")
@NamedQueries({
    @NamedQuery(name = "TrazabilidadActivacionEmps.findAll", query = "SELECT t FROM TrazabilidadActivacionEmps t")})
public class TrazabilidadActivacionEmps implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name = "fecha_activacion")
    @Temporal(TemporalType.DATE)
    private Date fechaActivacion;
    @Column(name = "fecha_induccion")
    @Temporal(TemporalType.DATE)
    private Date fechaInduccion;
    @Column(name = "fecha_vetacion")
    @Temporal(TemporalType.DATE)
    private Date fechaVetacion;
    @Column(name = "usuario_activador")
    private String usuarioActivador;
    
    @Column(name = "vetar")
    private Boolean vetar;
    @Column(name = "activar")
    private Boolean activar;
    
    @JoinColumn(name = "id_empleado", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Empleado empleado;

    public TrazabilidadActivacionEmps() {
    }

    public TrazabilidadActivacionEmps(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFechaActivacion() {
        return fechaActivacion;
    }

    public void setFechaActivacion(Date fechaActivacion) {
        this.fechaActivacion = fechaActivacion;
    }

    public String getUsuarioActivador() {
        return usuarioActivador;
    }

    public void setUsuarioActivador(String usuarioActivador) {
        this.usuarioActivador = usuarioActivador;
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
        if (!(object instanceof TrazabilidadActivacionEmps)) {
            return false;
        }
        TrazabilidadActivacionEmps other = (TrazabilidadActivacionEmps) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.TrazabilidadActivacionEmps[id=" + id + "]";
    }

    /**
     * @return the fechaInduccion
     */
    public Date getFechaInduccion() {
        return fechaInduccion;
    }

    /**
     * @param fechaInduccion the fechaInduccion to set
     */
    public void setFechaInduccion(Date fechaInduccion) {
        this.fechaInduccion = fechaInduccion;
    }

    /**
     * @return the fechaVetacion
     */
    public Date getFechaVetacion() {
        return fechaVetacion;
    }

    /**
     * @param fechaVetacion the fechaVetacion to set
     */
    public void setFechaVetacion(Date fechaVetacion) {
        this.fechaVetacion = fechaVetacion;
    }

    /**
     * @return the vetar
     */
    public Boolean getVetar() {
        return vetar;
    }

    /**
     * @param vetar the vetar to set
     */
    public void setVetar(Boolean vetar) {
        this.vetar = vetar;
    }

    /**
     * @return the activar
     */
    public Boolean getActivar() {
        return activar;
    }

    /**
     * @param activar the activar to set
     */
    public void setActivar(Boolean activar) {
        this.activar = activar;
    }

}
