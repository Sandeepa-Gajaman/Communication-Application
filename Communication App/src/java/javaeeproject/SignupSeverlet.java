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
import java.security.*;
import java.security.NoSuchAlgorithmException;


/**
 *
 * @author shama
 */
@WebServlet(urlPatterns = {"/SignupSeverlet"})
public class SignupSeverlet extends HttpServlet {
int result;
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
            out.println("<title>Servlet SignupSeverlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupSeverlet at " + request.getContextPath() + "</h1>");
            out.println(result);
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
        processRequest(request, response);
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
        String LastName=request.getParameter("LastName");
        String FirstName=request.getParameter("FirstName");
        String Address =request.getParameter("Address");
        String Telephone=request.getParameter("Telephone");
        String password=request.getParameter("Password");
        String Email=request.getParameter("Email");
        String UserName=request.getParameter("UserName");
        String UserType=request.getParameter("UserType");
        String City=request.getParameter("City");
        //String Supplier=request.getParameter("Supplier");
        String SupplierCategory=request.getParameter("SupplierCategory");
        String SupplierDescription=request.getParameter("Description");
         
        StringBuffer sb=new StringBuffer();
    try {
        MessageDigest md=MessageDigest.getInstance("SHA");
        md.update(password.getBytes());
        byte[] b=md.digest();
       
        for(byte b1 : b)
        {
            sb.append(Integer.toHexString(b1 & 0xff).toString());
        }
        
    } catch (NoSuchAlgorithmException ex) {
        Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
    }
        /*  if(UserType.equals("client"))
          {
              SupplierDescription;
              SupplierCategory="null";
          }*/
        password=sb.toString();
       // RegisterCustomer obj=new RegisterCustomer();
        User obj=new User();
        obj.setUsername(UserName);
        obj.setLastName(LastName);
        obj.setFirstname(FirstName);
        obj.setEmail(Email);
        obj.setAddress(Address);
        obj.setTelephone(Telephone);
        obj.setPassword(password);
        obj.setUsertype(UserType);
        obj.setCity(City);
        obj.setSupplierCategory(SupplierCategory);
        obj.setDescription(SupplierDescription);
        
       
        try {
            // obj.setEmail(Address);
            result=obj.registerCustomer();
            response.sendRedirect("Signup.jsp?suceessresult=1");
        } catch (ClassNotFoundException ex) {
            response.sendRedirect("Signup.jsp?suceessresult=2");
           result=2;
        } catch (SQLException ex) {
            //Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("Signup.jsp?suceessresult=2");
            result=3;
        } catch (Exception ex) {
        Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
    }
        processRequest(request, response);
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
