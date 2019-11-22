package com.ingelaj.bd.entidades;


import java.sql.Time;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuario
 * @param idServicio corresponde al codigo de identificacion del servicio
 * @param tipoServicio puede ser acompañamiento a citas, con enfermero, con mascota
 * @param duracion del servicio
 * @param cedula_Enfermero es el documento de identificacion del enfermero
 * @param cedula_Paciente es el documento de identificacion del paciente
 * @param fecha es la fecha en la que se realizara el servicio
 * @param hora del servicio establecido
 * @param estado del servicio "Activo" o "Cancelado"
 */
public class Servicio {
    private String idServicio = "";
    private String tipoServicio = "";
    private int duracion = 0;
    private String cedula_Enfermero = "";
    private String cedula_Paciente = "";
    private Date fecha; 
    private Time hora;
    private String estado = "";
    
    public Servicio(){
        
    }
    
    public Servicio (String idServicio, String tipoServicio, int duracion, 
        String cedula_Enfermero, String cedula_Paciente, Date fecha,
        Time hora, String estado){
        this.idServicio = idServicio;
        this.tipoServicio = tipoServicio;
        this.duracion = duracion;
        this.cedula_Enfermero = cedula_Enfermero;
        this.cedula_Paciente = cedula_Paciente;
        this.fecha = fecha;
        this.hora = hora;
        this.estado = estado;  
    }
    /**
     * @return the idServicio
     */
    public String getIdServicio() {
        return idServicio;
    }

    /**
     * @param idServicio the idServicio to set
     */
    public void setIdServicio(String idServicio) {
        this.idServicio = idServicio;
    }

    /**
     * @return the tipoServicio
     */
    public String getTipoServicio() {
        return tipoServicio;
    }

    /**
     * @param tipoServicio the tipoServicio to set
     */
    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    /**
     * @return the duracion
     */
    public int getDuracion() {
        return duracion;
    }

    /**
     * @param duracion the duracion to set
     */
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    /**
     * @return the cedula_Enfermero
     */
    public String getCedula_Enfermero() {
        return cedula_Enfermero;
    }

    /**
     * @param cedula_Enfermero the cedula_Enfermero to set
     */
    public void setCedula_Enfermero(String cedula_Enfermero) {
        this.cedula_Enfermero = cedula_Enfermero;
    }

    /**
     * @return the cedula_Paciente
     */
    public String getCedula_Paciente() {
        return cedula_Paciente;
    }

    /**
     * @param cedula_Paciente the cedula_Paciente to set
     */
    public void setCedula_Paciente(String cedula_Paciente) {
        this.cedula_Paciente = cedula_Paciente;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the hora
     */
    public Time getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(Time hora) {
        this.hora = hora;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
}
