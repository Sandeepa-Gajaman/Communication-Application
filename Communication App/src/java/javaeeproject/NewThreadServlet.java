package javaeeproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig; //************EXTREMELY IMPORTANT
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;                 //************EXTREMELY IMPORTANT
import java.io.InputStream;                     //************EXTREMELY IMPORTANT
import java.util.Base64;                        //************EXTREMELY IMPORTANT

/**
 *
 * @author Ranul Deepanayake
 * Processes new thread message forms.
 */
@WebServlet(urlPatterns = {"/NewThreadServlet"})
@MultipartConfig    //************EXTREMELY IMPORTANT
public class NewThreadServlet extends HttpServlet {
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
            out.println("<title>Servlet NewThreadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("");
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
        //Parameters.
        String title;
        String message;
        //Blob image;
        int receiverId;
        int senderId;
        int projectId;
        Part image;
        
        if(request.getParameter("threadTitle").equals("") || request.getParameter("submit").equals("")){response.sendRedirect("generalErrors.jsp?error=4"); return;}
        
        title= request.getParameter("threadTitle");
        if(request.getParameter("messageContent").equals("")){ message= "";} else{message= request.getParameter("messageContent");}
        receiverId= Integer.parseInt(request.getParameter("receiverId"));
        senderId= Integer.parseInt(request.getParameter("senderId"));
        projectId= Integer.parseInt(request.getParameter("projectId"));
        
        //Image retrieval.
        //5242880 (5 MB).
        image= request.getPart("image");
        String encodedImage= "";
        if(image.getSize()> 0){
            //Checks image extension for invalid file types. 
            int imageNameIndex= image.getSubmittedFileName().lastIndexOf('.');
            if(imageNameIndex< 1){response.sendRedirect("generalErrors.jsp?error=7"); return;}
            String imageExtension= image.getSubmittedFileName().substring(imageNameIndex+ 1).toLowerCase();
        
            String[] supportedImageExtensions= {"png", "jpg"};  //List of allowed file(image) extensions.
            boolean imageExtensionSupported= false;
            for(String s: supportedImageExtensions){if(imageExtension.matches(s)){imageExtensionSupported= true;};}
            if(imageExtensionSupported== false){response.sendRedirect("generalErrors.jsp?error=7"); return;}
        
            //Checks image size. Maximum size is 5 MB.
            if(image.getSize()> 5242880){response.sendRedirect("generalErrors.jsp?error=7"); return;} 
        
            //Convert image to byte stream.
            InputStream imageContent= image.getInputStream();
        
            //Encoding image to Base64.
            byte[] imageData= new byte[(int)image.getSize()];
            imageContent.read(imageData);
            encodedImage= Base64.getEncoder().encodeToString(imageData);
        }
        
        //Calling the model.
        Message messageProcess= new Message();
        try{
            messageProcess.createNewThread(projectId, senderId, receiverId, title, message, encodedImage);
        }
        catch(ClassNotFoundException e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
        catch(SQLException e){response.sendRedirect("generalErrors.jsp?error=2"); return;}
        catch(Exception e){response.sendRedirect("generalErrors.jsp?error=6"); return;}
        response.sendRedirect("actionResult.jsp?result=1"); return; 
        //processRequest(request, response);
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
