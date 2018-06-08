<%-- 
    Document   : Login
    Created on : Mar 25, 2018, 6:20:57 PM
    Author     : Shamal Manawadu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String userName= "";
%>    
<%
    Cookie[] cookies= request.getCookies();
    if(cookies!= null){
        for(Cookie cookie: cookies){
            if(cookie.getName().equals("cookieUserName")){
                userName= cookie.getValue();
            }
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src= "LoginValidation.js"></script> 
        <link rel="stylesheet" type="text/css" href="commonStyles.css">
        <title>Construction Project Application</title>
    </head>
    <body>
        <%
            if (request.getParameter("result") == null) {
            }//Do nothing.
            else if (request.getParameter("result").equals("invalidCredentials")) {
                out.println("<div class='alert alert-danger'><center><strong>Invalid credentials! Please try again.</strong></center></div>");
            }
        %>

        <%@include file= "header.jsp" %>

        <h1 align="center">Login</h1>

        <div class="container" style= "padding-top: 70px;">
            <div class= "col-md-12 col-lg-offset-3">
                <form action="LoginServlet" method="POST" onsubmit= "return check();">
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="User Name">User Name</label> 
                        </div>
                        <div class="col-sm-4">
                            <input class= "form-control" type="text" name="userName" value= "<%= userName %>" id="UserName" onfocusout="validateUserName();"/>
                        </div>
                        <div class="col-sm-4">
                            <p id="username" style="display: none;"> *Required Field</p>
                        </div>

                    </div>

                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="Password">Password</label>
                        </div>
                        <div class="col-sm-4">
                            <input class= "form-control" type="Password" name="password" value="" id="Password"onfocusout="validatePassword();"/>
                        </div>
                        <div class="col-sm-4">
                            <p id="password" style="display: none;"> *Required Field</p>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <input name='submit' type='submit' value='submit'class="btn btn-success button1">
                        </div>
                        <div class="col-sm-2">
                            <input name='cancel' type='button' value='Cancel'class="btn btn-danger button1">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <input class= "form-control" type="checkbox" name="rememberMe" id="rememberMe" value="on" checked="checked" onclick="validateCheckBox()">
                        </div>
                        <div class="col-sm-2">
                            <label for="rememberMe">Remember Me</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
