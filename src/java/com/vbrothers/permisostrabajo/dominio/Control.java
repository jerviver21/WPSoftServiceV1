/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "control")
@NamedQueries({
    @NamedQuery(name = "Control.findAll", query = "SELECT c FROM Control c")})
public class Control implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "consecutivo")
    private Integer consecutivo;
    @Column(name = "nombre")
    private String nombre;

    @JoinColumn(name = "id_peligro", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Peligro peligro;

    @Transient
    private boolean agregarControl = false;

    public Control() {
    }

    public Control(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Peligro getPeligro() {
        return peligro;
    }

    public void setPeligro(Peligro fkRiesgoId) {
        this.peligro = fkRiesgoId;
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
        if (!(object instanceof Control)) {
            return false;
        }
        Control other = (Control) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.Control[ id=" + id + " ]";
    }

    /**
     * @return the agregarControl
     */
    public boolean isAgregarControl() {
        return agregarControl;
    }

    /**
     * @param agregarControl the agregarControl to set
     */
    public void setAgregarControl(boolean agregarControl) {
        this.agregarControl = agregarControl;
    }

    /**
     * @return the consecutivo
     */
    public Integer getConsecutivo() {
        return consecutivo;
    }

    /**
     * @param consecutivo the consecutivo to set
     */
    public void setConsecutivo(Integer consecutivo) {
        this.consecutivo = consecutivo;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
