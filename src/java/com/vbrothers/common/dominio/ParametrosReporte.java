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
@Table(name = "parametros_reporte")
@NamedQueries({
    @NamedQuery(name = "ParametrosReporte.findAll", query = "SELECT p FROM ParametrosReporte p")})
public class ParametrosReporte implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "etiqueta")
    private String etiqueta;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "id_tipo", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private TipoParametroReporte tipo;
    @JoinColumn(name = "id_reporte", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Reporte reporte;
    @JoinColumn(name = "id_data", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Data data;

    public ParametrosReporte() {
    }

    public ParametrosReporte(Integer id) {
        this.id = id;
    }

    public ParametrosReporte(Integer id, String nombre, String etiqueta) {
        this.id = id;
        this.nombre = nombre;
        this.etiqueta = etiqueta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public TipoParametroReporte getTipo() {
        return tipo;
    }

    public void setTipo(TipoParametroReporte fkTipo) {
        this.tipo = fkTipo;
    }

    public Reporte getReporte() {
        return reporte;
    }

    public void setReporte(Reporte fkReporte) {
        this.reporte = fkReporte;
    }

    public Data getData() {
        return data;
    }

    public void setData(Data fkData) {
        this.data = fkData;
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
        if (!(object instanceof ParametrosReporte)) {
            return false;
        }
        ParametrosReporte other = (ParametrosReporte) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.common.dominio.ParametroReporte[ id=" + id + " ]";
    }
    
}
