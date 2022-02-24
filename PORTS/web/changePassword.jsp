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
    <title>Change Password</title>

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
    <section class="changePass" id="changePass">
        <div class = "content">
            <form id = "changePassForm" action="">
                <h3 class = "formTitle">change password</h3>
                <input type="password" name="" placeholder="enter your old password" id="" class="inputsC">
                <input type="password" name="" placeholder="enter your password" id="" class="inputsC">
                <input type="password" name="" placeholder="confirm password" id="" class="inputsC">
                <input type="submit" value="change password now" class="inputsC LRButton" id = "regButton">
         
            </form>
            
        </div>
    </section>
    

    <!-- header section ends -->
   <script src="js/script.js"></script>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
   </body>
 
</html>
