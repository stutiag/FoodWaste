<%-- 
    Document   : donator-dashboard
    Created on : May 28, 2019, 5:44:24 PM
    Author     : Admin
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Home|</title>
    </head>
    <body>
        
        <%@page import="java.sql.*" %>
        <%
        
        String uemail=(String)session.getAttribute("useremail");
        String ucity=(String)session.getAttribute("usercity");
        //out.println(uemail);
        //out.println(ucity);
        
        %>
        <a href="logoutprocess.jsp">Logout</a>
        <div class="container">
            <ul class="nav nav-tabs bg-success navbar-dark" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu1">Donate</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu2">My Donations</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="home" class="container tab-pane active"><br>
                  <h3>HOME</h3>
                  <p>Food for humanly</p>
                  <a href="topicslist.jsp">Community</a>
               
                </div>
            <div id="menu1" class="container tab-pane fade"><br>
                <form action="additem.jsp" name="additemform" method="post">
                    <p>To donate food,add items by clicking on add item</p>
                    <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">Add Item</button>
                        <div id="demo" class="collapse">
                        <table name="additemtable">
                            <tr>
                                <td>Item name</td>
                                <td><input type="text" name="itemname" required></td>
                            </tr>
                            <tr>
                                <td>Item Quantity</td>
                                <td><input type="text" name="itemquantity" required>in kg/packets/pieces</td>
                            </tr>
                            <tr>
                                <td>Item Type</td>
                                <td>
                                    <select name="itemtype">
                                        <option value="Packed">Packed</option>
                                        <option value="Cooked">Cooked</option>
                                        <option value="Raw Food">Raw food</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Item's Expiry Date</td>
                                <td><input type="date" name="expirydate"></td>
                            </tr>
                         
                        </table>
                        <br>
                        <button type="submit" class="btn btn-primary mb-2">Submit</button>
                        <button type="reset" class="btn btn-danger" mb-2">Reset</button>
                        </div>
                    </form>
            </div>
            <div id="menu2" class="container tab-pane fade"><br>
                <h3></h3>
        <%
        try
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
          Statement smt=con.createStatement();
          
          
          String pp="select * from donateditems where demail='"+uemail+"'";
          ResultSet rs=smt.executeQuery(pp);
          String name="";
            Integer  qty=0;
            String ty="";
            String exdate="";
            String srno="";
            Integer requestedQty = 0;
            
            out.println("<table class='table'><tr><th>Product Name</th>"
                    + "<th>Type</th><th>Best Before</th>"
                    + "<th>Available Quantity</th><th>Total Donated Quantity</th></tr>");
            
            while(rs.next())
            {
                
            name=rs.getString("name");
            qty=rs.getInt("quantity");
            ty = rs.getString("type");
            exdate = rs.getString("exdate");
            requestedQty = rs.getInt("requested_qty");
            out.println("<tr>");
            out.println("<td>"+name+"</td>");
            out.println("<td>"+ty+"</td>");
            out.println("<td>"+exdate+"</td>");
            Integer availableQty = qty - requestedQty;
            out.println("<td>"+ availableQty +"</td>");
            out.println("<td>"+qty+"</td>");
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
        </div>
        </div>
        
        
        
    </body>
</html>
