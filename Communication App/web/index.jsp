<%--
    Document   : index
    Created on : May 13, 2018, 6:46:46 PM
    Author     : Sandeepa Gajaman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src= "validation.js"></script>
        <link rel="stylesheet" type="text/css" href="commonStyles.css">
        <title>Construction Project Application</title>

    </head>
    <body>
        <%@include file= "header.jsp" %>
        <div align="center">
            <h1>Welcome!</h1>
            <br><br><br>
        </div>
        <div class="container" id="logbtn">
            <div class="row">
                <div align="center">
                    <a href="Signup.jsp" class="btn btn-primary button1" style= "margin: 5px;">Sign UP</a>
                </div>
                <br>
                <div align="center">
                    <a href="Login.jsp" class="btn btn-success button1" style= "margin: 5px;">Login</a>
                </div>
            </div>
        </div>
    </body>
</html>
