<%-- 
    Document   : recipient-dashboard
    Created on : May 28, 2019, 5:44:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Home|</title>
    </head>
    <%@page import="java.sql.*" %>
    <body>
        
        <%
        
        String uemail=(String)session.getAttribute("useremail");
        String ucity=(String)session.getAttribute("usercity");
        String uname=(String)session.getAttribute("username");
        
        //out.println("user email is =="+uemail);
        //out.println(ucity);
        %>
        <div class="container">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu1">Available Food</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu2">My Orders</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="home" class="container tab-pane active"><br>
                  <h3>HOME</h3>
                  <p>Food for humanly</p>
                </div>
            <div id="menu1" class="container tab-pane fade"><br>
        <%
            try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
            Statement smt=con.createStatement();
            String query="select * from donateditems where dcity='"+ucity+"' ";
            ResultSet rs=smt.executeQuery(query);
            
            String name="";
            String  qty="";
            String ty="";
            String exdate="";
            String srno="";
            
            out.println("<table class='table'><tr><th>Product Name</th><th>Quantity</th><th>Product Type</th><th>Expiry Date</th><th>Send Request</th></tr>");
            
            while(rs.next())
            {
                
            srno=rs.getString("srno");
            name=rs.getString("name");
            qty=rs.getString("quantity");
            ty=rs.getString("type");
            exdate=rs.getString("exdate");
            out.println("<tr>");
            out.println("<td>"+name+"</td>");
            out.println("<td>"+qty+"</td>");
            out.println("<td>"+ty+"</td>");
            out.println("<td>"+exdate+"</td>");
            out.println("<td><a href=receiveditem.jsp?id="+srno+" class='btn btn-danger'>Send Request</a></td>");
            out.println("</tr>");
            
            
            
            
            
            
            
            
            
            }
            out.println("</table>");
        }
        
        catch(Exception e)
        {
            out.println(e);
                    
        }
        

        %>
            </div>
            <div id="menu2" class="container tab-pane fade"><br>
                <h3>Menu 2</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            </div>
        </div>
    </body>
</html>
