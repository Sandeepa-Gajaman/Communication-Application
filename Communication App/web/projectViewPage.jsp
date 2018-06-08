<%-- 
    Document   : projectAllMessages
    Created on : Apr 26, 2018, 8:45:54 PM
    Author     : Shamal Manawadu
    Shows all message threads of a selected project.
--%>
<%--
Get the projectId.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javaeeproject.Message"%>
<!DOCTYPE html>
<%!
    ResultSet resultSet;
    int projectId;
    String status;
    int threadId;
    int receiverId;
    int userId;
    ResultSet projectDetails;
    ResultSet SupplierIdDetails;
    ResultSet SupplierDetails;
    //int projectId;
%>
<%
    if (session.getAttribute("clientid") == null) {
        response.sendRedirect("generalErrors.jsp?error=5");
        return;
    }  //The sender's user ID.
    Message message = new Message();
    if (request.getParameter("projectId") == null) {
        response.sendRedirect("generalErrors.jsp?error=4");
    } else {
        projectId = Integer.parseInt(request.getParameter("projectId"));

    }
    // projectId= 1;

    try {

        resultSet = message.viewProjectUnreadThreads(projectId);
        projectDetails = message.getProjectDetails(projectId);
        SupplierIdDetails = message.getSupplierProjectDetails(projectId);

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
        <div class="row">
            <div class="col-sm-6"> 
                <div class="well">
                    <p><center>Project Details</center><p>
                    <hr>
                    <table class='table table-hover' style=" width: 60%; margin-top: 30px;">
                        <%                      
                            projectDetails.next();

                            //out.print("project id = "+projectDetails.getInt(1));
                            out.print("<tr><td>project id </td><td>" + projectDetails.getInt(1) + "</td></tr>");
                            //out.print("<br>");
                            out.print("<tr><td> city</td><td>" + projectDetails.getString(3) + "</td></tr>");
                            //out.println("city = "+projectDetails.getString(3));
                            //out.print("<br>");
                            out.print("<tr><td> budget </td><td>" + projectDetails.getString(4) + "</td></tr>");
                            //out.print("budget = "+projectDetails.getString(4));
                            //out.print("<br>");
                            out.print("<tr><td> start date </td><td>" + projectDetails.getString(5) + "</td></tr>");
                            //out.print("start date = "+projectDetails.getString(5));
                            // out.print("<br>");
                            out.print("<tr><td> description </td><td>" + projectDetails.getString(7) + "</td></tr>");
                            //out.print("description = "+projectDetails.getString(7));

                        %>
                    </table>
                </div>
            </div>
            <div class="col-sm-6">
                <center>
                    <h2>Suppliers in project</h2>
                    <table class='table table-hover' style=" width: 60%; margin-top: 30px;">
                        <tr><td>Supplier Name</td><td>Address</td><td>City</td><td>Supplier Category</td></tr>
                        <%                      while (SupplierIdDetails.next()) {
                                ResultSet supplierdetails = message.getSupplierDetails(SupplierIdDetails.getInt(2));
                                supplierdetails.next();
                                out.print("<tr class= 'clickable-row' data-href= 'supplierView.jsp?userId=" + supplierdetails.getInt(1) + "&projectId=" + projectId + "'><td>" + supplierdetails.getString(2) + "</td><td>" + supplierdetails.getString(6) + "</td><td>" + supplierdetails.getString(10) + "</td><td>" + supplierdetails.getString(11) + "</td></tr>");
                            }
                        %>
                    </table>
                </center>
            </div>

        </div>
        <div class="row">

            <div class="col-sm-6"> 
                <h2>Unread message in project</h2>


                <table class='table table-hover' style=" width: 60%; margin-top: 30px;">
                    <tr><td>Title</td><td>Status</td><td>Date</td><td>Time</td></tr>
                    <%                while (resultSet.next()) {
                            if (resultSet.getInt(6) == 1) {
                                status = "Unread";
                            } else if (resultSet.getInt(6) == 0) {
                                status = "Read";
                            }
                            threadId = resultSet.getInt(1);
                            out.print("<tr class= 'clickable-row' data-href= 'viewThread.jsp?threadId=" + threadId + "'><td>" + resultSet.getString(5) + "</td><td>" + status + "</td><td>" + resultSet.getString(7) + "</td><td>" + resultSet.getString(8) + "</td></tr>");
                        }
                    %>       
                </table>
            </div>
            <div class="row">
                <div class="col-sm-6"> 
                    <a class= 'btn btn-info' role='button' href="projectAllThreads.jsp?projectId=<%= projectId%>">View All Message</a>
                    <a href="projectUnreadThreads.jsp?projectId=<%= projectId%>" class="btn btn-info" role="button">Project Unread Threads</a>
                    <a href="searchSupplier.jsp?projectId=<%= projectId%>" class="btn btn-info" role="button">Add Suppliers</a>
                    <a href="DeleteProjectServlet?projectId=<%= projectId%>" class="btn btn-info" role="button">Delete project</a>
                </div>
            </div>

    </body>
</html>
