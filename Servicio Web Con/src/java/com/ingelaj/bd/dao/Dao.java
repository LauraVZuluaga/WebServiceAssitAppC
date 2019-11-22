/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ingelaj.bd.dao;

import java.sql.Connection;
//import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class Dao {
    private static String url = "jdbc:mysql://localhost:3306/assistsenior";
    private static String user = "root";
    private static String password = "root";
    
    public static Connection getConnection() {
        Connection connection = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            connection = DriverManager.getConnection(url, user, password);
        }
        catch(SQLException | ClassNotFoundException ex){
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }
    
}
