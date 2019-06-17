<%-- 
    Document   : login
    Created on : Jun 13, 2019, 5:54:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="design.html" %>
    </head>
    <body>
        <br>
        <br>
    <center>
        <div class="card" style="width:400px height:400px">
    
    <div class="card-body">
        <form action="ser2" name="login" method="post">
            <table>
            <tr>
                <td><i class="fas fa-user"></i><input type="email" name="logemail" placeholder="Email"required></td>
            </tr>
            <tr>
                <td><i class="fas fa-key"></i><input type="password" name="pass" placeholder="Password" required></td>
            </tr>
            </table>

            <center>
            <br>
            <input type="submit" value="LogIn" class="btn btn-primary">
            </center>
        </form>
    </div>
  </div>
    </center> 
    </body>
</html>
