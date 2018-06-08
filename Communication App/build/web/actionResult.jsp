<%-- 
    Document   : actionResult
    Created on : Apr 26, 2018, 8:17:40 PM
    Author     : Ranul Deepanayake
    Shows the result of actions done by the user.
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
            if(request.getParameter("result")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;}
            else{
                int result= Integer.parseInt(request.getParameter("result"));
                if(result== 1){message= "Action successful!";}
                else{message= "Achievement unlocked! Developer mode easter egg found.";}
            }
        %>    
        
        <div class="container" style="border: 2px solid green; border-radius: 5px; width: 75%; height: 100px; margin-top: 50px;">
            <center><h3 style="margin-top: 35px; color: green;"><span class="glyphicon glyphicon-ok-sign"></span>&nbsp;&nbsp;<%= message %></h3></center>
        </div>
    </body>
</html>
