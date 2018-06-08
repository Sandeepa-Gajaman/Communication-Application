<%-- 
    Document   : AddProject
    Created on : May 13, 2018, 1:25:13 PM
    Author     : Chusitha Lahiru
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
        <script src= "AddProjectValidation.js"></script> 
        <link rel="stylesheet" type="text/css" href="commonStyles.css">
        <title>Construction Project Application</title>
    <body>
        <% 
            if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The sender's user ID.
            if(request.getParameter("suceessresult") == null){}
            else if(request.getParameter("suceessresult").equals("1")){
                out.println("<div class='alert alert-success'><center><strong>Your project has been created!</strong></center></div>");
            }
            else if(request.getParameter("suceessresult").equals("2")){
                out.println("<div class='alert alert-danger'><center><strong>Failed to create project! Please try again.</strong></center></div>");
            }
            else{
                out.print("hey");
            }
        %>
        
        <%@include file= "header.jsp" %>
        
        <div class="container" style= "padding-top: 70px;">
            <div class= "col-md-12 col-lg-offset-3">
        <form action="AddProjectServlet" method="POST" onsubmit= "return check();" >
            
                          <div class="row">
                        <div class="col-sm-2">
		           <label for="city">City</label>
                        </div>
                         <div class="col-sm-4">
                             <select class= "form-control" name="city" id="city">
                                <option>Colombo</option>
                                <option>Kandy</option>
                                <option>Galle</option>
                                <option>Anuradhapura</option>
                                <option>Jaffna</option>
                                <option>Ruwanwella</option>
                             </select>
                           
                         </div>
                        <div class="col-sm-4">
                          <p id="city" style="display: none;"> *Required Field</p>
                         </div>
               </div>
        
            <br>
                  <div class="row">
                       <div class="col-sm-2">
		        <label for="budget">Budget</label> 
	             
		       </div>
                        <div class="col-sm-4">
                        <input class= "form-control" type="text" name="budget" value=""id="budget" onfocusout="validatebudget();" />
                        </div>
                        <div class="col-sm-4">
                        <p id="bgt" style="display: none;"> *Required Field</p>
                        </div>                       
                    </div>
            <br>
                     <div class="row">
                          <div class="col-sm-2">
		           <label for="startDate">Start Date</label> 
                          </div>
                          <div class="col-sm-4">
                              <input class= "form-control" type="text"id="startDate" name="startDate" value="" onfocusout="validatestartDate();" /> (YYYY-MM-DD)
                          </div>
                         <div class="col-sm-4">
                          <p id="strDate" style="display: none;"> *Required Field</p>
                         </div>                    
                     </div>
            <br>
                      <div class="row">
                       <div class="col-sm-2">
		        <label for="deadline">Deadline</label> 
	             
		       </div>
                        <div class="col-sm-4">
                        <input class= "form-control" type="text" name="deadline" value=""id="deadline" onfocusout="validatedeadline();" /> (YYYY-MM-DD)
                        </div>
                        <div class="col-sm-4">
                        <p id="dedline" style="display: none;"> *Required Field</p>
                        </div>
                    </div>
            <br>
                    <div class="row">
                       <div class="col-sm-2">
		        <label for="description">Description</label> 
	             
		       </div>
                        <div class="col-sm-4">
                        <input class= "form-control" type="text" name="description" value=""id="description" onfocusout="validatedescription();" />
                        </div>
                        <div class="col-sm-4">
                        <p id="dscription" style="display: none;"> *Required Field</p>
                        </div>        
                    </div>
            <br>
                       <div class="row">
                             <div class="col-sm-3">
                              <input name='submit' type='submit' value='submit'class="btn btn-success button1">
                             </div>
                         
                       
                             <div class="col-sm-3">
                              <input name='cancel' type='button' value='Cancel'class="btn btn-danger button1">
                             </div>
                       </div>
             </form>
       </div>
        </div>
    </body>
</html>
