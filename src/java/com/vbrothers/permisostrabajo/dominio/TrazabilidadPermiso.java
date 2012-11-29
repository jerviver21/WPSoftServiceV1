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
@Table(name = "trazabilidad_permiso")
@NamedQueries({
    @NamedQuery(name = "TrazabilidadPermiso.findAll", query = "SELECT t FROM TrazabilidadPermiso t")})
public class TrazabilidadPermiso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Basic(optional = false)
    @Column(name = "fecha_hora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    @Column(name = "nota")
    private String nota;
    @Column(name = "usr_grp_asignado")
    private String usrGrpAsignado;
    @Column(name = "usuario")
    private String usuario;
    @JoinColumn(name = "id_permiso", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PermisoTrabajo permisoTrabajo;
    @JoinColumn(name = "id_operacion", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private OperacionPermiso operacion;
    @JoinColumn(name = "id_estado_trazabilidad", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private EstadoTrazabilidad estadoTraz;

    public TrazabilidadPermiso() {
    }

    public TrazabilidadPermiso(Long id) {
        this.id = id;
    }

    public TrazabilidadPermiso(Long id, Date fechaHora) {
        this.id = id;
        this.fechaHora = fechaHora;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String razonNoAprobacion) {
        this.nota = razonNoAprobacion;
    }

    public String getUsrGrpAsignado() {
        return usrGrpAsignado;
    }

    public void setUsrGrpAsignado(String usuario) {
        this.usrGrpAsignado = usuario;
    }

    public PermisoTrabajo getPermisoTrabajo() {
        return permisoTrabajo;
    }

    public void setPermisoTrabajo(PermisoTrabajo permisoTrabajo) {
        this.permisoTrabajo = permisoTrabajo;
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
        if (!(object instanceof TrazabilidadPermiso)) {
            return false;
        }
        TrazabilidadPermiso other = (TrazabilidadPermiso) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.TrazabilidadPermiso[id=" + id + "]";
    }


    /**
     * @return the estadoTraz
     */
    public EstadoTrazabilidad getEstadoTraz() {
        return estadoTraz;
    }

    /**
     * @param estadoTraz the estadoTraz to set
     */
    public void setEstadoTraz(EstadoTrazabilidad estadoTraz) {
        this.estadoTraz = estadoTraz;
    }

    /**
     * @return the operacion
     */
    public OperacionPermiso getOperacion() {
        return operacion;
    }

    /**
     * @param operacion the operacion to set
     */
    public void setOperacion(OperacionPermiso operacion) {
        this.operacion = operacion;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

}
