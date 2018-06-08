<%--
    Document   : Signup
    Created on : Mar 25, 2018, 6:21:23 PM
    Author     : shamal
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
        <% //String xy= request.getParameter("suceessresult");

            //String y="1";
            if (request.getParameter("suceessresult") == null) {

            } else if (request.getParameter("suceessresult").equals("1")) {
                //out.print(x);
                out.println("<div class='alert alert-success'><center><strong>Registration successful!</strong></center></div>");

            } else if (request.getParameter("suceessresult").equals("2")) {
                out.println("<div class='alert alert-danger'><center><strong>Registration failed! Plese try again.</center></div>");
            } else {
                out.print("hey");
            }
        %>

        <%@include file= "header.jsp" %>

        <h1 align="center">Sign Up</h1>

        <div class="container" style= "padding-top: 70px;">
            <div class= "col-md-12 col-lg-offset-3">
                <form action="SignupSeverlet" method="POST" onsubmit= "return check();">

                    <div class="row">
                        <div class="col-sm-2">
                            <label for="First Name">First Name</label>

                        </div>
                        <div class="col-sm-4">
                            <input class= "form-control" type="text" name="FirstName" value=""id="FirstName" onfocusout="validateFirstName();"/>
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
                            <input class= "form-control" type="text"id="LastName" name="LastName" value="" onfocusout="validateLastName();"/>
                        </div>
                        <div class="col-sm-4">
                            <p id="lName" style="display: none;"> *Required Field</p>
                        </div>

                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="User Name">User Name</label>

                        </div>
                        <div class="col-sm-4">
                            <input class= "form-control" type="text" name="UserName" value=""id="UserName" onfocusout="validateUserName();"/>
                        </div>
                        <div class="col-sm-4">
                            <p id="username" style="display: none;"> *Required Field</p>
                        </div>

                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="Email">Email</label>

                        </div>
                        <div class="col-sm-4">
                            <input class= "form-control" type="text" name="Email" value=""id="Email" onfocusout="validateEmail();"/>
                        </div>
                        <div class="col-sm-4">
                            <p id="email" style="display: none;"> *Required Field</p>
                        </div>

                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="UserType">User Type</label>
                        </div>
                        <div class="col-sm-4">
                            <select class= "form-control" name="UserType" id="usertype"onfocusout="validateUserType();">
                                <option value="client">client</option>
                                <option value="supplier">supplier</option>
                            </select>

                        </div>
                        <div class="col-sm-4">
                            <p id="address" style="display: none;"> *Required Field</p>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="SupplierCategoryName" id="suppliertypename" style="display: none;">Supplier Category</label>
                        </div>
                        <div class="col-sm-4">
                            <select class= "form-control" name="SupplierCategory" id="suppliertype" style="display: none;">
                                <option></option>
                                <option>Building Materials</option>
                                <option>Foundation Laying</option>
                                <option>Masonry</option>
                                <option>Carpentry</option>
                                <option>Bathroom Laying</option>
                                <option>Tile Laying</option>
                                <option>Architecture Advisory</option>
                                <option>Plumbing</option>
                                <option>Electrical Work</option>
                                <option>Demolition</option>
                                <option>Black Market Sand Mining</option>
                            </select>

                        </div>
                        <div class="col-sm-4">
                            <p id="address" style="display: none;"> *Required Field</p>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="City">City</label>
                        </div>
                        <div class="col-sm-4">
                            <select class= "form-control" name="City" id="city">
                                <option>Colombo</option>
                                <option>Kandy</option>
                                <option>Galle</option>
                                <option>Anuradhapura</option>
                                <option>Jaffna</option>
                                <option>Ruwanwella</option>
                            </select>

                        </div>
                        <div class="col-sm-4">
                            <p id="address" style="display: none;"> *Required Field</p>
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="Address" >Address</label>
                        </div>
                        <div class="col-sm-4">
                            <input class= "form-control" type="text" name="Address" value=""id="Address"onfocusout="validateAddress();" />
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
                            <input class= "form-control" type="text" name="Telephone" value=""id="Telephone"onfocusout="validateTelephone();" />
                        </div>
                        <div class="col-sm-4">
                            <p id="telephone" style="display: none;"> *Required Field</p>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-2">
                            <label for="Description"id="descriptionname"style="display: none;">Description</label>
                        </div>
                        <div class="col-sm-4">
                            <textarea class= "form-control" rows="2" cols="20"id="description"name="Description"style="display: none;"></textarea>
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
                            <input class= "form-control" type="Password" name="Password" value="" id="Password"onfocusout="validatePassword();"/>
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
                            <input class= "form-control" type="password" name="ConfirmPassword" value="" id="ConfirmPassword"onfocusout="validateConfirmPassword();"/>
                        </div>
                        <div class="col-sm-4">
                            <p id="confirmpassword" style="display: none;"> *Required Field</p>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-3">
                            <input name='submit' type='submit' value='submit'class="btn btn-success button1">
                        </div>
                        <div class="col-sm-3">
                            <a href="Login.jsp" class="btn btn-danger button1" role="button">Back</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>


























