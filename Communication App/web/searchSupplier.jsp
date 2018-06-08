<%-- 
    Document   : searchSupplier
    Created on : May 12, 2018, 3:52:27 PM
    Author     : Ranul Deepanayake
--%>
<%--
Get the userId of the selected supplier.
Get the projectId of the relevant project.
--%>

<%@page import="java.sql.*"%>
<%@page import="javaeeproject.DatabaseConnection"%>
<%@page import="javaeeproject.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! 
    ResultSet resultSet;
    int userId;
    int projectId;
%>
<%
    if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The user's user ID.
    if(request.getParameter("projectId")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;} //The supplier's user ID.
    userId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
    projectId= Integer.parseInt(request.getParameter("projectId"));
    
    //userId= 1;
    //projectId= 1;
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
        
        <h1 align="center">Search Suppliers</h1>
        
        <center>
        <div class="container">
        <form action="searchSupplier.jsp" method="POST" class="form-inline" style=" width: 85%; margin-top: 35px;">
            <div class="form-group" style="margin-left: 15px;">
                <label for="searchTerm">Search Term</label>
                <input id= "searchTerm" class="form-control" type= "text" name="searchTerm" style="margin-left: 15px;">
            </div>
            <div class="form-group" style="margin-left: 15px;">
                <label for="searchType">Search By</label>
                <select id="searchType" class="form-control" name="searchType" style="margin-left: 15px;">
                    <option value="byCategory">Category</option>
                    <option value="byCity">City</option>
                    <option value="byUserName">User Name</option>
                </select>
            </div>
            <div class="form-group" style="margin-left: 15px;">
                <button class="btn btn-success button1" type="submit" value="Search" name="search">Submit</button>
            </div>  
            <input type="hidden" name="projectId" value= <%= projectId %> >
            <input type="hidden" name="didSearch" value= "true" >
        </form>
        </div>
        </center>
        
        <center>    
        <div>
            <%
                if(request.getParameter("search")!= null || request.getParameter("didSearch")!= null ||
                        request.getParameter("searchTerm")!= null){
                    String searchTerm= request.getParameter("searchTerm");
                    String searchType= request.getParameter("searchType");
                    int projectId= Integer.parseInt(request.getParameter("projectId"));
                    
                    try{
                        User user= new User();
                        
                        if(searchType.equals("byCategory")){
                            resultSet= user.searchSupplierByCategory(searchTerm);
                        }
                        else if(searchType.equals("byCity")){
                            resultSet= user.searchSupplierByCity(searchTerm);
                        }
                        else if(searchType.equals("byUserName")){
                            resultSet= user.searchSupplierByUserName(searchTerm);
                        }
                        else{
                            response.sendRedirect("generalErrors.jsp?error=6"); return;
                        }
                    }
                        catch(ClassNotFoundException e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
                        catch(SQLException e){response.sendRedirect("generalErrors.jsp?error=2"); return;}
                        catch(Exception e){response.sendRedirect("generalErrors.jsp?error=6"); return;}

                        out.print("<table class='table table-hover' style= 'width: 60%; margin-top: 60px;'>");
                        out.print("<tr><th>Last Name</th><th>Category</th><th>City</th><th>Email</th><th>Contact Number</th></tr>");
                        while(resultSet.next()){
                            out.print("<tr class= 'clickable-row' data-href= 'supplierView.jsp?projectId="+ projectId + "&userId="+ resultSet.getInt(1)+"'><td>"+ resultSet.getString(4)+"</td><td>" + resultSet.getString(11)+"</td><td>" + resultSet.getString(10)+"</td><td>" 
                                    + resultSet.getString(5)+"</td><td>"+ resultSet.getString(7)+"</td></tr>");

                        }
                        out.print("</table>");
                }
            %>    
        </div>
        </center>
    </body>
</html>
