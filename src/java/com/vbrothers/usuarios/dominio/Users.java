/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vbrothers.usuarios.dominio;

import java.io.Serializable;
import java.util.List;
import java.util.Set;
import javax.persistence.*;

/**
 *
 * @author jerviver21
 */
@Entity
@Table(name = "users")
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findUserByUsr", query = "SELECT u FROM Users u WHERE u.usr = :usr")
})
public class Users implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Basic(optional = false)
    @Column(name = "usr")
    private String usr;
    @Basic(optional = false)
    @Column(name = "pwd")
    private String pwd = "";
    @Basic(optional = false)
    @Column(name = "estado")
    private int estado = 1;
    @ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.MERGE)
    @JoinTable(name="user_group",
            joinColumns=@JoinColumn(name="id_user", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="id_group",referencedColumnName="id"))
    private List<Groups> grupos;
    
    @Transient
    private Set<Resource> recursosUsr;

    @Transient
    private Set<String> roles;

    @Transient
    private Set<String> gruposUsr;
    
    /**
     * @return the grupos
     */
    public List<Groups> getGrupos() {
        return grupos;
    }

    /**
     * @param grupos the grupos to set
     */
    public void setGrupos(List<Groups> grupos) {
        this.grupos = grupos;
    }

    public Users() {
    }

    public Users(Long id) {
        this.id = id;
    }

    public Users(Long id, String usr, String pwd, int estado) {
        this.id = id;
        this.usr = usr;
        this.pwd = pwd;
        this.estado = estado;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
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
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vbrothers.permisostrabajo.dominio.Users[ id=" + id + " ]";
    }

    /**
     * @return the recursosUsr
     */
    public Set<Resource> getRecursosUsr() {
        return recursosUsr;
    }

    /**
     * @param recursosUsr the recursosUsr to set
     */
    public void setRecursosUsr(Set<Resource> recursosUsr) {
        this.recursosUsr = recursosUsr;
    }

    /**
     * @return the rol
     */
    public Set<String> getRoles() {
        return roles;
    }

    /**
     * @param rol the rol to set
     */
    public void setRoles(Set<String> rol) {
        this.roles = rol;
    }

    /**
     * @return the gruposUsr
     */
    public Set<String> getGruposUsr() {
        return gruposUsr;
    }

    /**
     * @param gruposUsr the gruposUsr to set
     */
    public void setGruposUsr(Set<String> gruposUsr) {
        this.gruposUsr = gruposUsr;
    }

    


    
}
