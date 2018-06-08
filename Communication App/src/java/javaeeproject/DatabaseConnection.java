/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaeeproject;
import java.sql.*;
/**
 *
 * @author Ranul Deepanayake
 */
public class DatabaseConnection {
    
    private String connectionString= "jdbc:mysql://localhost:3306/javaeeproject?useSSL=false";
    private String userName= "root", password= ""; 
    Connection connection;
    
    public DatabaseConnection(){}
    
    public Connection getConnection() throws ClassNotFoundException, SQLException, Exception{
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionString, userName, password);
        return connection;
    }
}
