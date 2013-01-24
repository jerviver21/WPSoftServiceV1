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
@Table(name = "sector")
@NamedQueries({
    @NamedQuery(name = "Sector.findAll", query = "SELECT a FROM Sector a")})
public class Sector implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "grupo")
    private String grupo;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sector", fetch = FetchType.EAGER)
    private List<Equipo> equipos;


    public Sector() {
    }

    public Sector(Integer id) {
        this.id = id;
    }

    public Sector(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
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


    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
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
        if (!(object instanceof Sector)) {
            return false;
        }
        Sector other = (Sector) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nombre;
    }

    /**
     * @return the equipos
     */
    public List<Equipo> getEquipos() {
        return equipos;
    }

    /**
     * @param equipos the equipos to set
     */
    public void setEquipos(List<Equipo> equipos) {
        this.equipos = equipos;
    }
    
}
