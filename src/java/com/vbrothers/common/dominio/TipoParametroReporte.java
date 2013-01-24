/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.common.dominio;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "tipo_parametro_reporte")
@NamedQueries({
    @NamedQuery(name = "TipoParametroReporte.findAll", query = "SELECT t FROM TipoParametroReporte t")})
public class TipoParametroReporte implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "tipo")
    private String tipo;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "descripcion")
    private String descripcion;


    public TipoParametroReporte() {
    }

    public TipoParametroReporte(Integer id) {
        this.id = id;
    }

    public TipoParametroReporte(Integer id, String tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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
        if (!(object instanceof TipoParametroReporte)) {
            return false;
        }
        TipoParametroReporte other = (TipoParametroReporte) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.common.dominio.TipoParametroReporte[ id=" + id + " ]";
    }
    
}
