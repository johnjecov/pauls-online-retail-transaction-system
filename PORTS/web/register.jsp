<%@page import="java.util.*, ports.models.*"%>
<%
 
    //clears cache so that if session is already destroyed then user won't be able to go 
    //back to the success page
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expire", 0);
 
    if (session.getAttribute("customer") != null)
    {
         Customer c = (Customer) session.getAttribute("customer");
         if(c.getAddresses().isEmpty())
            response.sendRedirect("address.jsp");
         else
            response.sendRedirect("login.jsp"); 
    }
    else if (session.getAttribute("employee") != null)
    {
        response.sendRedirect("adminOrderList.jsp");
    }
 
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register to Paul's Pizzeria</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
    <body>
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
     <!-- header section ends -->
     
    <!-- Login/Register section starts  -->
    <section class="LRForm" id="LRForm">
        
        
        <div class="image">
          
        </div>
    
        <div class="content">            
            <form id = "regForm" action="register" method = "POST">
                <h3 class = "formTitle">Register</h3>
                <input type="text" name="unameR" placeholder="Username" id="" class="inputsR" required>
                <div id ="givenLast">
                    <input type="text" name="givenNameR" placeholder="Given name" id="givenNameR" class="givenLastField" required>
                    <input type="text" name="lastNameR" placeholder="Last name" id="lastNameR" class="givenLastField" required>
                </div>
                <div class="passwordDiv">
                <input type="password" name="pwordR" placeholder="Password" id="pwordRd" class="inputsR" required>
                <i class="far fa-eye" id="togglePassword" style="margin-left: -30px; margin-top: 15px;cursor: pointer;"></i>
                </div>
                
                <div class="passwordDiv">
                <input type="password" name="cpwordR" placeholder="Confirm password" id="cpwordRd" class="inputsR" required>
                <i class="far fa-eye" id="toggleCPassword" style="margin-left: -30px; margin-top: 15px;cursor: pointer;"></i>
                </div>
                
                <input type="email" name="emailR" placeholder="Email" id="" class="inputsR" required>
                <input type="number" name="contactR" placeholder="Contact Number" id="" class="inputsR" required>
      
                <img src ="Captcha" >
                <input type="text" name = "captchaR" placeholder = "Input Captcha" class="inputsR" id = "captcha" required>
                <% 
                    String errorMessageR = "";
                    ServletContext sc = getServletContext();
                    if(sc.getAttribute("ErrorMessageR") != null)
                    {
                        errorMessageR = (String) sc.getAttribute("ErrorMessageR");
                        sc.removeAttribute("ErrorMessageR");
                    }
                %>
                <p id = "regformMessage" style = "color: #302c2c;font-size: 1.3rem"><%= errorMessageR %></p>
                <input type="submit" value="Register Now" class="inputsR LRButton" id = "regButton">
                <p>Already have an account? <a href="login.jsp" id = "goLogin">Login</a></p>
            </form>
        </div>
                
    </section>
    

    <!-- header section ends -->
   <script src="js/script.js"></script>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
     <%@include file="footer_external.jsp"%>
   </body>
    <style>
       .passwordDiv
       {
           display: flex;
           margin-left: -12px;
       }
   </style>
 <script> 
                const togglePassword = document.querySelector('#togglePassword');
                const toggleCPassword = document.querySelector('#toggleCPassword');
                
                const password = document.querySelector('#pwordRd');
                const cpassword = document.querySelector('#cpwordRd');

                togglePassword.addEventListener('click', function (e) {
                  // toggle the type attribute
                  const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                  password.setAttribute('type', type);
                             
                  // toggle the eye slash icon
                  this.classList.toggle('fa-eye-slash');
              });
              
                toggleCPassword.addEventListener('click', function (e) {
                  // toggle the type attribute
               
                  const typeC = cpassword.getAttribute('type') === 'password' ? 'text' : 'password';
                  cpassword.setAttribute('type', typeC);
                 
                  // toggle the eye slash icon
                  this.classList.toggle('fa-eye-slash');
              });

                
                
                </script>
            
</html>
