package javaeeproject;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Ranul Deepanayake
 * Contains methods for projects.
 */
public class Project {
    
    private Connection connection;
    private ResultSet resultSet;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private DatabaseConnection databaseConnection;
    
    private static final String USERNAME="root";
      private static final String PASSWORD="";
      private static final String CONN_STRING="jdbc:mysql://localhost:3306/javaeeproject";
      private static final  String SQL="INSERT INTO project(userId,city,budget,startDate,deadline,description) VALUES(?,?,?,?,?,?)";

    
    public Project(){
        databaseConnection= new DatabaseConnection();
    }
    
    public void addSupplierToProject(int projectId, int supplierId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("insert into supplierproject (projectId, supplierId, date, time) values (?, ?, ?, ?)");
        preparedStatement.setInt(1, projectId);
        preparedStatement.setInt(2, supplierId);
        preparedStatement.setString(3, setDate());
        preparedStatement.setString(4, setTime());
        preparedStatement.executeUpdate();
    }
    
    public boolean isSupplierInProject(int projectId, int supplierId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select projectId from supplierproject where projectId= ? and supplierId= ?");
        preparedStatement.setInt(1, projectId);
        preparedStatement.setInt(2, supplierId);
        resultSet= preparedStatement.executeQuery();
        if(!resultSet.isBeforeFirst()){return false;}
        else{return true;}
    }
    
    private String setDate(){
        DateTimeFormatter dateTimeFormatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime localDateTime= LocalDateTime.now();
        return dateTimeFormatter.format(localDateTime);
    }
    
    private String setTime(){
        DateTimeFormatter dateTimeFormatter= DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDateTime localDateTime= LocalDateTime.now();
        return dateTimeFormatter.format(localDateTime);
    }
    
    public ResultSet getUserProjects(int userId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from project where userId= ? limit 5");
        preparedStatement.setInt(1,userId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    int budget;
    String city;
    String startDate;
    String deadline;
    String description;
    
    public void setbudget(int budget) {
        this.budget = budget;
    }
    
    public void setcity (String city) {
        this.city = city;
    }
    
    public void setstartDate (String startDate) {
        this.startDate = startDate;
    }
    
    public void setdeadline ( String deadline) {
        this.deadline = deadline;
    }
    
    public void setdescription ( String description) {
        this.description = description;
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
        stmt.setInt(1, userId);
        stmt.setString(2, city);
        stmt.setInt(3, budget);
        stmt.setString(4,startDate);
        stmt.setString(5, deadline);
        stmt.setString(6,description);

      int affected=stmt.executeUpdate();
      if(affected==1)
      {
          
          i =1;
        
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
           return i=9;// System.err.println(e);
        }
        catch(Exception e)
        {
            return 10;
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
       
      }
  
  int userId;

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public void deleteProject(int projectId) throws ClassNotFoundException, SQLException, Exception{
        int threadId= 0;
        //Get the thread IDs related to the project.
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select threadId from thread where projectId= ?");
        preparedStatement.setInt(1, projectId);
        resultSet= preparedStatement.executeQuery();
        
        //Delete all the messages corresponding to the retrieved thread IDs.
        while(resultSet.next()){
            threadId= resultSet.getInt(1);
            preparedStatement= connection.prepareStatement("delete from message where threadId= ?");
            preparedStatement.setInt(1, threadId);
            preparedStatement.executeUpdate();
        }
        
        //Delete all the threads corresponding to the project.
        preparedStatement= connection.prepareStatement("delete from thread where projectId= ?");
        preparedStatement.setInt(1, projectId);
        preparedStatement.executeUpdate();
        
        //Delete the project.
        preparedStatement= connection.prepareStatement("delete from project where projectId= ?");
        preparedStatement.setInt(1, projectId);
        preparedStatement.executeUpdate();
    }
}
