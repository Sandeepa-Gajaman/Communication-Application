<%-- 
    Document   : newMessage 
    Created on : Apr 25, 2018, 6:23:45 PM
    Author     : Ranul Deepanayake
    Creates a new message thread between a client and a supplier.
--%>

<%@page import="java.sql.*"%>
<%@page import="javaeeproject.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    //Declaring variables for global use.
    DatabaseConnection databaseConnection;
    Statement statement;
    ResultSet resultSet;
    
    int receiverId;
    int projectId;
    int senderId;
%>
<%
    if(request.getParameter("receiverId")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;} //The receiver's user ID.
    if(request.getParameter("projectId")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;} //The project ID.
    if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The sender's user ID.
    
    receiverId= Integer.parseInt(request.getParameter("receiverId"));
    projectId= Integer.parseInt(request.getParameter("projectId"));
    senderId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
    
    //receiverId= 1;
    //projectId= 1;
    //senderId= 2;
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
        
        <center>
        <form enctype= "multipart/form-data" method="post" action="NewThreadServlet" style="width: 500px; margin-top: 30px;">
            <div class="form-group">
                <label for="threadTitle">Title</label>
                <input class="form-control" type="text" id="threadTitle" name="threadTitle">
            </div> 
            <div class="form-group" style="margin-top: 30px;">
                <label for="messageContent">Message</label>
                <textarea class="form-control" name="messageContent" rows="5" cols="50"></textarea>
            </div>
            <div class="form-group">
                <label for="image">Image (Optional. *Maximum size- 5 MB)</label>
                <input class="form-control" type="file" id="image" name="image" multiple="false">
            </div> 
            <input type="hidden" name="receiverId" value= <%= receiverId %> >
            <input type="hidden" name="senderId" value= <%= senderId %> >
            <input type="hidden" name="projectId" value= <%= projectId %> >
            <button class="btn btn-success button1" type="submit" value="Submit" name="submit" style="margin-top: 30px;">Submit</button>
        </form>
        </center>   
        
    </body>
</html>
