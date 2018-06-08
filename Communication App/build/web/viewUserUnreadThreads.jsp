<%-- 
    Document   : viewUserUnreadThreads
    Created on : May 12, 2018, 2:51:30 PM
    Author     : Ranul Deepanayake
--%>
<%--
Get the userId and receiverId.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javaeeproject.Message"%>
<!DOCTYPE html>
<%! 
    ResultSet resultSet;
    int userId;
    //int receiverId;   Kept just in case.
    String status;
    int threadId;
%>
<%
    if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The user's user ID.
    userId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
    
    //userId= 1;
    //receiverId= 2; Kept just in case.
    
    try{
        Message message= new Message();
        resultSet= message.viewUserUnreadThreads(userId, userId);
    }
    catch(ClassNotFoundException e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
    catch(SQLException e){response.sendRedirect("generalErrors.jsp?error=2"); return;}
    catch(Exception e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
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
        <script src="commonScripts.js"></script>
    </head>
    <body>
        <%@include file= "header.jsp" %>
        
        <h1 align="center">All Unread Threads</h1>
        
        <center>
        <table class='table table-hover' style=" width: 60%; margin-top: 30px;">
            <tr><td>Title</td><td>Status</td><td>Date</td><td>Time</td></tr>
            <% 
                while(resultSet.next()){ 
                    if(resultSet.getInt(6)== 1){status= "Unread";}else if(resultSet.getInt(6)== 0){status= "Read";}
                    threadId= resultSet.getInt(1);
                    out.print("<tr class= 'clickable-row' data-href= 'viewThread.jsp?threadId="+ threadId +"'><td>"+ resultSet.getString(5)+"</td><td>" + status+ "</td><td>" + resultSet.getString(7)+"</td><td>" + resultSet.getString(8)+"</td></tr>");
                }
            %>       
        </table>
        </center>
        
    </body>
</html>