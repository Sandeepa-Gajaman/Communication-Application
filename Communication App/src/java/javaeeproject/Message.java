package javaeeproject;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.InputStream;

/**
 *  
 * @author Ranul Deepanayake
 * Contains all methods required to handle message threads.
 */
public class Message {
    
    private Connection connection;
    private ResultSet resultSet;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private DatabaseConnection databaseConnection;
    
    public Message(){
        databaseConnection= new DatabaseConnection();
    }
    
    public void createNewThread(int projectId, int senderId, int receiverId, String title, String message, String image) throws ClassNotFoundException, SQLException, Exception{
        //Insert the new thread.
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("insert into thread (projectId, userId, receiverId, title, date, time) values (?, ?, ?, ?, ?, ?)");
        preparedStatement.setInt(1, projectId);
        preparedStatement.setInt(2, senderId);
        preparedStatement.setInt(3, receiverId);
        preparedStatement.setString(4, title);
        preparedStatement.setString(5, setDate());
        preparedStatement.setString(6, setTime());
        preparedStatement.executeUpdate();
        
        //Get the newly created thread ID.
        connection= databaseConnection.getConnection();
        statement= connection.createStatement();
        resultSet= statement.executeQuery("select threadId from thread order by threadId desc limit 1");
        resultSet.next();
        int threadId= resultSet.getInt(1);
        
        //Insert the new message relating to the new thread.
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("insert into message (threadId, userId, message, image, date, time) values (?, ?, ?, ?, ?, ?)");
        preparedStatement.setInt(1, threadId);
        preparedStatement.setInt(2, senderId);
        preparedStatement.setString(3, message);
        preparedStatement.setString(4, image);                       
        preparedStatement.setString(5, setDate());
        preparedStatement.setString(6, setTime());
        preparedStatement.executeUpdate();
    }
    
    public void createNewMessage(int threadId, int senderId, String message, String image) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("insert into message (threadId, userId, message, image, date, time) values (?, ?, ?, ?, ?, ?)");
        preparedStatement.setInt(1, threadId);
        preparedStatement.setInt(2, senderId);
        preparedStatement.setString(3, message);
        preparedStatement.setString(4, image);                       
        preparedStatement.setString(5, setDate());
        preparedStatement.setString(6, setTime());
        preparedStatement.executeUpdate();
    }
    
    public ResultSet viewAllThreads(int projectId, int userId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from thread where projectId= ? and userId= ? order by status desc, date desc, time desc");
        preparedStatement.setInt(1, projectId);
        preparedStatement.setInt(2, userId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet viewMessagesInThread(int threadId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from message where threadId= ? order by date, time desc");
        preparedStatement.setInt(1, threadId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet getThreadTitle(int threadId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select title from thread where threadId= ?");
        preparedStatement.setInt(1, threadId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet getThreadViewer(int threadId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select receiverId from thread where threadId= ?");
        preparedStatement.setInt(1, threadId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public void setThreadAsRead(int threadId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("update thread set status= 0 where threadId= ?");
        preparedStatement.setInt(1, threadId);
        preparedStatement.executeUpdate();
    }
    
    public void setThreadAsUnread(int threadId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("update thread set status= 1 where threadId= ?");
        preparedStatement.setInt(1, threadId);
        preparedStatement.executeUpdate();
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
    
    private int getLastThreadId(){
        //connection= databaseConnection.getConnection();
        return 1;
    }
    
    public ResultSet viewProjectAllThreads(int projectId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from thread where projectId= ? order by status desc, date desc, time desc");
        preparedStatement.setInt(1, projectId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet viewProjectUnreadThreads(int projectId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from thread where projectId= ? and status= 1 order by date, time desc");
        preparedStatement.setInt(1, projectId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet viewUserAllThreads(int userId, int receiverId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from thread where userId= ? or receiverId= ? order by date, time desc");
        preparedStatement.setInt(1, userId);
        preparedStatement.setInt(2, receiverId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet viewUserUnreadThreads(int userId, int receiverId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from thread where (userId= ? or receiverId= ?) and status= 1 order by date, time desc");
        preparedStatement.setInt(1, userId);
        preparedStatement.setInt(2, receiverId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    //Unread message method with limit.
    public ResultSet getUserUnreadThread(int userId) throws ClassNotFoundException, SQLException, Exception{
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from thread where (userId= ? or receiverId= ?) and status= 1 limit 5");
        preparedStatement.setInt(1,userId);
        preparedStatement.setInt(2,userId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    
    public ResultSet getProjectDetails(int projectId)  throws ClassNotFoundException, SQLException, Exception
    {
         connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from project where projectId= ?");
        preparedStatement.setInt(1, projectId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    public ResultSet getSupplierProjectDetails(int projectId)  throws ClassNotFoundException, SQLException, Exception
    {
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from supplierproject where projectId= ?");
        preparedStatement.setInt(1, projectId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
    public ResultSet getSupplierDetails(int userId)  throws ClassNotFoundException, SQLException, Exception
    {
        connection= databaseConnection.getConnection();
        preparedStatement= connection.prepareStatement("select * from user where userId= ?");
        preparedStatement.setInt(1, userId);
        resultSet= preparedStatement.executeQuery();
        return resultSet;
    }
}
