<%-- 
    Document   : orderstatus
    Created on : 02 17, 22, 4:42:08 PM
    Author     : John Jeco Villanueva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Status</title>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    
    <body>
            <!-- header section starts -->
            <%@include file="header_external.jsp"%>
             <!-- header section ends -->
             
        <section class="status">
            <div class="statusheader">
                <p>Order Status</p>
            </div>
            
            <div class="statuscontent">
                <div class="statusitem">
                <p>Customer Name:<br><%%></p>
                <p>Total:<br><%%></p>
                <p>Address:<br><%%></p>
                <p>Payment Type:<br><%%></p>
            </div>
            <div class="statusitem">
                <p>Pending<br>Your order is being processed.</p>
                <p>Order Received<br>Your order is received and is now being prepared.</p>
                <p>Order Delivered<br>Order delivered. Enjoy!</p>
            </div>
            </div>
            
            <div class="statuscontent2">
            <div class="statusitem2">
                <p>Did you enjoy our services? Leave a feedback below!</p>
                <a href="feedback.jsp" class="feedbackbutton">Feedback</a>
            </div>
            </div>
        </section>
</html>
