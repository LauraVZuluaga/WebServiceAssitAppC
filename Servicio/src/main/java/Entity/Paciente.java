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
@Table(name = "paciente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Paciente.findAll", query = "SELECT p FROM Paciente p")
    , @NamedQuery(name = "Paciente.findByCedula", query = "SELECT p FROM Paciente p WHERE p.cedula = :cedula")
    , @NamedQuery(name = "Paciente.findByNombre", query = "SELECT p FROM Paciente p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Paciente.findByApellido", query = "SELECT p FROM Paciente p WHERE p.apellido = :apellido")
    , @NamedQuery(name = "Paciente.findByEdad", query = "SELECT p FROM Paciente p WHERE p.edad = :edad")
    , @NamedQuery(name = "Paciente.findByDireccion", query = "SELECT p FROM Paciente p WHERE p.direccion = :direccion")
    , @NamedQuery(name = "Paciente.findByTelefono", query = "SELECT p FROM Paciente p WHERE p.telefono = :telefono")
    , @NamedQuery(name = "Paciente.findByFechaNacimiento", query = "SELECT p FROM Paciente p WHERE p.fechaNacimiento = :fechaNacimiento")
    , @NamedQuery(name = "Paciente.findByGenero", query = "SELECT p FROM Paciente p WHERE p.genero = :genero")
    , @NamedQuery(name = "Paciente.findByInvalidez", query = "SELECT p FROM Paciente p WHERE p.invalidez = :invalidez")
    , @NamedQuery(name = "Paciente.findByAlergias", query = "SELECT p FROM Paciente p WHERE p.alergias = :alergias")
    , @NamedQuery(name = "Paciente.findByRh", query = "SELECT p FROM Paciente p WHERE p.rh = :rh")
    , @NamedQuery(name = "Paciente.findByPCoronarios", query = "SELECT p FROM Paciente p WHERE p.pCoronarios = :pCoronarios")
    , @NamedQuery(name = "Paciente.findByDescripcionPaciente", query = "SELECT p FROM Paciente p WHERE p.descripcionPaciente = :descripcionPaciente")})
public class Paciente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "cedula")
    private String cedula;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apellido")
    private String apellido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "edad")
    private int edad;
    @Size(max = 60)
    @Column(name = "direccion")
    private String direccion;
    @Size(max = 15)
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_nacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    @Basic(optional = false)
    @NotNull
    @Column(name = "genero")
    private Character genero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "invalidez")
    private String invalidez;
    @Size(max = 100)
    @Column(name = "alergias")
    private String alergias;
    @Size(max = 3)
    @Column(name = "rh")
    private String rh;
    @Size(max = 80)
    @Column(name = "p_Coronarios")
    private String pCoronarios;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "descripcion_Paciente")
    private String descripcionPaciente;
    @OneToMany(mappedBy = "cedulaPaciente")
    private Collection<Servicio> servicioCollection;
    @JoinColumn(name = "email", referencedColumnName = "email")
    @ManyToOne(optional = false)
    private CuentaUsuario email;

    public Paciente() {
    }

    public Paciente(String cedula) {
        this.cedula = cedula;
    }

    public Paciente(String cedula, String nombre, String apellido, int edad, Date fechaNacimiento, Character genero, String invalidez, String descripcionPaciente) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
        this.invalidez = invalidez;
        this.descripcionPaciente = descripcionPaciente;
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

    public String getInvalidez() {
        return invalidez;
    }

    public void setInvalidez(String invalidez) {
        this.invalidez = invalidez;
    }

    public String getAlergias() {
        return alergias;
    }

    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }

    public String getRh() {
        return rh;
    }

    public void setRh(String rh) {
        this.rh = rh;
    }

    public String getPCoronarios() {
        return pCoronarios;
    }

    public void setPCoronarios(String pCoronarios) {
        this.pCoronarios = pCoronarios;
    }

    public String getDescripcionPaciente() {
        return descripcionPaciente;
    }

    public void setDescripcionPaciente(String descripcionPaciente) {
        this.descripcionPaciente = descripcionPaciente;
    }

    @XmlTransient
    public Collection<Servicio> getServicioCollection() {
        return servicioCollection;
    }

    public void setServicioCollection(Collection<Servicio> servicioCollection) {
        this.servicioCollection = servicioCollection;
    }

    public CuentaUsuario getEmail() {
        return email;
    }

    public void setEmail(CuentaUsuario email) {
        this.email = email;
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
        if (!(object instanceof Paciente)) {
            return false;
        }
        Paciente other = (Paciente) object;
        if ((this.cedula == null && other.cedula != null) || (this.cedula != null && !this.cedula.equals(other.cedula))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Paciente[ cedula=" + cedula + " ]";
    }
    
}
