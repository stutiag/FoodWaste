<%-- 
    Document   : viewdonatorlist
    Created on : May 30, 2019, 11:25:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
        String uemail=(String)session.getAttribute("useremail");
        String ucity=(String)session.getAttribute("usercity");
        String uname=(String)session.getAttribute("username");
       
        //out.println(uname);
        
         //out.println("<br>"+uemail);
       //out.println("<br>"+ucity);
        
        
        
        try
        {
            String email=request.getParameter("email");
            String name=request.getParameter("name");
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
            Statement smt=con.createStatement();
            String q1="select * from donateditems where id='"+id+"' ";
            
            ResultSet rs=smt.executeQuery(q1);
            String n="";
            String q="";
            String de="";
           
           while(rs.next())
           {
               
               n=rs.getString("name");
                q=rs.getString("quantity");
                de=rs.getString("demail");
               
               
               
               
           }
            String pp="insert into recieveditems(id,name,quantity,demail,rname,remail) values('"+id+"','"+n+"', '"+q+"', '"+de+"', '"+uname+"', '"+uemail+"'     )";
            
          
           int i=smt.executeUpdate(pp);
           if(i>0)
           {
           response.sendRedirect("recipient-dashboard.jsp");
           }
           String q2="delete from donateditems where id='"+id+"' ";
           smt.executeUpdate(q2);
        }
        
        
        catch(Exception e)
        {
        out.println(e);
        }


        %>
        
    </body>
</html>
