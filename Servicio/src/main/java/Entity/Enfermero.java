/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "enfermero")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Enfermero.findAll", query = "SELECT e FROM Enfermero e")
    , @NamedQuery(name = "Enfermero.findByCedula", query = "SELECT e FROM Enfermero e WHERE e.cedula = :cedula")
    , @NamedQuery(name = "Enfermero.findByNombre", query = "SELECT e FROM Enfermero e WHERE e.nombre = :nombre")
    , @NamedQuery(name = "Enfermero.findByApellido", query = "SELECT e FROM Enfermero e WHERE e.apellido = :apellido")
    , @NamedQuery(name = "Enfermero.findByEdad", query = "SELECT e FROM Enfermero e WHERE e.edad = :edad")
    , @NamedQuery(name = "Enfermero.findByDireccion", query = "SELECT e FROM Enfermero e WHERE e.direccion = :direccion")
    , @NamedQuery(name = "Enfermero.findByTelefono", query = "SELECT e FROM Enfermero e WHERE e.telefono = :telefono")
    , @NamedQuery(name = "Enfermero.findByFechaNacimiento", query = "SELECT e FROM Enfermero e WHERE e.fechaNacimiento = :fechaNacimiento")
    , @NamedQuery(name = "Enfermero.findByGenero", query = "SELECT e FROM Enfermero e WHERE e.genero = :genero")
    , @NamedQuery(name = "Enfermero.findByHojaVida", query = "SELECT e FROM Enfermero e WHERE e.hojaVida = :hojaVida")
    , @NamedQuery(name = "Enfermero.findByCertificado", query = "SELECT e FROM Enfermero e WHERE e.certificado = :certificado")})
public class Enfermero implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "cedula")
    private String cedula;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "apellido")
    private String apellido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "edad")
    private int edad;
    @Size(max = 50)
    @Column(name = "direccion")
    private String direccion;
    @Size(max = 20)
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaNacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    @Basic(optional = false)
    @NotNull
    @Column(name = "genero")
    private Character genero;
    @Size(max = 80)
    @Column(name = "hojaVida")
    private String hojaVida;
    @Size(max = 80)
    @Column(name = "certificado")
    private String certificado;
    @JoinColumn(name = "email", referencedColumnName = "email")
    @ManyToOne(optional = false)
    private CuentaUsuario email;
    @OneToMany(mappedBy = "cedulaEnfermero")
    private Collection<Servicio> servicioCollection;

    public Enfermero() {
    }

    public Enfermero(String cedula) {
        this.cedula = cedula;
    }

    public Enfermero(String cedula, String nombre, String apellido, int edad, Date fechaNacimiento, Character genero) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Character getGenero() {
        return genero;
    }

    public void setGenero(Character genero) {
        this.genero = genero;
    }

    public String getHojaVida() {
        return hojaVida;
    }

    public void setHojaVida(String hojaVida) {
        this.hojaVida = hojaVida;
    }

    public String getCertificado() {
        return certificado;
    }

    public void setCertificado(String certificado) {
        this.certificado = certificado;
    }

    public CuentaUsuario getEmail() {
        return email;
    }

    public void setEmail(CuentaUsuario email) {
        this.email = email;
    }

    @XmlTransient
    public Collection<Servicio> getServicioCollection() {
        return servicioCollection;
    }

    public void setServicioCollection(Collection<Servicio> servicioCollection) {
        this.servicioCollection = servicioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cedula != null ? cedula.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Enfermero)) {
            return false;
        }
        Enfermero other = (Enfermero) object;
        if ((this.cedula == null && other.cedula != null) || (this.cedula != null && !this.cedula.equals(other.cedula))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Enfermero[ cedula=" + cedula + " ]";
    }
    
}
