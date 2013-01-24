/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
    @NamedQuery(name = "Proyecto.findAll", query = "SELECT p FROM Proyecto p")})
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
    @OneToMany(mappedBy = "proyecto", fetch = FetchType.LAZY)
    private List<PermisoTrabajo> permisos;

    @JoinColumn(name = "id_estado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private EstadoProyecto estado;
    
    @Column(name = "usuario_creacion")
    private String usuarioCreacion;
    @Column(name = "fecha_hora_creacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHoraCreacion;
    
    @Transient
    private String fIniFormato;
    
    @Transient
    private String fFinFormato;

    

    public Proyecto() {
        estado = new EstadoProyecto(1);
        permisos = new ArrayList<PermisoTrabajo>();
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
    public EstadoProyecto getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(EstadoProyecto estado) {
        this.estado = estado;
    }

    /**
     * @return the usuarioCreacion
     */
    public String getUsuarioCreacion() {
        return usuarioCreacion;
    }

    /**
     * @param usuarioCreacion the usuarioCreacion to set
     */
    public void setUsuarioCreacion(String usuarioCreacion) {
        this.usuarioCreacion = usuarioCreacion;
    }

    /**
     * @return the fechaHoraCreacion
     */
    public Date getFechaHoraCreacion() {
        return fechaHoraCreacion;
    }

    /**
     * @param fechaHoraCreacion the fechaHoraCreacion to set
     */
    public void setFechaHoraCreacion(Date fechaHoraCreacion) {
        this.fechaHoraCreacion = fechaHoraCreacion;
    }

    /**
     * @return the permisos
     */
    public List<PermisoTrabajo> getPermisos() {
        return permisos;
    }

    /**
     * @param permisos the permisos to set
     */
    public void setPermisos(List<PermisoTrabajo> permisos) {
        this.permisos = permisos;
    }

    /**
     * @return the fIniFormato
     */
    public String getfIniFormato() {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        fIniFormato = f.format(fechaIni);
        return fIniFormato;
    }

    /**
     * @param fIniFormato the fIniFormato to set
     */
    public void setfIniFormato(String fIniFormato) {
        
        this.fIniFormato = fIniFormato;
    }

    /**
     * @return the fFinFormato
     */
    public String getfFinFormato() {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        fFinFormato = f.format(fechaFin);
        return fFinFormato;
    }

    /**
     * @param fFinFormato the fFinFormato to set
     */
    public void setfFinFormato(String fFinFormato) {
        this.fFinFormato = fFinFormato;
    }
    
}
