/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package javaeeproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javaeeproject.User;
import javax.servlet.RequestDispatcher;    //Important.
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shama
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        PrintWriter out= response.getWriter();

        String hashedPassword= "";
        String userName= "";
        String password= "";
        String rememberMe= "";
        
        if(request.getParameter("userName")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;}
        if(request.getParameter("password")== null){response.sendRedirect("generalErrors.jsp?error=4"); return;}
        if(request.getParameter("rememberMe")== null){rememberMe= "off";} else{rememberMe= "on";}
        userName= request.getParameter("userName");    
        password= request.getParameter("password");
         
        ////////////////////////////////////////////////////////////////////////
         StringBuffer sb=new StringBuffer();
        try {
            MessageDigest md=MessageDigest.getInstance("SHA-1");
            md.update(password.getBytes());
            byte[] b=md.digest();
       
            for(byte b1 : b)
            {
                sb.append(Integer.toHexString(b1 & 0xff).toString());
            }
        } 
        catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        hashedPassword= sb.toString();    //Hashed password.
     ///////////////////////////////////////////////////////////////////////////
      
    try {
        ResultSet resultSet;
        User user =new User();
            
        resultSet= user.userSignIn(userName, hashedPassword);
        
        if(!resultSet.isBeforeFirst()){response.sendRedirect("Login.jsp?result=invalidCredentials"); return;}
        else{
            resultSet.next();
        
            int sessionUserId= resultSet.getInt(1); 
            String sessionUserName= resultSet.getString(2);
            String sessionFirstName= resultSet.getString(3);
            String sessionUserType= resultSet.getString(4);

            //Session creation.
            HttpSession session = request.getSession(true);
            session.setAttribute("clientid", sessionUserId);
            session.setAttribute("UserName", sessionUserName);
            session.setAttribute("firstName", sessionFirstName);
            session.setAttribute("userType", sessionUserType); 
            
            //Cookie creation and removal.
            if(rememberMe.equals("on")){
                Cookie cookie= new Cookie("cookieUserName", sessionUserName);
                cookie.setMaxAge(60* 60* 24* 30);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            else{
                Cookie cookie= new Cookie("cookieUserName", "");
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            if(sessionUserType.equals("client")){
                response.sendRedirect("clientDashboard.jsp"); return;
            }
            else if(sessionUserType.equals("supplier")){
                response.sendRedirect("supplierDashboard.jsp"); return;
            }
            else{response.sendRedirect("generalErrors.jsp?error=6"); return;}
            } 
        } 
        catch (ClassNotFoundException ex) {response.sendRedirect("Login.jsp?result=1"); return;} 
        catch (SQLException ex) {response.sendRedirect("generalErrors.jsp?error=2"); return;}
        catch (Exception ex) {response.sendRedirect("generalErrors.jsp?error=6"); return;}
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
