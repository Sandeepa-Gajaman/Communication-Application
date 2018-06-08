package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javaeeproject.Project;
import java.sql.SQLException;
import javaeeproject.Message;
import java.sql.ResultSet;

public final class clientDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    ResultSet resultSet1;
    ResultSet resultSet2;
    int userId;
    int reciverId;
    int threadId;
    int projectId;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/header.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');

//    if (session.getAttribute("clientid") == null) {
//        response.sendRedirect("generalErrors.jsp?error=5");
//        return;
//    }  //The sender's user ID.
//    userId = Integer.parseInt(String.valueOf(session.getAttribute("clientid")));

    userId = 2;
    try {
        Message message = new Message();
        resultSet1 = message.getUserUnreadThread(userId);

        Project project = new Project();
        resultSet2 = project.getUserProjects(userId);
    } catch (ClassNotFoundException e) {
        response.sendRedirect("generalErrors.jsp?error=6");
        return;
    } catch (SQLException e) {
        response.sendRedirect("generalErrors.jsp?error=2");
        return;
    } catch (Exception e) {
        response.sendRedirect("generalErrors.jsp?error=6");
        return;
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Construction Project Application</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"commonScripts.js\"></script>\n");
      out.write("        <link href=\"bgStyles.css\" type=\"text/css\" rel=\"stylesheet\" />\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("         \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"index.jsp\">Construction Project Application</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li class=\"active\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                    <li ><a href=\"About.jsp\">About</a></li>\n");
      out.write("                    <li><a href=\"ContactUs.jsp\">Contact Us</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                    ");

                        if(session.getAttribute("clientid")== null){
                            out.print("<li><a href='Login.jsp'><span class='glyphicon glyphicon-log-in'></span> Log In</a></li>");
                            out.print("<li><a href='Signup.jsp'><span class='glyphicon glyphicon-edit'></span> Sign Up</a></li>");
                        }
                        else{
                            String firstName= (String)session.getAttribute("firstName");
                            if((session.getAttribute("userType").equals("client"))== true){
                                out.print("<li><a href='clientDashboard.jsp'><span class='glyphicon glyphicon-user'></span> Hello " + firstName + "</a></li>");
                            }
                            else if((session.getAttribute("userType").equals("supplier"))== true){
                                out.print("<li><a href='supplierDashboard.jsp'><span class='glyphicon glyphicon-user'></span> Hello " + firstName + "</a></li>");
                            }
                            out.print("<li><a href='Logout'><span class='glyphicon glyphicon-off'></span> Log Out</a></li>");
                        }
                    
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div id=\"h1Styl\">\n");
      out.write("                <h1 align=\"center\">Client Dashboard</h1><br>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("\n");
      out.write("                <div class=\"well\" id=\"unreadM\">\n");
      out.write("                    <center><label for=\"Chaat\">Unread Messages</label></center>\n");
      out.write("                    <br>\n");
      out.write("                    <table class='table table-hover'id=\"unM\">\n");
      out.write("                        <thead><tr><th>Title</th><th>Date</th><th>Time</th></tr></thead>\n");
      out.write("                                    ");
                while (resultSet1.next()) {
                                            threadId = resultSet1.getInt(1);
                                            userId = resultSet1.getInt(3);
                                            reciverId = resultSet1.getInt(4);;
                                            out.print("<tr class= 'clickable-row' data-href= 'viewThread.jsp?threadId=" + threadId + "&userId=" + userId + "&reciverId=" + reciverId + "'><td>" + resultSet1.getString(5) + "</td><td>" + resultSet1.getString(7) + "</td><td>" + resultSet1.getString(8) + "</td></tr>");
                                        }
                                    
      out.write("  \n");
      out.write("                        <tr><td colspan=\"3\" align=\"center\"><a href=\"viewUserUnreadThreads.jsp\" class=\"btn btn-primary\" style= \" text-align:center; padding: 10px 35px;\">Check All Unread Messages</a></td></tr>\n");
      out.write("                        <tr><td colspan=\"3\" align=\"center\"><a href=\"viewUserAllThreads.jsp\" class=\"btn btn-info\" style= \" text-align:center; padding: 10px 35px;\">Check All Messages</a></td></tr>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"col-sm-9\">\n");
      out.write("                    <div class=\"well\" id=\"allProj\">\n");
      out.write("                        <center><lable for=\"Proj\"><b>All Projects</b></lable></center>\n");
      out.write("                        <br>\n");
      out.write("                        <table class='table table-hover'>\n");
      out.write("                            <thead><tr><th>Project ID</th><th>City</th><th>Budget</th><th>Start Date</th><th>Deadline</th><th>Description</th></tr></thead>\n");
      out.write("                                        ");

                                            while (resultSet2.next()) {
                                                projectId = resultSet2.getInt(1);
                                                userId = resultSet2.getInt(2);;
                                                out.print("<tr class= 'clickable-row' data-href= 'projectViewPage.jsp?projectId=" + projectId + "&userId=" + userId + "'><td>" + resultSet2.getString(1) + "</td><td>" + resultSet2.getString(3) + "</td><td>" + resultSet2.getString(4) + "</td><td>" + resultSet2.getString(5) + "</td><td>" + resultSet2.getString(6) + "</td><td>" + resultSet2.getString(7) + "</td><td colspan='6' align='center'>"+"<a href='DeleteProjectServlet?projectId=" + projectId + "' class='btn btn-danger' style= 'padding: 5px 25px;'>"+"Delete Project"+"</a></td></tr>");

                                            }
                                        
      out.write("\n");
      out.write("                            <tr><td colspan=\"6\" align=\"center\"><a href=\"AddProject.jsp\" class=\"btn btn-success\" style= \"padding: 5px 25px;\">Add Project</a></td></tr>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div> \n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
