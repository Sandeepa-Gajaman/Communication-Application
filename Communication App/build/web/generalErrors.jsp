<%-- 
    Document   : generalErrors
    Created on : Apr 11, 2018, 10:03:51 PM
    Author     : Ranul Deepanayke
--%>

<%--
Errors
1- No internet connection.
2- Can't connect to the database.
3- Can't find resource.
4- Request headers are null.
5- Session not set.
6- Internal conflict.
7- Upload file not supported or too large.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
        <%! String message= ""; %>
        <%
            if(request.getParameter("error")== null){message= "Error! Request header(s) are null. Please try again!";}
            else{
                int error= Integer.parseInt(request.getParameter("error"));
                if(error== 1){message= "Error! Can't connect to the internet. Please try again!";}
                else if(error== 2){message= "Error! Can't connect to the database. Please try again!";}
                else if(error== 3){message= "Error! Resource unavailable. Please try again!";}
                else if(error== 4){message= "Error! Request header(s) are null. Please try again!";}
                else if(error== 5){message= "Error! Session(s) not set. Please try again!";}
                else if(error== 6){message= "Error! Internal conflict. Please try again!";}
                else if(error== 7){message= "Error! Upload file not supported or too large Please try again!";}
                else{message= "Achievement unlocked! Developer mode easter egg found.";}
            }
        %>    
        
        <div class="container" style="border: 2px solid red; border-radius: 5px; width: 75%; height: 100px; margin-top: 50px;">
            <center><h3 style="margin-top: 35px; color: red;"><span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;<%= message %></h3></center>
        </div>
    </body>
</html>
