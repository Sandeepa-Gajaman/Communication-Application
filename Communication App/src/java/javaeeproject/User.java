/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaeeproject;

/**
 *
 * @author Chusitha Lahiru
 */
import java.sql.*;
import java.util.*;

public class User {
    
    private Connection connection;
    private ResultSet resultSet;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private DatabaseConnection databaseConnection;
    
    private static final String USERNAME="root";
    private static final String PASSWORD="";
    private static final String CONN_STRING="jdbc:mysql://localhost:8080/javaeeproject";
    private static final  String SQL="UPDATE user(lastName,firstName,email,address,telephoneNumber,password) VALUES(?,?,?,?,?,?)";
    private static final  String SQL1="INSERT INTO user(userName,firstName,lastName,email,address,telephoneNumber,Password,userType,city,supplierCategory,supplierDescription) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

    String Username;
    String Firstname;
    String LastName;
    String dob;
    String password;
    String Telephone;
    String Email;
    String Address;
    String userId;
    String Description;
    String SupplierCategory;
    String Usertype;
    String City;

    public User(){
        databaseConnection= new DatabaseConnection();
    }
    
    public void setFirstname(String Firstname) {
        this.Firstname = Firstname;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

   /* public void setClienttype(String Clienttype) {
        this.Clienttype = Clienttype;
    }*/
    

    public void setTelephone(String Telephone) {
        this.Telephone = Telephone;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void setSupplierCategory(String SupplierCategory) {
        this.SupplierCategory = SupplierCategory;
    }

    public void setUsertype(String Usertype) {
        this.Usertype = Usertype;
    }
    
    int i=0;
    
  public int insert() throws ClassNotFoundException, SQLException 
      {
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet rst=null; //interface that will contain data returned from database
        Class.forName("com.mysql.jdbc.Driver");//load the driver class into memory
        try{
            
        con = DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
   
        stmt=con.prepareStatement(SQL,Statement.RETURN_GENERATED_KEYS);
        stmt.setString(2,LastName);
        stmt.setString(3, Firstname);
        stmt.setString(4, Email);
        stmt.setString(6,Address);
        stmt.setString(7, Telephone);
        stmt.setString(8,password);
        stmt.setString(1,userId);
      int affected=stmt.executeUpdate();
      if(affected==1)
      {
          
          i =1;
         /* rst=stmt.getGeneratedKeys();
          rst.next();
          int ID=rst.getInt(1);*/
         return i;

      }
     else
      {
             i =7;
            return i;
      }
     
      
        }
        catch(SQLException e)
        {
           // System.err.println(e);
        }
       finally
        {
            if(rst!=null)
            {
                rst.close();
            }
            if(stmt!=null)
            {
                stmt.close();
            }
            
            if(con!=null)
            {
                con.close();
            }
        }
        return i;
      }

    public ResultSet searchSupplierByCategory(String category) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from user where supplierCategory like concat ('%', ?, '%') and userType= 'supplier'");
        preparedStatement.setString(1, category);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet searchSupplierByCity(String city) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from user where city like concat ('%', ?, '%') and userType= 'supplier'");
        preparedStatement.setString(1, city);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet searchSupplierByUserName(String userName) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from user where userName like concat ('%', ?, '%') and userType= 'supplier'");
        preparedStatement.setString(1, userName);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    public ResultSet getUserDetails(int userId) throws SQLException, Exception
    {
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from user where userId=?");
        preparedStatement.setInt(1, userId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;   
    }
    
    public ResultSet userSignIn(String userName, String password) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select userId, userName, firstName, userType from user where userName= ? and password= ?");
        preparedStatement.setString(1, userName);
        preparedStatement.setString(2, password); 
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public int registerCustomer() throws SQLException, Exception
     {
        connection= databaseConnection.getConnection();
   
        PreparedStatement stmt=null;
        ResultSet rst=null; //interface that will contain data returned from database
        stmt=connection.prepareStatement(SQL1,Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, Username);
        stmt.setString(2, Firstname);
        stmt.setString(3,LastName);
        stmt.setString(4, Email);
        stmt.setString(5,Address);
        stmt.setString(6, Telephone);
        stmt.setString(7,password);
        stmt.setString(8, Usertype);
        stmt.setString(9, City);
        stmt.setString(10, SupplierCategory);
        stmt.setString(11, Description);
         int affected=stmt.executeUpdate();
      if(affected==1)
      { 
          i =1;
         return i;

      }
     else
      { i =7;
       return i;
      }
     }
}
