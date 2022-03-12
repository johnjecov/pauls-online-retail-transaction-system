<%-- 
    Document   : orderstatus
    Created on : 02 17, 22, 4:42:08 PM
    Author     : John Jeco Villanueva

<div class="item2">
                        <img src="image/checkmark.png" alt="mark1" class="statusimg">
                        Pending<br>Your order is being processed.</div>
                    <div class="item2">
                        <img src="image/xmark.png" alt="mark2" class="statusimg">
                        Order Received<br>Your order is received and is now being prepared.</div>
                    <div class="item2">
                        <img src="image/nomark.png" alt="mark3" class="statusimg">
                        Order Delivered<br>Order delivered. Enjoy!</div>


--after java snip
<%= output %>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Status</title>

        <link href="orderstatus.jsp?v={random number/string}" rel="stylesheet">

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
                <p class="headertext">Order Status</p>
            </div>

            
            <div class="statuscontent">
                <%
                ServletContext sc = getServletContext();
                PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
                ArrayList<Order> orderList = (ArrayList) ports.getOrderHistory("order_id");
                ArrayList orderStatus = ports.getOrderStats();
                Order test = orderList.get(0);
                
                            String s = String.format("<div class = 'statusitem'>\n"
                                    + "<div class='item'>Customer Name:<br>%s</div>\n"
                                    + "<div class='item'>Total:<br>%s</div>\n"
                                    + "<div class='item'>Address:<br>%s</div>\n"
                                    + "<div class='item'>Payment Type:<br>%s</div>\n"
                                    + "</div>",
                                    String.valueOf(test.getCustomer_Id()), String.valueOf(test.getOrder_Id()), 
                                    test.getAddress(), test.getPayment_Method());
                            out.println(s);
            %>

                <div class="statusitem2">
                    <%
                    ArrayList<String> status = ports.getOrderStats();
                    String output = status.get(test.getOrder_Status_Id());
                    
                    if(test.getOrder_Status_Id() == 1){
                    //output = "No active orders";
                    String d = String.format("");
                    } else if(test.getOrder_Status_Id() == 2){
                    //output = "No active orders";
                    } else if(test.getOrder_Status_Id() == 3){
                    //output = "No active orders";
                    } else if(test.getOrder_Status_Id() == 4){
                    //output = "No active orders";
                    } else if(test.getOrder_Status_Id() == 5){
                    //output = "No active orders";
                    }
                    %>
                    
                </div>
            </div>

            <div class="statuscontent2">
                <div class="statusitem3">
                    <p>Did you enjoy our services? Leave a feedback below!</p>
                    <a href="feedback.jsp" class="feedbackbutton">Feedback</a>
                </div>
            </div>
        </section>
</html>
