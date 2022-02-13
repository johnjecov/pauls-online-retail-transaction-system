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
            <form id = "regForm" action="">
                <h3 class = "formTitle">register</h3>
                <input type="text" name="" placeholder="enter your username" id="" class="inputs">
                <input type="password" name="" placeholder="enter your password" id="" class="inputs">
                  <input type="password" name="" placeholder="confirm password" id="" class="inputs">
                <input type="email" name="" placeholder="enter your email" id="" class="inputs">
                  <input type="number" name="" placeholder="enter your contact number" id="" class="inputs">
                <input type="text" name="" placeholder="enter your address" id="" class="inputs">
                <input type="captcha" value="Recaptcha Placeholder" class="inputs" id = "recaptcha">
                <input type="submit" value="register now" class="inputs LRButton" id = "regButton">
                <p>Already have an account? <a href="login.jsp" id = "goLogin">Login</a></p>
            </form>
            
            

        </div>
    </section>
    

    <!-- header section ends -->
   <script src="js/script.js"></script>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
   </body>
 
</html>
