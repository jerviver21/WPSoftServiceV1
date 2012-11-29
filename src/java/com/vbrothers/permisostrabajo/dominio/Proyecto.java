/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "proyecto")
@NamedQueries({
    @NamedQuery(name = "Proyecto.findAll", query = "SELECT p FROM Proyecto p"),
    @NamedQuery(name = "Proyecto.findProyectosContratista", query = "SELECT p FROM Proyecto p JOIN p.contratistas c WHERE c.id = :idContratista")
})
public class Proyecto implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Basic(optional = false)
    @Column(name = "num_cuenta_cargada")
    private long numCuentaCargada;



    @Column(name = "fecha_ini")
    @Temporal(TemporalType.DATE)
    private Date fechaIni;
    @Column(name = "fecha_fin")
    @Temporal(TemporalType.DATE)
    private Date fechaFin;



    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "num_gestion_cambio")
    private long numGestionCambio;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyecto", fetch = FetchType.LAZY)
    private List<ContratistasProyecto> contratistas;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyecto", fetch = FetchType.LAZY)
    private List<EmpleadosProyecto> empleados;

    @JoinColumn(name = "id_estado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private EstadosProyecto estado;

    

    public Proyecto() {
        estado = new EstadosProyecto(1);
    }

    public Proyecto(Long id) {
        this.id = id;
    }

    public Proyecto(Long id, long numCuentaCargada, boolean contratistaEvento, String nombre, long numGestionCambio) {
        this.id = id;
        this.numCuentaCargada = numCuentaCargada;
        this.nombre = nombre;
        this.numGestionCambio = numGestionCambio;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getNumCuentaCargada() {
        return numCuentaCargada;
    }

    public void setNumCuentaCargada(long numCuentaCargada) {
        this.numCuentaCargada = numCuentaCargada;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getNumGestionCambio() {
        return numGestionCambio;
    }

    public void setNumGestionCambio(long numGestionCambio) {
        this.numGestionCambio = numGestionCambio;
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
        if (!(object instanceof Proyecto)) {
            return false;
        }
        Proyecto other = (Proyecto) object;
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
     * @return the contratistas
     */
    public List<ContratistasProyecto> getContratistas() {
        return contratistas;
    }

    /**
     * @param contratistas the contratistas to set
     */
    public void setContratistas(List<ContratistasProyecto> contratistas) {
        this.contratistas = contratistas;
    }

    /**
     * @return the empleados
     */
    public List<EmpleadosProyecto> getEmpleados() {
        return empleados;
    }

    /**
     * @param empleados the empleados to set
     */
    public void setEmpleados(List<EmpleadosProyecto> empleados) {
        this.empleados = empleados;
    }

    /**
     * @return the fechaIni
     */
    public Date getFechaIni() {
        return fechaIni;
    }

    /**
     * @param fechaIni the fechaIni to set
     */
    public void setFechaIni(Date fechaIni) {
        this.fechaIni = fechaIni;
    }

    /**
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    /**
     * @return the estado
     */
    public EstadosProyecto getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(EstadosProyecto estado) {
        this.estado = estado;
    }
    
}
