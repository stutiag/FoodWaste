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
/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/ser1"})
public class ser1 extends HttpServlet {

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
            out.println("<title>Servlet ser1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ser1 at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String register=request.getParameter("FormName");
        String str1="donator";
        String str2="recipient";
        if(register.equals(str1))
        {
        String busname, Fname, Lname, Email, Contact, Address,Password;
        busname = request.getParameter("business_name");
        Fname = request.getParameter("fname");
        Lname = request.getParameter("lname");
        Email = request.getParameter("email");
        Contact = request.getParameter("contact");
        Address = request.getParameter("street") + request.getParameter("city") + request.getParameter("state") + request.getParameter("zip");
        Password=request.getParameter("pass");
        /*out.println(busname);
        out.println(Fname);
        out.println(Lname);
        out.println(Email);
        out.println(Contact);
        out.println(Address);*/
        try
        {
        Class.forName("com.mysql.jdbc.Driver");   
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
        Statement smt=con.createStatement();
        String query ="insert into users(firstname,lastname,email,contact,address,password,type) values ('"+Fname+"','"+Lname+"','"+Email+"','"+Contact+"','"+Address+"','"+Password+"','"+register+"')";
        String query2="insert into donators(businessname,email) values('"+busname+"','"+Email+"')";
        int i=smt.executeUpdate(query);
        int j=smt.executeUpdate(query2);
        if(i>0 && j>0)
        {
        response.sendRedirect("index.html");
        }
        else
        {
            out.println("record not inserted");
        }
        }
        catch(ClassNotFoundException ex)
        {
            out.println(ex);
        }
        catch (SQLException ex) 
        { 
             Logger.getLogger(ser1.class.getName()).log(Level.SEVERE, null, ex);
        } 
        }

    else if(register.equals(str2))
        {
        String busname, Fname, Lname, Email, Contact, Address,Password;
        busname = request.getParameter("business_name");
        Fname = request.getParameter("fname");
        Lname = request.getParameter("lname");
        Email = request.getParameter("email");
        Contact = request.getParameter("contact");
        Address = request.getParameter("street") + request.getParameter("city") + request.getParameter("state") + request.getParameter("zip");
        Password=request.getParameter("pass");
        /*out.println(busname);
        out.println(Fname);
        out.println(Lname);
        out.println(Email);
        out.println(Contact);
        out.println(Address);*/
        try
        {
        Class.forName("com.mysql.jdbc.Driver");   
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
        Statement smt=con.createStatement();
        String query ="insert into users(firstname,lastname,email,contact,address,password,type) values ('"+Fname+"','"+Lname+"','"+Email+"','"+Contact+"','"+Address+"','"+Password+"','"+register+"')";
        String query2="insert into recipients(orgname,email) values('"+busname+"','"+Email+"')";
        int i=smt.executeUpdate(query);
        int j=smt.executeUpdate(query2);
        if(i>0 && j>0)
        {
        response.sendRedirect("index.html");
        }
        else
        {
            out.println("record not inserted");
        }
        }
        catch(ClassNotFoundException ex)
        {
            out.println(ex);
        }
        catch (SQLException ex) 
        { 
             Logger.getLogger(ser1.class.getName()).log(Level.SEVERE, null, ex);
        } 
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
