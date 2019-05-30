<%-- 
    Document   : additem
    Created on : May 29, 2019, 5:46:59 PM
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
        String itname,ittype;
        String itqty,expdate;
        itname=request.getParameter("itemname");
        itqty=request.getParameter("itemquantity");
        ittype=request.getParameter("itemtype");
        expdate=request.getParameter("expirydate");
        
        String uemail=(String)session.getAttribute("useremail");
        String ucity=(String)session.getAttribute("usercity");
        out.println(uemail);
        out.println(ucity);

        try
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
          Statement smt=con.createStatement();
          
          
          String pp="select * from donateditems ";
          ResultSet rs=smt.executeQuery(pp);
          int count=1;
          while(rs.next())
          {
          count ++;
          }
          
          
          
          
          
          
          
          
          
          String query="insert into donateditems(srno,name,quantity,type,exdate,dcity,demail) values( '"+count+"',   '"+itname+"','"+itqty+"','"+ittype+"','"+expdate+"','"+ucity+"','"+uemail+"')";
          int i=smt.executeUpdate(query);
          if(i>0)
          {
              out.println("The item has been added");
             out.println("<a href='donator-dashboard.jsp'>More Donations</a>");
          }
          else
          {
              out.println("item not added");
          }
          
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
    </body>
</html>
