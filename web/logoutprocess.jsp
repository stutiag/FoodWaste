<%-- 
    Document   : logoutprocess
    Created on : Jun 9, 2019, 5:50:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <% 
          session.invalidate();
         response.sendRedirect("index.jsp");
        %>
        
        
        
         <%@page  import="java.sql.*" %>
    <body>
        <%
            String id=request.getParameter("id");
            try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
            Statement smt=con.createStatement();
            String q="delete from recieveditems where status=1 ";
            int i=smt.executeUpdate(q);
           if(i>0)
           {
                session.invalidate();
         response.sendRedirect("index.jsp");
           }
           
           
        }
  catch(Exception ex)
  {
  out.println(ex);
  }
            
            %>
            
            
         
        
    </body>
</html>
