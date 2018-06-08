/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateUserName()
 {
     var username=document.getElementById("UserName").value;
        if(username=="")
        {
          document.getElementById("username").style.display="block";
	}
        else
	{
          document.getElementById("username").style.display="none";
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
 function check()
{
var status=true;   
var password=document.getElementById("Password").value;
var username=document.getElementById("UserName").value;

if(username=="")
{
    status=false;
   // alert(status);
    document.getElementById("username").style.display="block";
}

if(password=="")
{
    status=false;
   // alert(status);
   document.getElementById("password").style.display="block";
}
return status;
}

function validateCheckBox()
 {   //alert(document.getElementById("rememberMe").value);
     if(document.getElementById("rememberMe").checked==true)
     {
         document.getElementById("rememberMe").value="on";
         //alert(document.getElementById("rememberMe").value);
     }
     else
     {
          document.getElementById("rememberMe").value="off";
         //alert(document.getElementById("rememberMe").value);
     }
   //  alert(document.getElementById("rememberMe").value);
    
 }


