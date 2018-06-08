<%-- 
    Document   : update
    Created on : May 11, 2018, 1:40:06 PM
    Author     : Chusitha Lahiru
--%>

<%@page import="javaeeproject.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%! 
    ResultSet resultSet;
    int userId;
%>
<%
    if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The sender's user ID.
    userId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
    
    userId= 2;
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src= "updateUserDetailsValidation.js"></script>
    </head>
    <body>
       
        <%@include file= "header.jsp" %>
        
        <% //String xy= request.getParameter("suceessresult");
         
         //String y="1";
         if(request.getParameter("suceessresult") == null)
         {
             
         }
          else if(request.getParameter("suceessresult").equals("1"))
            {
           //out.print(x);
            out.println("<div class='alert alert-success'><center><strong>Success! </strong>Update successfully! </center></div>");
      
        }
        else if(request.getParameter("suceessresult").equals("2"))
        {
             out.println("<div class='alert alert-danger'><center><strong>Failed! </strong>OOPs there is something wrong! </center></div>");
        }
        else
        {
            out.print("hey");
        }
        // String userId=1;
         User user=new User();
         resultSet= user.getUserDetails(userId);
         resultSet.next();
        %>
        
        <div class="container" style= "padding-top: 70px;">
            <div class= "col-md-12 col-lg-offset-4">
        <form action= "UpdateUserDetailsServlet" method="POST" onsubmit= "return check();">
            
           
            
                  <div class="row">
                       <div class="col-sm-2">
		        <label for="First Name">First Name</label> 
	             
		       </div>
                        <div class="col-sm-4">
                            <input type="text" name="firstName" value=<% resultSet.getNString(3);  %>id="FirstName" onfocusout="validateFirstName();"/>
                        </div>
                        <div class="col-sm-4">
                        <p id="fName" style="display: none;"> *Required Field</p>
                        </div>
                        
                    </div>
            <br>
                     <div class="row">
                          <div class="col-sm-2">
		           <label for="LastName">Last Name</label> 
                          </div>
                          <div class="col-sm-4">
                          <input type="text"id="LastName" name="lastName" value= <% resultSet.getNString(4);  %> onfocusout="validateLastName();"/>
                          </div>
                         <div class="col-sm-4">
                          <p id="lName" style="display: none;"> *Required Field</p>
                         </div>
                    
                     </div>
            <br>
                      
             <div class="row">
                       <div class="col-sm-2">
		        <label for="Email">Email</label> 
	             
		       </div>
                        <div class="col-sm-4">
                        <input type="text" name="email" value=""id="Email" onfocusout="validateEmail();"/>
                        </div>
                        <div class="col-sm-4">
                        <p id="email" style="display: none;"> *Required Field</p>
                        </div>
                        
                    </div>
            <br>
                     
                    <div class="row">
                        <div class="col-sm-2">
		           <label for="Address">Address</label>
                        </div>
                         <div class="col-sm-4">
                            <input type="text" name="address" value=""id="Address"onfocusout="validateAddress();" />
                         </div>
                        <div class="col-sm-4">
                          <p id="address" style="display: none;"> *Required Field</p>
                         </div>
                    </div>
            <br>
                     <div class="row">
                         <div class="col-sm-2">
                             <label for="Telephone">Telephone</label>
                         </div>
                          <div class="col-sm-4">
                              <input type="text" name="telephoneNumber" value=""id="Telephone"onfocusout="validateTelephone();" />
                          </div>
                          <div class="col-sm-4">
                              <p id="telephone" style="display: none;"> *Required Field</p>
                          </div>
                     </div>
            <br>
                      <div class="row">
                         <div class="col-sm-2">
                             <label for="Password">Password</label>
                         </div>
                          <div class="col-sm-4">
                              <input type="Password" name="password" value="" id="Password"onfocusout="validatePassword();"/>
                          </div>
                          <div class="col-sm-4">
                              <p id="password" style="display: none;"> *Required Field</p>
                          </div>
                     </div>
            <br>
                     <div class="row">
                         <div class="col-sm-2">
                             <label for="ConfirmPassword">Confirm Password</label>
                         </div>
                          <div class="col-sm-4">
                              <input type="password" name="confirmPassword" value="" id="ConfirmPassword"onfocusout="validateConfirmPassword();"/>
                          </div>
                          <div class="col-sm-4">
                              <p id="confirmpassword" style="display: none;"> *Required Field</p>
                          </div>
                     </div>
                     <br>
                       <div class="row">
                             <div class="col-sm-3">
                              <input name='submit' type='submit' value='submit'class="btn btn-success">
                             </div>
                         
                       
                             <div class="col-sm-3">
                              <input name='cancel' type='button' value='Cancel'class="btn btn-danger">
                             </div>
                       </div>
                     <input type="hidden" name="userId" value=<%= userId %>
             </form>
       </div>
        </div>
    </body>
</html>
