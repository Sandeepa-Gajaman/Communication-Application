/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validatebudget()
   {
       //alert("hello");  
        var budget=document.getElementById("budget").value;
        if(budget=="")
        {
          document.getElementById("bgt").style.display="block";
	}
        else
	{
          document.getElementById("bgt").style.display="none";
	}    
        
   }
 function validatestartDate()
 {
     // alert("lname");  
        var startDate=document.getElementById("startDate").value;
        if(startDate=="")
        {
          document.getElementById("strDate").style.display="block";
	}
        else
	{
          document.getElementById("strDate").style.display="none";
	} 
 }
 function validatedeadline()
 {
     var deadline=document.getElementById("deadline").value;
        if(deadline=="")
        {
          document.getElementById("dedline").style.display="block";
	}
        else
	{
          document.getElementById("dedline").style.display="none";
	} 
     
 }
 function validatedescription()
 {
        var description=document.getElementById("description").value;
        if(description=="")
        {
          document.getElementById("dscription").style.display="block";
	}
        else
	{
          document.getElementById("dscription").style.display="none";
	} 
 }

function check()
{
var status=true;   
var bgt=document.getElementById("budget").value;
var strDate=document.getElementById("startDate").value;
var dedline=document.getElementById("deadline").value;
var dscription=document.getElementById("description").value;


if(bgt=="")
{
    status=false;
    document.getElementById("bgt").style.display="block";
    
    //alert(status,"jij");
}
if(strDate=="")
{
    status=false;
    document.getElementById("strDate").style.display="block";
    //alert(status);
}
if(dedline=="")
{
    status=false;
   // alert(status);
    document.getElementById("dedline").style.display="block";
}
if(dscription=="")
{
    status=false;
 //   alert(status);
   document.getElementById("dscription").style.display="block";
}

//alert(status);
return status;
}

