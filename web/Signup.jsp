<%-- 
    Document   : Signup.jsp
    Created on : Jun 13, 2019, 3:14:04 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Here</title>
        <script src="https://kit.fontawesome.com/bf510813c4.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
       .navbar-nav .nav-link {
      padding-right: 0;
      padding-left: 0;
      text-align: right;
     }  
        </style>
    </head>
    <body>
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">No More Food Waste</a>
  
  <!-- Links -->
  <div class="collapse navbar-collapse justify-content-end" id="navbarDefault">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="index.jsp">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#about">About Us</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Signup.jsp">SignUp</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="login.jsp">Login</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Contactus.jsp">Contact</a>
    </li>
  </ul>
  </div>
</nav>
  
  <div class="container-fluid">
      <center>
        <h3>Are you a donator or receiver?</h3>
            <input type="button" name="register-type"  value="Donator"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            <input type="button" name="register-type"  value="Recipient" class="btn btn-primary" data-toggle="modal" data-target="#RModal">
    </center>
  </div>
      <!-- Footer -->
<footer class="page-footer font-small fixed-bottom" style="background-color: black;color:white">

  <!-- Footer Elements -->
  <div class="container">
      
      <!-- Call to action -->
    <ul class="list-unstyled list-inline text-center py-2">
      <li class="list-inline-item">
        <h5 class="mb-1">Register for free!</h5>
      </li>
      <li class="list-inline-item">
          <a href="Signup.jsp" class="button btn btn-outline-light" style="color:white">Sign Up</a>
      </li>
    </ul>
    <!-- Call to action -->


    <!-- Social buttons -->
    <ul class="list-unstyled list-inline text-center">
      <li class="list-inline-item">
        <a class="btn-floating btn-fb mx-1">
          <i class="fab fa-facebook-f"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-tw mx-1">
          <i class="fab fa-twitter"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-gplus mx-1">
          <i class="fab fa-google-plus-g"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-li mx-1">
          <i class="fab fa-linkedin-in"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-dribbble mx-1">
          <i class="fab fa-dribbble"> </i>
        </a>
      </li>
    </ul>
    <!-- Social buttons -->

  </div>
  <!-- Footer Elements -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2018 Copyright:NoMoreFoodWaste.com
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->  
        












<!-- The Modal -->
<form action="ser1" method="post" name="donator">
<input type="hidden" name="FormName" value="donator"/>
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Sign Up Here</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
    
          <table>
              <tr>
                  <td>Business Name</td>
                  <td><input type="text" name="business_name"></td>
              </tr>
              <tr>
                  <td>First Name</td>
                  <td><input type="text" name="fname" required></td>
              </tr>
           
              <tr>   
                  <td>Last Name</td>
                  <td><input type="text" name="lname"  required></td>
              </tr>
              <tr>
                  <td>Email</td>
                  <td><input type="email" name="email" required></td>
              </tr>
              <tr>
                  <td>Contact</td>
                  <td><input type="text" name="contact" pattern="[7|8|9][0-9]{9}" required></td>
              </tr>
              <tr>
                  <td>Address</td>
              </tr>
              <tr>
                  <td><input type="text" name="street" placeholder="street"></td>
                  <td><input type="text" name="city" placeholder="city"></td>
              </tr>
              <tr>
                  <td><input type="text" name="state" placeholder="state"></td>
                  <td><input type="text" name="zip" placeholder="zip code" pattern="[0-9]*"></td>
              </tr>
              <tr>
                  <td>Password</td>
                  <td><input type="password" name="pass" placeholder="password" required></td>
              </tr>
          </table>
          <center>
         <input type="submit" value="Submit">
          </center>
          
          
          
          
          
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
     
      
      </div>

    </div>
  </div>
</div>

</form>

<!-- The Modal -->
<form action="ser1" method="post" name="recipient">
<input type="hidden" name="FormName" value="recipient"/>
<div class="modal" id="RModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Sign Up Here</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
    
          <table>
              <tr>
                  <td>Organisation Name</td>
                  <td><input type="text" name="business_name"></td>
              </tr>
              <tr>
                  <td>First Name</td>
                  <td><input type="text" name="fname" required></td>
              </tr>
           
              <tr>   
                  <td>Last Name</td>
                  <td><input type="text" name="lname"  required></td>
              </tr>
              <tr>
                  <td>Email</td>
                  <td><input type="email" name="email" required></td>
              </tr>
              <tr>
                  <td>Contact</td>
                  <td><input type="text" name="contact" pattern="[7|8|9][0-9]{9}" required></td>
              </tr>
              <tr>
                  <td>Address</td>
              </tr>
              <tr>
                  <td><input type="text" name="street" placeholder="street"></td>
                  <td><input type="text" name="city" placeholder="city"></td>
              </tr>
              <tr>
                  <td><input type="text" name="state" placeholder="state"></td>
                  <td><input type="text" name="zip" placeholder="zip code" pattern="[0-9]*"></td>
              </tr>
              <tr>
                  <td>Password</td>
                  <td><input type="password" name="pass" placeholder="password" required></td>
              </tr>
          </table>
          <center>
         <input type="submit" value="Submit">
          </center>
          
          
          
          
          
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
     
      
      </div>

    </div>
  </div>
</div>

</form>





</body>
</html>
