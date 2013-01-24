/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "certificados_emp")
@NamedQueries({
    @NamedQuery(name = "CertificadosEmp.findAll", query = "SELECT c FROM CertificadosEmp c")})
public class CertificadosEmp implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "ruta")
    private String ruta;
    @JoinColumn(name = "id_tipo", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private TipoCertificadosEmp idTipo;
    @JoinColumn(name = "id_empleado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Empleado empleado;


    public CertificadosEmp() {
    }

    public CertificadosEmp(Integer id) {
        this.id = id;
    }

    public CertificadosEmp(Integer id, String nombre, String ruta) {
        this.id = id;
        this.nombre = nombre;
        this.ruta = ruta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public TipoCertificadosEmp getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(TipoCertificadosEmp idTipo) {
        this.idTipo = idTipo;
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
        if (!(object instanceof CertificadosEmp)) {
            return false;
        }
        CertificadosEmp other = (CertificadosEmp) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.CertificadosEmp[ id=" + id + " ]";
    }

    /**
     * @return the empleado
     */
    public Empleado getEmpleado() {
        return empleado;
    }

    /**
     * @param empleado the empleado to set
     */
    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }
    
}
