<%-- 
    Document   : footer
    Created on : Mar 21, 2022, 12:31:37 AM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <%@page import="java.util.*, ports.models.*"%>
    
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
        
    <title>Paul's Pizzeria</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<script src="js/script.js"></script>

<%

   String userF = "";
            if(session.getAttribute("customer")!= null)
            {
                Customer cust = (Customer) session.getAttribute("customer");
                userF = (String) cust.getUsername();
            }
%>

<section class="footer">
    <div class="box-container">

        <div class="box">
            <h3>QUICK LINKS</h3>
            <a href="/PORTS/index.jsp#home"> <i class="fas fa-arrow-right"></i> Home</a>
            <a href="/PORTS/index.jsp#about"> <i class="fas fa-arrow-right"></i> About</a>
            <a href="/PORTS/index.jsp#popular"> <i class="fas fa-arrow-right"></i> Popular</a>
            <a href="menu.jsp"> <i class="fas fa-arrow-right"></i> Menu</a>
        </div>

        <div class="box">
            <h3>EXTRA LINKS</h3>            
                <% if (userF == "") { %>
                <div class="dropdown">
                    <a href="login.jsp"> <i class="fas fa-arrow-right"></i> My Account</a>       
                </div>
                <% } %>

                <% if (userF != "") { %>
                <div class="dropdown">
                    <a href="address.jsp"> <i class="fas fa-arrow-right"></i> My Account</a>
                </div>
            <% } %>
        </div>

        <div class="box">
            <h3>OPENING HOURS</h3>
            <p>Tuesday to Saturday: 1:00 P.M. to 8:00 P.M.</p>
            <p>Sunday and Monday: CLOSED</p>
        </div>
    </div>

    <div class="bottom">
        <div class="share">
            <a href="https://www.facebook.com/Pauls-Pizzeria-100627485039888/" class="fab fa-facebook-f"></a>
            <a href="" class="fab fa-twitter"></a>
            <a href="https://www.instagram.com/paulspizzeria/" class="fab fa-instagram"></a>
        </div>
        
        <div class="credit"> Created by <span>TechPare</span> | All Rights Reserved. </div>
    </div>

</section>
