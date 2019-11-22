/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ingelaj.bd.servicio;

import com.ingelaj.bd.dao.ServicioDao;
import com.ingelaj.bd.entidades.Servicio;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ServicioService {
    private ServicioDao servicioDao;
    
    public ServicioService (){
        servicioDao = new ServicioDao();
    }
    
    public List<Servicio> getAll(){
        return servicioDao.getAll();
    }
    
    public Servicio get(Servicio servicio){
        return servicioDao.get(servicio.getIdServicio(),
                servicio.getTipoServicio(), servicio.getDuracion(), 
                servicio.getCedula_Enfermero(), servicio.getCedula_Paciente(), 
                (Date) servicio.getFecha(), servicio.getHora(), 
                servicio.getEstado());
    }
}
