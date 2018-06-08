<%-- 
    Document   : viewThread
    Created on : Apr 27, 2018, 11:59:28 AM
    Author     : Ranul Deepanayake
    Shows all messages in a thread.
--%>
<%--
Get the threadId and userId.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javaeeproject.Message"%>
<!DOCTYPE html>
<%! 
    ResultSet resultSet;
    ResultSet resultSetTitle;
    ResultSet resultSetReceiver;
    int userId;
    int threadId;
    String threadTitle= "";
%>
<%
    if(request.getParameter("threadId")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;} //The project ID.
    if(session.getAttribute("clientid")== null){response.sendRedirect("generalErrors.jsp?error=5"); return;}  //The user's user ID.
    userId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
    threadId= Integer.parseInt(request.getParameter("threadId"));
    
    //userId= 2;
    
    try{
        Message message= new Message();
        resultSet= message.viewMessagesInThread(threadId);
        
        //Getting the thread title.
        resultSetTitle= message.getThreadTitle(threadId);
        resultSetTitle.next(); 
        threadTitle= resultSetTitle.getString(1);
        
        //Set the thread as read.
        resultSetReceiver= message.getThreadViewer(threadId);
        resultSetReceiver.next(); 
        int receiverId= resultSetReceiver.getInt(1);
        if(receiverId== userId){message.setThreadAsRead(threadId);}   
    }
    catch(ClassNotFoundException e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
    catch(SQLException e){response.sendRedirect("generalErrors.jsp?error=2"); return;}
    catch(Exception e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction Project Application</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="commonStyles.css">
        <script src="commonScripts.js"></script>
    </head>
    <body>
        <%@include file= "header.jsp" %>
        
        <h2 align="center"><%= threadTitle %></h2>
        
        <center>
        <form enctype= "multipart/form-data" action="NewMessageServlet" method="POST" class="form-inline" style=" width: 85%; margin-top: 35px;">
            <div class="form-group" style="margin-left: 15px;">
                <label for="messageContent">Message</label>
                <textarea class="form-control" name="messageContent" rows="3" cols="50" style="margin-left: 15px;"></textarea>
            </div> 
            <div class="form-group" style="margin-left: 15px;">
                <label for="image">Image (Optional. *Maximum size- 5 MB)</label>
                <input class="form-control" type="file" id="image" name="image" multiple="false" style="margin-left: 15px;">
            </div> 
            <div class="form-group" style="margin-left: 15px;">
                <button class="btn btn-success button1" type="submit" value="Submit" name="submit">Submit</button>
            </div>  
            <input type="hidden" name="threadId" value= <%= threadId %> >
            <input type="hidden" name="senderId" value= <%= userId %> >
        </form>
        </center>
            
        <center>
        <table class='table table-hover' style=" width: 75%; margin-top: 40px;">
            <tr><th style="width: 400px;">Message</th><th>Image</th><th style="width: 150px;">Date</th><th style="width: 150px;">Time</th></tr>
            <% 
                try{
                    while(resultSet.next()){ 
                        //Select message color based on recipient or sender.
                        String messageColor= "";
                        if(resultSet.getInt(3)== userId){messageColor= "#E6E6FA";}
                        else{messageColor= "#B0E0E6";}
                        //Adjust cell size based on the availability of images.
                        if(resultSet.getString(5).equals("")){
                            out.print("<tr style= 'background-color:"+ messageColor +";'><td colspan= '2'>"+ resultSet.getString(4)+"</td><td>" + resultSet.getString(6)+"</td><td>" + resultSet.getString(7)+"</td></tr>");
                        }
                        else{
                            out.print("<tr style= 'background-color:"+ messageColor +";'><td>"+ resultSet.getString(4)+"</td><td><img width= '250' height= '150' src= 'data:image;base64, "+ resultSet.getString(5)+"'></td><td>" + resultSet.getString(6)+"</td><td>" + resultSet.getString(7)+"</td></tr>");
                        }
                    }
                }
                catch(Exception e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
            %>       
        </table>
        </center>
    
    </body>
</html>
