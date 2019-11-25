/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "cuenta_usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CuentaUsuario.findAll", query = "SELECT c FROM CuentaUsuario c")
    , @NamedQuery(name = "CuentaUsuario.findByEmail", query = "SELECT c FROM CuentaUsuario c WHERE c.email = :email")
    , @NamedQuery(name = "CuentaUsuario.findByPassword", query = "SELECT c FROM CuentaUsuario c WHERE c.password = :password")
    , @NamedQuery(name = "CuentaUsuario.findByEstado", query = "SELECT c FROM CuentaUsuario c WHERE c.estado = :estado")
    , @NamedQuery(name = "CuentaUsuario.findByTipo", query = "SELECT c FROM CuentaUsuario c WHERE c.tipo = :tipo")})
public class CuentaUsuario implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "estado")
    private String estado;
    @Column(name = "tipo")
    private Character tipo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "email")
    private Collection<Enfermero> enfermeroCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "email")
    private Collection<Paciente> pacienteCollection;

    public CuentaUsuario() {
    }

    public CuentaUsuario(String email) {
        this.email = email;
    }

    public CuentaUsuario(String email, String password, String estado) {
        this.email = email;
        this.password = password;
        this.estado = estado;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Character getTipo() {
        return tipo;
    }

    public void setTipo(Character tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public Collection<Enfermero> getEnfermeroCollection() {
        return enfermeroCollection;
    }

    public void setEnfermeroCollection(Collection<Enfermero> enfermeroCollection) {
        this.enfermeroCollection = enfermeroCollection;
    }

    @XmlTransient
    public Collection<Paciente> getPacienteCollection() {
        return pacienteCollection;
    }

    public void setPacienteCollection(Collection<Paciente> pacienteCollection) {
        this.pacienteCollection = pacienteCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (email != null ? email.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CuentaUsuario)) {
            return false;
        }
        CuentaUsuario other = (CuentaUsuario) object;
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.CuentaUsuario[ email=" + email + " ]";
    }
    
}
