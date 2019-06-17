<%-- 
    Document   : confirmorder.jsp
    Created on : Jun 10, 2019, 5:40:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@page  import="java.sql.*" %>
    <body>
        <%
            String id=request.getParameter("id");
            try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
            Statement smt=con.createStatement();
            String q="update recieveditems set status=1 where id='"+id+"'";
            int i=smt.executeUpdate(q);
           if(i>0)
           {
               response.sendRedirect("recipient-dashboard.jsp");
           }
           
           
        }
  catch(Exception ex)
  {
  out.println(ex);
  }
            
            %>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
             <%
            String ic=request.getParameter("ic");
            try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
            Statement smt=con.createStatement();
            String q="update recieveditems set status=0 where id='"+ic+"'";
            int i=smt.executeUpdate(q);
           if(i>0)
           {
               response.sendRedirect("recipient-dashboard.jsp");
           }
           
           
        }
  catch(Exception ex)
  {
  out.println(ex);
  }
            
            %>
            
            
            
            
            
            
            
    </body>
</html>
