/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ingelaj.bd.dao;

import com.ingelaj.bd.entidades.Servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class ServicioDao {
    public List<Servicio> getAll(){
        List<Servicio> servicios = new ArrayList<Servicio>();
        
        try{
            Connection connection = Dao.getConnection();
            String query = "select * from servicio";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Servicio servicio;
            
            while(rs.next()){
                servicio = new Servicio(rs.getNString("idServicio"), 
                        rs.getNString("tipoServicio"),rs.getInt("duracion"), 
                        rs.getNString("cedula_Enfermero"),
                        rs.getNString("cedula_Paciente"), 
                        rs.getDate("fecha"), 
                        rs.getTime("hora"), rs.getNString("estado"));
            
                servicios.add(servicio);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicios;
    }
}
