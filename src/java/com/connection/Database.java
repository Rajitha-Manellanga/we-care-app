/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.connection;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Rajitha
 */
public class Database {
    
    public static Connection setConnection() throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {

        Properties props = new Properties();
        FileInputStream in = new FileInputStream("/Users/Rajitha/Documents/Spring_MVC/TestApp/web/WEB-INF/jdbc.properties");
        props.load(in);
        in.close();

        String driverClassName = props.getProperty("jdbc.driver");
        if (driverClassName != null) {
            Class.forName(driverClassName);
        }

        String url = props.getProperty("jdbc.url");
        String username = props.getProperty("jdbc.username");
        String password = props.getProperty("jdbc.password");
        
        System.out.println(url+"_"+username+"_"+password);

        Connection con = DriverManager.getConnection(url, username, password);
        return con;
    }
    
}
