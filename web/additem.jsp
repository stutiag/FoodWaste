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
        <script src="https://kit.fontawesome.com/bf510813c4.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title></title>
    </head>
    <%@page  import="java.sql.*,java.util.UUID" %>
    
    <body>
    <% 
        String itname,ittype;
        String itqty,expdate;
        itname=request.getParameter("itemname");
        itqty=request.getParameter("itemquantity");
        ittype=request.getParameter("itemtype");
        expdate=request.getParameter("expirydate");
        String uniqueID = UUID.randomUUID().toString();
        
        String uemail=(String)session.getAttribute("useremail");
        String ucity=(String)session.getAttribute("usercity");
        //out.println(uemail);
        //out.println(ucity);

        try
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
          Statement smt=con.createStatement();
          
          
          /*String pp="select * from donateditems ";
          ResultSet rs=smt.executeQuery(pp);
          int count=1;
          while(rs.next())
          {
          count ++;
          }*/
          
          
          
          
          String query="insert into donateditems(id,name,quantity,type,exdate,dcity,demail) values( '"+uniqueID+"',   '"+itname+"','"+itqty+"','"+ittype+"','"+expdate+"','"+ucity+"','"+uemail+"')";
          int i=smt.executeUpdate(query);
          if(i>0)
          {
              out.println("<div class='alert alert-success'><strong>Success Item has been added to cart!</strong> For More Donations <a href='donator-dashboard.jsp' class=alert-link>Click on More Donations </a></div>");
            /*out.println("The item has been added");
             out.println("<a href='donator-dashboard.jsp'>More Donations</a>");*/
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
