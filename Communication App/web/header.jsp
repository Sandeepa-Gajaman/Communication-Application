<%-- 
    Document   : header
    Created on : Apr 11, 2018, 10:39:46 PM
    Author     : Ranul Deepanayake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">Construction Project Application</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li ><a href="About.jsp">About</a></li>
                    <li><a href="ContactUs.jsp">Contact Us</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%
                        if(session.getAttribute("clientid")== null){
                            out.print("<li><a href='Login.jsp'><span class='glyphicon glyphicon-log-in'></span> Log In</a></li>");
                            out.print("<li><a href='Signup.jsp'><span class='glyphicon glyphicon-edit'></span> Sign Up</a></li>");
                        }
                        else{
                            String firstName= (String)session.getAttribute("firstName");
                            if((session.getAttribute("userType").equals("client"))== true){
                                out.print("<li><a href='clientDashboard.jsp'><span class='glyphicon glyphicon-user'></span> Hello " + firstName + "</a></li>");
                            }
                            else if((session.getAttribute("userType").equals("supplier"))== true){
                                out.print("<li><a href='supplierDashboard.jsp'><span class='glyphicon glyphicon-user'></span> Hello " + firstName + "</a></li>");
                            }
                            out.print("<li><a href='Logout'><span class='glyphicon glyphicon-off'></span> Log Out</a></li>");
                        }
                    %>
                </ul>
            </div>
        </nav>
    </body>
</html>
