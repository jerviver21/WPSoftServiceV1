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
    @Column(name = "usuario_activador")
    private String usuarioActivador;
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
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.TrazabilidadActivacionEmps[id=" + id + "]";
    }

}
