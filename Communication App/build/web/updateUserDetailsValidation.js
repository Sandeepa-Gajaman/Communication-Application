/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//var username=document.getElementById().value;
function validateFirstName()
   {
       //alert("hello");  
        var firstname=document.getElementById("FirstName").value;
        if(firstname=="")
        {
          document.getElementById("fName").style.display="block";
	}
        else
	{
          document.getElementById("fName").style.display="none";
	}    
        
   }
 function validateLastName()
 {
     // alert("lname");  
        var lastname=document.getElementById("LastName").value;
        if(lastname=="")
        {
          document.getElementById("lName").style.display="block";
	}
        else
	{
          document.getElementById("lName").style.display="none";
	} 
 }
 function validateAddress()
 {
     var address=document.getElementById("Address").value;
        if(address=="")
        {
          document.getElementById("address").style.display="block";
	}
        else
	{
          document.getElementById("address").style.display="none";
	} 
     
 }
 function validateTelephone()
 {
        var Telephone=document.getElementById("Telephone").value;
        if(Telephone=="")
        {
          document.getElementById("telephone").style.display="block";
	}
        else
	{
          document.getElementById("telephone").style.display="none";
	} 
 }
 function validatePassword()
 {
     var password=document.getElementById("Password").value;
        if(password=="")
        {
          document.getElementById("password").style.display="block";
	}
        else
	{
          document.getElementById("password").style.display="none";
	} 
 }
  function validatePassword()
 {
     var password=document.getElementById("Password").value;
        if(password=="")
        {
          document.getElementById("password").style.display="block";
	}
        else
	{
          document.getElementById("password").style.display="none";
	} 
 }
  function validateEmail()
 {
     var email=document.getElementById("Email").value;
        if(email=="")
        {
          document.getElementById("email").style.display="block";
	}
        else
	{
          document.getElementById("email").style.display="none";
	} 
 }
  
 function validateConfirmPassword()
 {
        var confirmpassword=document.getElementById("ConfirmPassword").value;
        if(confirmpassword=="")
        {
          document.getElementById("confirmpassword").style.display="block";
	}
        else
	{
          document.getElementById("confirmpassword").style.display="none";
	}
     
 }
function check()
{
var status=true;   
var fname=document.getElementById("FirstName").value;
var lname=document.getElementById("LastName").value;
//var email=document.getElementById().value;
var address=document.getElementById("Address").value;
var telephone=document.getElementById("Telephone").value;
var password=document.getElementById("Password").value;
var confirmpassword=document.getElementById("ConfirmPassword").value;
 var email=document.getElementById("Email").value;
var patt=/^[0-9]+$/;

if(fname=="")
{
    status=false;
    document.getElementById("fName").style.display="block";
    
    //alert(status,"jij");
}
if(lname=="")
{
    status=false;
    document.getElementById("lName").style.display="block";
    //alert(status);
}

if(email=="")
{
    status=false;
 //   alert(status);
   document.getElementById("email").style.display="block";
}
if(address=="")
{
    status=false;
  //  alert(status);
    document.getElementById("address").style.display="block";
}
if(telephone=="" || (!patt.test(telephone)))
{
    
    status=false;
  //  alert(status);
   document.getElementById("telephone").style.display="block";
}

if(password=="")
{
    status=false;
   // alert(status);
   document.getElementById("password").style.display="block";
}
if(confirmpassword=="")
{
    status=false; 
    //alert(status);
    document.getElementById("confirmpassword").style.display="block";
}

if(telephone.length!==10)
{
    status=false; 
     document.getElementById("telephone").innerHTML="Telephone number is not valid";
    
    //alert("hey");
}
if(!(password==confirmpassword))
{
    status=false;
    document.getElementById("confirmpassword").innerHTML="Password is not matched";
   // alert(status);
}
alert(status);
return status;
}

