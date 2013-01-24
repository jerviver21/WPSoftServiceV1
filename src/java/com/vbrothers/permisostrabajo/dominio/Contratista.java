/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import com.vbrothers.usuarios.dominio.Users;
import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "contratista")
@NamedQueries({
    @NamedQuery(name = "Contratista.findAll", query = "SELECT c FROM Contratista c"),
    @NamedQuery(name = "Contratista.findByNumId", query = "SELECT c FROM Contratista c WHERE c.numId = :numId"),
    @NamedQuery(name = "Contratista.findByUser", query = "SELECT c FROM Contratista c WHERE c.usuario = :usr")
})
public class Contratista implements Serializable {
    @Column(name = "nivel_riesgo")
    private String nivelRiesgo;
    @Column(name = "objeto_social")
    private String objetoSocial;
    @Column(name = "domicilio")
    private String domicilio;
    @Basic(optional = false)
    @Column(name = "mail")
    private String mail;
    @Basic(optional = false)
    @Column(name = "nombre_contacto")
    private String nombreContacto;
    @Basic(optional = false)
    @Column(name = "arp")
    private String arp;
    @Basic(optional = false)
    @Column(name = "telefono")
    private String telefono;
    @Column(name = "telefono_contacto")
    private String telefonoContacto;
    @Basic(optional = false)
    @Column(name = "usuario")
    private String usuario;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name = "num_id")
    private Long numId;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "activo")
    private Boolean activo = true;

    @OneToMany(mappedBy = "contratista", fetch = FetchType.LAZY, cascade=CascadeType.MERGE)
    private List<Empleado> empleados;

    @Transient
    private String pwd;

    public Contratista() {
    }

    public Contratista(Long id) {
        this.id = id;
    }

    public Contratista(Long id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNumId() {
        return numId;
    }

    public void setNumId(Long numId) {
        this.numId = numId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public List<Empleado> getEmpleados() {
        return empleados;
    }

    public void setEmpleados(List<Empleado> empleadosList) {
        this.empleados = empleadosList;
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
        if (!(object instanceof Contratista)) {
            return false;
        }
        Contratista other = (Contratista) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return numId+" - "+nombre;
    }

    public String getNivelRiesgo() {
        return nivelRiesgo;
    }

    public void setNivelRiesgo(String nivelRiesgo) {
        this.nivelRiesgo = nivelRiesgo;
    }

    public String getObjetoSocial() {
        return objetoSocial;
    }

    public void setObjetoSocial(String objetoSocial) {
        this.objetoSocial = objetoSocial;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getArp() {
        return arp;
    }

    public void setArp(String arp) {
        this.arp = arp;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }


    /**
     * @return the activo
     */
    public Boolean getActivo() {
        return activo;
    }

    /**
     * @param activo the activo to set
     */
    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    /**
     * @return the telefonoContacto
     */
    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    /**
     * @param telefonoContacto the telefonoContacto to set
     */
    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
}
