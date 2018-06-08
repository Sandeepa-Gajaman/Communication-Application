<%-- 
    Document   : clientDashboard
    Created on : May 12, 2018, 9:55:01 AM
    Author     : Sandeepa Gajaman
--%>

<%@page import="javaeeproject.Project"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javaeeproject.Message"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    ResultSet resultSet1;
    ResultSet resultSet2;
    int userId;
    int reciverId;
    int threadId;
    int projectId;
%>
<%
    if (session.getAttribute("clientid") == null) {
        response.sendRedirect("generalErrors.jsp?error=5");
        return;
    }  //The sender's user ID.
    userId = Integer.parseInt(String.valueOf(session.getAttribute("clientid")));

    //userId = 2;
    try {
        Message message = new Message();
        resultSet1 = message.getUserUnreadThread(userId);

        Project project = new Project();
        resultSet2 = project.getUserProjects(userId);
    } catch (ClassNotFoundException e) {
        response.sendRedirect("generalErrors.jsp?error=6");
        return;
    } catch (SQLException e) {
        response.sendRedirect("generalErrors.jsp?error=2");
        return;
    } catch (Exception e) {
        response.sendRedirect("generalErrors.jsp?error=6");
        return;
    }
%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Construction Project Application</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="commonScripts.js"></script>
        <link href="bgStyles.css" type="text/css" rel="stylesheet" />
    </head>

    <body>

        <%@include file= "header.jsp" %>


        <div class="container-fluid">
            <div id="h1Styl">
                <h1 align="center">Client Dashboard</h1><br>
            </div>

            <div>

                <div class="well" id="unreadM">
                    <center><label for="Chaat">Unread Messages</label></center>
                    <br>
                    <table class='table table-hover'id="unM">
                        <thead><tr><th>Title</th><th>Date</th><th>Time</th></tr></thead>
                                    <%                while (resultSet1.next()) {
                                            threadId = resultSet1.getInt(1);
                                            userId = resultSet1.getInt(3);
                                            reciverId = resultSet1.getInt(4);;
                                            out.print("<tr class= 'clickable-row' data-href= 'viewThread.jsp?threadId=" + threadId + "&userId=" + userId + "&reciverId=" + reciverId + "'><td>" + resultSet1.getString(5) + "</td><td>" + resultSet1.getString(7) + "</td><td>" + resultSet1.getString(8) + "</td></tr>");
                                        }
                                    %>  
                        <tr><td colspan="3" align="center"><a href="viewUserUnreadThreads.jsp" class="btn btn-primary" style= " text-align:center; padding: 10px 35px;">Check All Unread Messages</a></td></tr>
                        <tr><td colspan="3" align="center"><a href="viewUserAllThreads.jsp" class="btn btn-info" style= " text-align:center; padding: 10px 35px;">Check All Messages</a></td></tr>
                    </table>
                </div>

            </div>
            <div class="container">
                <div class="col-sm-9">
                    <div class="well" id="allProj">
                        <center><lable for="Proj"><b>All Projects</b></lable></center>
                        <br>
                        <table class='table table-hover'>
                            <thead><tr><th>Project ID</th><th>City</th><th>Budget</th><th>Start Date</th><th>Deadline</th><th>Description</th></tr></thead>
                                        <%
                                            while (resultSet2.next()) {
                                                projectId = resultSet2.getInt(1);
                                                userId = resultSet2.getInt(2);;
                                                out.print("<tr class= 'clickable-row' data-href= 'projectViewPage.jsp?projectId=" + projectId + "&userId=" + userId + "'><td>" + resultSet2.getString(1) + "</td><td>" + resultSet2.getString(3) + "</td><td>" + resultSet2.getString(4) + "</td><td>" + resultSet2.getString(5) + "</td><td>" + resultSet2.getString(6) + "</td><td>" + resultSet2.getString(7) + "</td><td colspan='6' align='center'>"+"<a href='DeleteProjectServlet?projectId=" + projectId + "' class='btn btn-danger' style= 'padding: 5px 25px;'>"+"Delete Project"+"</a></td></tr>");

                                            }
                                        %>
                            <tr><td colspan="6" align="center"><a href="AddProject.jsp" class="btn btn-success" style= "padding: 5px 25px;">Add Project</a></td></tr>
                        </table>
                    </div>
                </div>
            </div>


        </div> 

    </body>
</html>
