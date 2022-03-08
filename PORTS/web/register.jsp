<%-- 
    Document   : menu
    Created on : 02 10, 22, 6:11:38 PM
    Author     : Lucas
--%>

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
                <h3 class = "formTitle">register</h3>
                <input type="text" name="unameR" placeholder="Username" id="" class="inputsR" required>
                <div id ="givenLast">
                    <input type="text" name="givenNameR" placeholder="Given name" id="givenNameR" class="givenLastField" required>
                    <input type="text" name="lastNameR" placeholder="Last name" id="lastNameR" class="givenLastField" required>
                </div>
                <input type="password" name="pwordR" placeholder="Password" id="" class="inputsR" required>
                <input type="password" name="cpwordR" placeholder="Confirm password" id="" class="inputsR" required>
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
                <p style = "color: #302c2c;font-size: 1.3rem"><%= errorMessageR %></p>
                <input type="submit" value="Register Now" class="inputsR LRButton" id = "regButton">
                <p>Already have an account? <a href="login.jsp" id = "goLogin">Login</a></p>
            </form>
        </div>
                
    </section>
    

    <!-- header section ends -->
   <script src="js/script.js"></script>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
   </body>
 
</html>
