/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vbrothers.permisostrabajo.dominio;

import com.vi.usuarios.dominio.Users;
import com.vbrothers.util.EtapaPermiso;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author Jerson Viveros
 */
@Entity
@Table(name = "permiso_trabajo")
@NamedQueries({
    @NamedQuery(name = "PermisoTrabajo.findAll", query = "SELECT p FROM PermisoTrabajo p")})
public class PermisoTrabajo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name = "otra_disciplina")
    private String otraDisciplina;

    @Column(name = "tarea")
    private String tarea;
    @Column(name = "fecha_hora_fin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHoraFin;
    @Column(name = "fecha_hora_ini")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHoraIni;

    @Column(name = "ejecutor_contratista")
    private Boolean ejecutorContratista;
    @Column(name = "usuario_creacion")
    private String usuarioCreacion;
    @Column(name = "fecha_hora_creacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHoraCreacion;
    @Column(name = "num_orden")
    private Long numOrden;

    @JoinColumn(name = "id_disciplina", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Disciplina disciplina;
    @JoinColumn(name = "id_estado_permiso", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private EstadoPermiso estadoPermiso;
    @JoinColumn(name = "id_estado_anterior", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private EstadoPermiso estadoAnterior;
    @JoinColumn(name = "id_equipo", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Equipo equipo;
    @JoinColumn(name = "id_sector", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Sector sector;
    @JoinColumn(name = "id_proyecto", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Proyecto proyecto;


    @OneToMany(cascade = CascadeType.ALL, mappedBy = "permiso", fetch = FetchType.LAZY)
    private List<Tarea> tareas;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "permisoTrabajo", fetch = FetchType.LAZY)
    private List<TrazabilidadPermiso> trazabilidadPermisos;
    
    

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="sectores_afectados_permiso",
            joinColumns=@JoinColumn(name="id_permiso", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="id_sector",referencedColumnName="id"))
    private List<Sector> sectoresAfectados;
    
    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="empleados_permiso",
            joinColumns=@JoinColumn(name="id_permiso", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="id_empleado",referencedColumnName="id"))
    private List<Empleado> empleados;
    
    @JoinColumn(name = "id_contratista", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Contratista contratista;
    
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "permiso", fetch = FetchType.LAZY)
    private List<CertificadosTrabajo> certificados;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "permiso", fetch = FetchType.LAZY)
    private List<NotasPermiso> notas;
    
    
    @Column(name = "consideraciones")
    private String consideraciones;
    
   
    //Atributos que se requieren para guardar datos importantes del permiso de trabajo
    @Transient
    private EtapaPermiso etapa;
    
    @Transient
    private String notaGestion;
    
    @Transient 
    private Users usuario;
    
    @Transient
    private List<String> otrosAprobadores;

    
    public PermisoTrabajo(Users usr) {
        sector = new Sector(null);
        equipo = new Equipo(null);
        usuario = usr;
        empleados = new ArrayList<Empleado>();
    }


    public PermisoTrabajo() {
        sector = new Sector(null);
        equipo = new Equipo(null);
    }

    public PermisoTrabajo(Long id) {
        this.id = id;
    }
    
    public PermisoTrabajo(String usrCreador) {
        this.usuarioCreacion = usrCreador;
        sector = new Sector(null);
        equipo = new Equipo(null);
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOtraDisciplina() {
        return otraDisciplina;
    }

    public void setOtraDisciplina(String otraDisciplina) {
        this.otraDisciplina = otraDisciplina;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    public String getUsuarioCreacion() {
        return usuarioCreacion;
    }

    public void setUsuarioCreacion(String usuario) {
        this.usuarioCreacion = usuario;
    }

    public Date getFechaHoraCreacion() {
        return fechaHoraCreacion;
    }

    public void setFechaHoraCreacion(Date fechaHora) {
        this.fechaHoraCreacion = fechaHora;
    }


    public Long getNumOrden() {
        return numOrden;
    }

    public void setNumOrden(Long numOrden) {
        this.numOrden = numOrden;
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
        if (!(object instanceof PermisoTrabajo)) {
            return false;
        }
        PermisoTrabajo other = (PermisoTrabajo) object;
        if ((this.id == null && other.getId() != null) || (this.id != null && !this.id.equals(other.getId()))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Permiso [id=" + id + "]";
    }

    /**
     * @return the sectoresAfectados
     */
    public List<Sector> getSectoresAfectados() {
        return sectoresAfectados;
    }

    /**
     * @param sectoresAfectados the sectoresAfectados to set
     */
    public void setSectoresAfectados(List<Sector> sectoresAfectados) {
        this.sectoresAfectados = sectoresAfectados;
    }

    /**
     * @return the disciplina
     */
    public Disciplina getDisciplina() {
        return disciplina;
    }

    /**
     * @param disciplina the disciplina to set
     */
    public void setDisciplina(Disciplina disciplina) {
        this.disciplina = disciplina;
    }

    /**
     * @return the estadoPermiso
     */
    public EstadoPermiso getEstadoPermiso() {
        return estadoPermiso;
    }

    /**
     * @param estadoPermiso the estadoPermiso to set
     */
    public void setEstadoPermiso(EstadoPermiso estadoPermiso) {
        this.estadoPermiso = estadoPermiso;
    }

    /**
     * @return the equipo
     */
    public Equipo getEquipo() {
        return equipo;
    }

    /**
     * @param equipo the equipo to set
     */
    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }

    /**
     * @return the sector
     */
    public Sector getSector() {
        return sector;
    }

    /**
     * @param sector the sector to set
     */
    public void setSector(Sector sector) {
        this.sector = sector;
    }

    /**
     * @return the proyecto
     */
    public Proyecto getProyecto() {
        return proyecto;
    }

    /**
     * @param proyecto the proyecto to set
     */
    public void setProyecto(Proyecto proyecto) {
        this.proyecto = proyecto;
    }

    /**
     * @return the ejecutorContratista
     */
    public Boolean isEjecutorContratista() {
        return ejecutorContratista;
    }

    /**
     * @param ejecutorContratista the ejecutorContratista to set
     */
    public void setEjecutorContratista(Boolean ejecutorContratista) {
        this.ejecutorContratista = ejecutorContratista;
    }

    /**
     * @return the tareas
     */
    public List<Tarea> getTareas() {
        return tareas;
    }

    /**
     * @param tareas the tareas to set
     */
    public void setTareas(List<Tarea> tareas) {
        this.tareas = tareas;
    }

    /**
     * @return the trazabilidadPermisos
     */
    public List<TrazabilidadPermiso> getTrazabilidadPermisos() {
        return trazabilidadPermisos;
    }

    /**
     * @param trazabilidadPermisos the trazabilidadPermisos to set
     */
    public void setTrazabilidadPermisos(List<TrazabilidadPermiso> trazabilidadPermisos) {
        this.trazabilidadPermisos = trazabilidadPermisos;
    }

    /**
     * @return the fechaHoraFin
     */
    public Date getFechaHoraFin() {
        return fechaHoraFin;
    }

    /**
     * @param fechaHoraFin the fechaHoraFin to set
     */
    public void setFechaHoraFin(Date fechaHoraFin) {
        this.fechaHoraFin = fechaHoraFin;
    }

    /**
     * @return the fechaHoraIni
     */
    public Date getFechaHoraIni() {
        return fechaHoraIni;
    }

    /**
     * @param fechaHoraIni the fechaHoraIni to set
     */
    public void setFechaHoraIni(Date fechaHoraIni) {
        this.fechaHoraIni = fechaHoraIni;
    }

    /**
     * @return the estadoAnterior
     */
    public EstadoPermiso getEstadoAnterior() {
        return estadoAnterior;
    }

    /**
     * @param estadoAnterior the estadoAnterior to set
     */
    public void setEstadoAnterior(EstadoPermiso estadoAnterior) {
        this.estadoAnterior = estadoAnterior;
    }

    /**
     * @return the consideraciones
     */
    public String getConsideraciones() {
        return consideraciones;
    }

    /**
     * @param consideraciones the consideraciones to set
     */
    public void setConsideraciones(String consideraciones) {
        this.consideraciones = consideraciones;
    }

    /**
     * @return the certificados
     */
    public List<CertificadosTrabajo> getCertificados() {
        return certificados;
    }

    /**
     * @param certificados the certificados to set
     */
    public void setCertificados(List<CertificadosTrabajo> certificados) {
        this.certificados = certificados;
    }

    /**
     * @return the notas
     */
    public List<NotasPermiso> getNotas() {
        return notas;
    }

    /**
     * @param notas the notas to set
     */
    public void setNotas(List<NotasPermiso> notas) {
        this.notas = notas;
    }

    /**
     * @return the empleados
     */
    public List<Empleado> getEmpleados() {
        return empleados;
    }

    /**
     * @param empleados the empleados to set
     */
    public void setEmpleados(List<Empleado> empleados) {
        this.empleados = empleados;
    }

    /**
     * @return the contratista
     */
    public Contratista getContratista() {
        return contratista;
    }

    /**
     * @param contratista the contratista to set
     */
    public void setContratista(Contratista contratista) {
        this.contratista = contratista;
    }

    /**
     * @return the etapa
     */
    public EtapaPermiso getEtapa() {
        return etapa;
    }

    /**
     * @param etapa the etapa to set
     */
    public void setEtapa(EtapaPermiso etapa) {
        this.etapa = etapa;
    }

    /**
     * @return the notaGestion
     */
    public String getNotaGestion() {
        return notaGestion;
    }

    /**
     * @param notaGestion the notaGestion to set
     */
    public void setNotaGestion(String notaGestion) {
        this.notaGestion = notaGestion;
    }

    /**
     * @return the usuario
     */
    public Users getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Users usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the otrosAprobadores
     */
    public List<String> getOtrosAprobadores() {
        return otrosAprobadores;
    }

    /**
     * @param otrosAprobadores the otrosAprobadores to set
     */
    public void setOtrosAprobadores(List<String> otrosAprobadores) {
        this.otrosAprobadores = otrosAprobadores;
    }



}
