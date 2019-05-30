/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/ser2"})
public class ser2 extends HttpServlet {

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
            out.println("<title>Servlet ser2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ser2 at " + request.getContextPath() + "</h1>");
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
        PrintWriter out=response.getWriter();
        String lgemail=request.getParameter("logemail");
        String lgpass=request.getParameter("pass");
        String str1="donator";
        String str2="recipient";
        try
        {
        Class.forName("com.mysql.jdbc.Driver");   
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
        Statement smt=con.createStatement();
        String query;
        query = "select type,city,firstname from users where email='"+lgemail+"' AND password='"+lgpass+"'";
        ResultSet rs=smt.executeQuery(query);
        String rtype="";
        String ct="";
        String Name="";
        int counter=0;
        while(rs.next())
        {
            counter++;
            rtype=rs.getString(1);
            ct=rs.getString("city");
            Name=rs.getString("firstname");
            
        }
        if(counter==1 && rtype.equals(str1))
        {
            
            HttpSession sos=request.getSession();
            sos.setAttribute("useremail",lgemail);
            sos.setAttribute("usercity",ct);
            response.sendRedirect("donator-dashboard.jsp");
        }
        else if(counter==1 && rtype.equals(str2))
        {
            
            HttpSession sos=request.getSession();
            sos.setAttribute("useremail",lgemail);
            sos.setAttribute("usercity",ct);
            sos.setAttribute("username",Name);
            response.sendRedirect("recipient-dashboard.jsp");
        }
        else
        {
            out.println("login not success");
        }
        
        
        }
        catch(ClassNotFoundException ex)
        {
            out.println(ex);
        } 
        catch (SQLException ex) {
            Logger.getLogger(ser2.class.getName()).log(Level.SEVERE, null, ex);
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
