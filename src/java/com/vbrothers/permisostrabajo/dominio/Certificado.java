/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import java.io.InputStream;
import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "certificado")
@NamedQueries({
    @NamedQuery(name = "Certificado.findAll", query = "SELECT c FROM Certificado c")})
public class Certificado implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "ruta_check_list")
    private String rutaCheckList;
    @Column(name = "cl_cargado")
    private Boolean clCargado;
    
    @Transient
    private InputStream datosArchivo;


    public Certificado() {
        clCargado = false;
    }

    public Certificado(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getRutaCheckList() {
        return rutaCheckList;
    }

    public void setRutaCheckList(String rutaCheckList) {
        this.rutaCheckList = rutaCheckList;
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
        if (!(object instanceof Certificado)) {
            return false;
        }
        Certificado other = (Certificado) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nombre;
    }

    /**
     * @return the clCargado
     */
    public Boolean getClCargado() {
        return clCargado;
    }

    /**
     * @param clCargado the clCargado to set
     */
    public void setClCargado(Boolean clCargado) {
        this.clCargado = clCargado;
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

    /**
     * @return the datosArchivo
     */
    public InputStream getDatosArchivo() {
        return datosArchivo;
    }

    /**
     * @param datosArchivo the datosArchivo to set
     */
    public void setDatosArchivo(InputStream datosArchivo) {
        this.datosArchivo = datosArchivo;
    }
    
}
