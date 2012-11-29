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
@Table(name = "peligro")
@NamedQueries({
    @NamedQuery(name = "Peligro.findAll", query = "SELECT r FROM Peligro r")})
public class Peligro implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "peligro", fetch = FetchType.EAGER)
    private List<Control> controles;


    public Peligro() {
    }

    public Peligro(Integer id) {
        this.id = id;
    }

    public Peligro(Integer id, String descripcion) {
        this.id = id;
        this.nombre = descripcion;
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

    public void setNombre(String descripcion) {
        this.nombre = descripcion;
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
        if (!(object instanceof Peligro)) {
            return false;
        }
        Peligro other = (Peligro) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return (nombre.length() > 30 ? nombre.substring(0, 30) : nombre);
    }

    /**
     * @return the peligros
     */
    public List<Control> getControles() {
        return controles;
    }

    /**
     * @param peligros the peligros to set
     */
    public void setControles(List<Control> controles) {
        this.controles = controles;
    }
    
}
