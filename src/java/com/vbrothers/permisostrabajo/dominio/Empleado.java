/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.permisostrabajo.dominio;

import com.vbrothers.usuarios.dominio.Users;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "empleado")
@NamedQueries({
    @NamedQuery(name = "Empleado.findAll", query = "SELECT e FROM Empleado e"),
    @NamedQuery(name = "Empleado.findByNumId", query = "SELECT e FROM Empleado e WHERE e.numId = :numId"),
    @NamedQuery(name = "Empleado.findActivesByContratist", query = "SELECT e FROM Empleado e WHERE e.activo=true AND e.contratista = :idContratista"), 
    @NamedQuery(name = "Empleado.findActivesPlanta", query = "SELECT e FROM Empleado e WHERE e.activo=true AND e.contratista is null"),
    @NamedQuery(name = "Empleado.findByContratist", query = "SELECT e FROM Empleado e WHERE e.contratista = :idContratista"), 
    @NamedQuery(name = "Empleado.findPlanta", query = "SELECT e FROM Empleado e WHERE e.contratista is null"),
    @NamedQuery(name = "Empleado.findEmpleadoActivo", query = "SELECT e FROM Empleado e WHERE e.numId =:numId AND e.activo = true")
})
public class Empleado implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Basic(optional = false)
    @Column(name = "num_id")
    private long numId;
    @Basic(optional = false)
    @Column(name = "nombres_apellidos")
    private String nombresApellidos;
    @Column(name = "foto")
    private String foto;
    
    @Column(name = "ruta_cert_cm")
    private String rutaCertCm;
    @Column(name = "ruta_cert_ta")
    private String rutaCertTA;
    
    @Column(name = "telefono")
    private String telefono;
    @Column(name = "tipo_sangre")
    private String tipoSangre;
    @Column(name = "eps")
    private String eps;
    @Column(name = "observaciones")
    private String observaciones;
    
    @Basic(optional = false)
    @Column(name = "betado")
    private Boolean betado = false;
    @Basic(optional = false)
    @Column(name = "restricciones_medicas")
    private Boolean restriccionesMedicas = false;
    @Basic(optional = false)
    @Column(name = "certificado_medico")
    private Boolean certificadoMedico = false;
    @Basic(optional = false)
    @Column(name = "trabajo_alturas")
    private Boolean trabajoAlturas = false;
    @Basic(optional = false)
    @Column(name = "cual_rest_medica")
    private String cualRestMedica;
    
    
    
    @Column(name = "activo")
    private Boolean activo = false;
    @Basic(optional = false)
    @Column(name = "usuario")
    private String usuario;
    @Column(name = "mail")
    private String mail;
    @Column(name = "fecha_induccion")
    @Temporal(TemporalType.DATE)
    private Date fechaInduccion;
    
    
    @JoinColumn(name = "id_contratista", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Contratista contratista;
    
    @OneToMany(mappedBy = "empleado", fetch = FetchType.LAZY, cascade=CascadeType.MERGE)
    private List<CertificadosEmp> certificados;
    
    @Transient
    private String extCTA;
    
    @Transient
    private InputStream certTrabAlt;
    
    @Transient 
    private String extCM;
    
    @Transient
    private InputStream certMedico;

    @Transient
    private String pwd;

    public Empleado() {
    }

    public Empleado(Long id) {
        this.id = id;
    }

    public Empleado(Long id, long numId, String nombresApellidos) {
        this.id = id;
        this.numId = numId;
        this.nombresApellidos = nombresApellidos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getNumId() {
        return numId;
    }

    public void setNumId(long numId) {
        this.numId = numId;
    }

    public String getNombresApellidos() {
        return nombresApellidos;
    }

    public void setNombresApellidos(String nombresApellidos) {
        this.nombresApellidos = nombresApellidos;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }


    public Contratista getContratista() {
        return contratista;
    }

    public void setContratista(Contratista fkContratistasId) {
        this.contratista = fkContratistasId;
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
        if (!(object instanceof Empleado)) {
            return false;
        }
        Empleado other = (Empleado) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return numId+" - "+nombresApellidos;
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
     * @return the certificados
     */
    public List<CertificadosEmp> getCertificados() {
        return certificados;
    }

    /**
     * @param certificados the certificados to set
     */
    public void setCertificados(List<CertificadosEmp> certificados) {
        this.setCertificados(certificados);
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the tipoSangre
     */
    public String getTipoSangre() {
        return tipoSangre;
    }

    /**
     * @param tipoSangre the tipoSangre to set
     */
    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    /**
     * @return the eps
     */
    public String getEps() {
        return eps;
    }

    /**
     * @param eps the eps to set
     */
    public void setEps(String eps) {
        this.eps = eps;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @return the betado
     */
    public Boolean getBetado() {
        return betado;
    }

    /**
     * @param betado the betado to set
     */
    public void setBetado(Boolean betado) {
        this.betado = betado;
    }

    /**
     * @return the fechaInduccion
     */
    public Date getFechaInduccion() {
        return fechaInduccion;
    }

    /**
     * @param fechaInduccion the fechaInduccion to set
     */
    public void setFechaInduccion(Date fechaInduccion) {
        this.fechaInduccion = fechaInduccion;
    }

    /**
     * @return the restriccionesMedicas
     */
    public Boolean getRestriccionesMedicas() {
        return restriccionesMedicas;
    }

    /**
     * @param restriccionesMedicas the restriccionesMedicas to set
     */
    public void setRestriccionesMedicas(Boolean restriccionesMedicas) {
        this.restriccionesMedicas = restriccionesMedicas;
    }

    /**
     * @return the certificadoMedico
     */
    public Boolean getCertificadoMedico() {
        return certificadoMedico;
    }

    /**
     * @param certificadoMedico the certificadoMedico to set
     */
    public void setCertificadoMedico(Boolean certificadoMedico) {
        this.certificadoMedico = certificadoMedico;
    }

    /**
     * @return the trabajoAlturas
     */
    public Boolean getTrabajoAlturas() {
        return trabajoAlturas;
    }

    /**
     * @param trabajoAlturas the trabajoAlturas to set
     */
    public void setTrabajoAlturas(Boolean trabajoAlturas) {
        this.trabajoAlturas = trabajoAlturas;
    }

    /**
     * @return the rutaCertCm
     */
    public String getRutaCertCm() {
        return rutaCertCm;
    }

    /**
     * @param rutaCertCm the rutaCertCm to set
     */
    public void setRutaCertCm(String rutaCertCm) {
        this.rutaCertCm = rutaCertCm;
    }

    /**
     * @return the rutaCertTA
     */
    public String getRutaCertTA() {
        return rutaCertTA;
    }

    /**
     * @param rutaCertTA the rutaCertTA to set
     */
    public void setRutaCertTA(String rutaCertTA) {
        this.rutaCertTA = rutaCertTA;
    }

    /**
     * @return the cualRestMedica
     */
    public String getCualRestMedica() {
        return cualRestMedica;
    }

    /**
     * @param cualRestMedica the cualRestMedica to set
     */
    public void setCualRestMedica(String cualRestMedica) {
        this.cualRestMedica = cualRestMedica;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
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

    /**
     * @return the certTrabAlt
     */
    public InputStream getCertTrabAlt() {
        return certTrabAlt;
    }

    /**
     * @param certTrabAlt the certTrabAlt to set
     */
    public void setCertTrabAlt(InputStream certTrabAlt) {
        this.certTrabAlt = certTrabAlt;
    }

    /**
     * @return the certMedico
     */
    public InputStream getCertMedico() {
        return certMedico;
    }

    /**
     * @param certMedico the certMedico to set
     */
    public void setCertMedico(InputStream certMedico) {
        this.certMedico = certMedico;
    }

    /**
     * @return the extCTA
     */
    public String getExtCTA() {
        return extCTA;
    }

    /**
     * @param extCTA the extCTA to set
     */
    public void setExtCTA(String extCTA) {
        this.extCTA = extCTA;
    }

    /**
     * @return the extCM
     */
    public String getExtCM() {
        return extCM;
    }

    /**
     * @param extCM the extCM to set
     */
    public void setExtCM(String extCM) {
        this.extCM = extCM;
    }

    /**
     * @return the mail
     */
    public String getMail() {
        return mail;
    }

    /**
     * @param mail the mail to set
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    
}
