<%-- 
    Document   : menu
    Created on : 02 10, 22, 6:11:38 PM
    Author     : Lucas
--%>
<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="image/logo.png">
    <title>Change Password</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
    <body>
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
    <%@include file="customerLogout.jsp"%>
     <!-- header section ends -->
     
    <!-- Login/Register section starts  -->
    <section class="changePass" id="changePass">
        <div class = "content">
            <form id = "changePassForm" action="changePassword" method = "POST">
                <h3 class = "formTitle">change password</h3>
                
                <input type="password" name="newPassC" placeholder="Enter your new password" id="" class="inputsC" required>
                <input type="password" name="confirmNewPassC" placeholder="Confirm password" id="" class="inputsC" required>
                <input type="password" name="oldPassC" placeholder="Enter your old password" id="" class="inputsC" required>
                <% 
                    String errorMessageC = "";
                    ServletContext sc = getServletContext();
                    if(sc.getAttribute("ErrorMessageC") != null)
                    {
                        errorMessageC = (String) sc.getAttribute("ErrorMessageC");
                        sc.removeAttribute("ErrorMessageC");
                    }
                %>
                <p style = "color: #302c2c;font-size: 1.3rem"><%= errorMessageC %></p>                
                <input type="submit" value="change password now" class="inputsC LRButton" id = "regButton">
            </form>  
        </div>
    </section>
    

   <!-- header section ends -->
   <script src="js/script.js"></script>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
     <%@include file="footer_external.jsp"%>
   </body>
 
</html>
