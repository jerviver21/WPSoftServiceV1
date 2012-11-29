/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.common.dominio;

import java.io.Serializable;
import javax.persistence.*; 

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "archivo")
@NamedQueries({
    @NamedQuery(name = "Archivo.findAll", query = "SELECT a FROM Archivo a")})
public class Archivo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "nombre_archivo")
    private String nombreArchivo;
    @Basic(optional = false)
    @Column(name = "nombre_jasper")
    private String nombreJasper;
    @JoinColumn(name = "id_tipo_archivo", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private TipoArchivo tipoArchivo;
    @JoinColumn(name = "id_reporte", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Reporte reporte;

    public Archivo() {
    }

    public Archivo(String nombre) {
        this.nombre = nombre;
    }

    public Archivo(String nombre, String nombreArchivo, String nombreJasper) {
        this.nombre = nombre;
        this.nombreArchivo = nombreArchivo;
        this.nombreJasper = nombreJasper;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreArchivo() {
        return nombreArchivo;
    }

    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
    }

    public String getNombreJasper() {
        return nombreJasper;
    }

    public void setNombreJasper(String nombreJasper) {
        this.nombreJasper = nombreJasper;
    }

    public TipoArchivo getTipoArchivo() {
        return tipoArchivo;
    }

    public void setTipoArchivo(TipoArchivo fkTipoArchivo) {
        this.tipoArchivo = fkTipoArchivo;
    }

    public Reporte getReporte() {
        return reporte;
    }

    public void setReporte(Reporte fkReporte) {
        this.reporte = fkReporte;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombre != null ? nombre.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Archivo)) {
            return false;
        }
        Archivo other = (Archivo) object;
        if ((this.nombre == null && other.nombre != null) || (this.nombre != null && !this.nombre.equals(other.nombre))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.common.dominio.Archivo[ nombre=" + nombre + " ]";
    }
    
}
