/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "servicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Servicio.findAll", query = "SELECT s FROM Servicio s")
    , @NamedQuery(name = "Servicio.findByIdServicio", query = "SELECT s FROM Servicio s WHERE s.idServicio = :idServicio")
    , @NamedQuery(name = "Servicio.findByTipoServicio", query = "SELECT s FROM Servicio s WHERE s.tipoServicio = :tipoServicio")
    , @NamedQuery(name = "Servicio.findByDuracion", query = "SELECT s FROM Servicio s WHERE s.duracion = :duracion")
    , @NamedQuery(name = "Servicio.findByFecha", query = "SELECT s FROM Servicio s WHERE s.fecha = :fecha")
    , @NamedQuery(name = "Servicio.findByHora", query = "SELECT s FROM Servicio s WHERE s.hora = :hora")
    , @NamedQuery(name = "Servicio.findByEstado", query = "SELECT s FROM Servicio s WHERE s.estado = :estado")})
public class Servicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 6)
    @Column(name = "idServicio")
    private String idServicio;
    @Size(max = 20)
    @Column(name = "tipoServicio")
    private String tipoServicio;
    @Column(name = "duracion")
    private Integer duracion;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    @Size(max = 20)
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "cedula_Enfermero", referencedColumnName = "cedula")
    @ManyToOne
    private Enfermero cedulaEnfermero;
    @JoinColumn(name = "cedula_Paciente", referencedColumnName = "cedula")
    @ManyToOne
    private Paciente cedulaPaciente;

    public Servicio() {
    }
    
    public Servicio(String idServicio, String tipoServicio, Integer duracion,
            Date fecha, Date hora, String estado, Enfermero cedulaEnfermero,
            Paciente cedulaPaciente){
        
        this.idServicio = idServicio;
        this.tipoServicio = tipoServicio;
        this.duracion = duracion;
        this.fecha = fecha;
        this.hora = hora;
        this.estado = estado;
        this.cedulaEnfermero= cedulaEnfermero;
        this.cedulaPaciente = cedulaPaciente;
        
    }

    public Servicio(String idServicio) {
        this.idServicio = idServicio;
    }

    public String getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(String idServicio) {
        this.idServicio = idServicio;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public Integer getDuracion() {
        return duracion;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Enfermero getCedulaEnfermero() {
        return cedulaEnfermero;
    }

    public void setCedulaEnfermero(Enfermero cedulaEnfermero) {
        this.cedulaEnfermero = cedulaEnfermero;
    }

    public Paciente getCedulaPaciente() {
        return cedulaPaciente;
    }

    public void setCedulaPaciente(Paciente cedulaPaciente) {
        this.cedulaPaciente = cedulaPaciente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idServicio != null ? idServicio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Servicio)) {
            return false;
        }
        Servicio other = (Servicio) object;
        if ((this.idServicio == null && other.idServicio != null) || (this.idServicio != null && !this.idServicio.equals(other.idServicio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Servicio[ idServicio=" + idServicio + " ]";
    }
    
}
