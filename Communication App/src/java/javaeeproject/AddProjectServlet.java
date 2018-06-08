/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaeeproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chusitha Lahiru
 */
@WebServlet(name = "AddProjectServlet", urlPatterns = {"/AddProjectServlet"})
public class AddProjectServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProjectServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProjectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        PrintWriter out= response.getWriter();
//        String budget= "AAAAAAAAAAAAA";
//                //=request.getParameter("budget");
//        out.print("fgfgffg"+budget);
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        
        int userId= Integer.parseInt(String.valueOf(session.getAttribute("clientid")));
        
        //int userId=1;
        
        
        PrintWriter out= response.getWriter();
        int budget=Integer.parseInt(request.getParameter("budget")) ;
        out.print(budget);
        String description=request.getParameter("description");
        out.print(description);
        String startDate =request.getParameter("startDate");
        out.print(startDate);
        String deadline=request.getParameter("deadline");
        out.print(deadline);
        String city=request.getParameter("city");
        out.print(city);
        
        
        Project project=new Project();
        project.setUserId(userId);
        project.setcity(city);
        project.setbudget(budget);
        project.setstartDate(startDate);
        project.setdeadline(deadline);
        project.setdescription(description);
        
        try {
            int result = project.insert();
            response.sendRedirect("AddProject.jsp?suceessresult=1");
            //processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProjectServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddProjectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
