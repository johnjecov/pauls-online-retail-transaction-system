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
    <title>Login to Paul's Pizzeria</title>

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

            <form id = "loginForm" action="login" method = "POST">
                <h3 class = "formTitle">login</h3>
                <input type="text" name="loginUname" placeholder="enter your username" id="loginUname" class="inputs" required>
                <input type="password" name="loginPass" placeholder="enter your password" id="loginPass" class="inputs" required>
                <% 
                    String errorMessage = "";
                    ServletContext sc = getServletContext();
                    if(sc.getAttribute("ErrorMessageL") != null)
                    {
                        errorMessage = (String) sc.getAttribute("ErrorMessageL");
                        sc.removeAttribute("ErrorMessageL");
                    }
                %>
                <p style = "color: #302c2c;font-size: 1.3rem"><%= errorMessage %></p>
                <input type="submit" value="login now" class="inputs LRButton" id = "loginButton">
                <p>don't have an account? <a href="register.jsp" id = "goReg">create one</a></p>
            </form>
            
         
            
            

        </div>
    </section>
    

    <!-- header section ends -->
   <script src="js/script.js"></script>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
   </body>
 
</html>
