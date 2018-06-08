<%-- 
    Document   : supplierView
    Created on : Apr 11, 2018, 4:57:40 PM
    Author     : Ranul Deepanayake
--%>

<%--
Get the userId of the selected supplier.
Get the project ID of the selected project.
//Change visibility of the 'Add to Project button'.
--%>

<%@page import="java.sql.*"%>
<%@page import="javaeeproject.DatabaseConnection"%>
<%@page import="javaeeproject.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    //Declaring variables for global use.
    DatabaseConnection databaseConnection;
    Statement statement;
    ResultSet resultSet;
    boolean isSupplierInProject;
    
    int userId;
    int projectId;
    int clientId;
%>
<%
    if(request.getParameter("userId")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;} //The supplier's user ID.
    if(request.getParameter("projectId")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;} //The project ID.
    if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The client's user ID.
    
    userId= Integer.parseInt(request.getParameter("userId"));
    projectId= Integer.parseInt(request.getParameter("projectId"));
    clientId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
    
    //userId= 1;
    //projectId= 1;
    //clientId= 2;
    
    try{
        databaseConnection= new DatabaseConnection();
        statement= databaseConnection.getConnection().createStatement();
        resultSet= statement.executeQuery("select * from user where userId="+ userId);
        
        //Check whether a supplier is already in a selected project. Used to disable the add to project button.
        Project project= new Project();
        isSupplierInProject= project.isSupplierInProject(projectId, userId);
    }
    catch(ClassNotFoundException e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
    catch(SQLException e){response.sendRedirect("generalErrors.jsp?error=2"); return;}
    catch(Exception e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
    
    if(!resultSet.isBeforeFirst()){response.sendRedirect("generalErrors.jsp?error=3"); return;}
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction Project Application</title>
         
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="commonStyles.css">
    </head>
    
    <body>
        <%@include file= "header.jsp" %>
        
        <h1 align="center">Supplier Details</h1>
        
        <%!
            //Declaring variables for global use.
            //int userId;
            String userName;
            String firstName;
            String lastName;
            String email;
            String address;
            String telephoneNumber;
            //String password;
            String userType;
            String city;
            String supplierCategory;
            String supplierDescription;
        %>
        <%
            //Assigning values from the Database to the variables.
            try{
                resultSet.next();
                userId= resultSet.getInt("userId");
                userName= resultSet.getString("userName");
                firstName= resultSet.getString("firstName");
                lastName= resultSet.getString("lastName");
                email= resultSet.getString("email");
                address= resultSet.getString("address");
                telephoneNumber= resultSet.getString("telephoneNumber");
                userType= resultSet.getString("userType");
                city= resultSet.getString("city");
                supplierCategory= resultSet.getString("supplierCategory");
                supplierDescription= resultSet.getString("supplierDescription");
            }
            catch(Exception e){response.sendRedirect("generalErrors.jsp?error=2"); return;}    
        %>
        
        <div class="container" style=" border: 1px solid white; width: 75%; margin-top: 30px;">
            <table class="table1" style="margin-left: 200px;">
                <tr><td>Supplier Name</td><td><%= firstName %> <%= lastName %></td></tr>
                <tr><td>Category</td><td><%= supplierCategory %></td></tr>
                <tr><td>Description</td><td><%= supplierDescription %> </td></tr>
                <tr><td>City</td><td><%= city %></td></tr>
                <tr><td>Email</td><td><%= email %></td></tr>
                <tr><td>Telephone Number</td><td><%= telephoneNumber %></td></tr>
                <tr><td>Address</td><td><%= address %></td></tr>
                <tr><td>User Name</td><td><%= userName %></td></tr>
            </table>
            <div class="container" style="border: 1px solid white; float: right; width: 150px; margin-top: -220px; margin-right: 150px;">
                <a href="newThread.jsp?receiverId=<%= userId %>&projectId=<%= projectId %>"><button class="btn btn-primary button1">Message</button></a><br>
                <%
                    if(isSupplierInProject== true){
                        out.print("<a href='#'><button class='btn btn-danger button1' style='margin-top: 20px;'>Remove from Project</button></a>");
                    }
                    else{
                        out.print("<a href='AddToProjectServlet?supplierId=" + userId+ "&projectId=" + projectId+ "'><button class='btn btn-success button1' style='margin-top: 20px;'>Add to Project</button></a>");
                    }
                %>    
            </div>
        </div>
    </body>
</html>
