<%-- 
    Document   : orderstatus
    Created on : 02 17, 22, 4:42:08 PM
    Author     : John Jeco Villanueva

--Change Status Images
--Resize Modal
--make image more responsive

//.item2 added padding of 5%

//legacy code
<div class="item2">
                        <img src="image/checkmark.png" alt="mark1" class="statusimg">
                        Pending<br>Your order is being processed.</div>
                    <div class="item2">
                        <img src="image/xmark.png" alt="mark2" class="statusimg">
                        Order Received<br>Your order is received and is now being prepared.</div>
                    <div class="item2">
                        <img src="image/nomark.png" alt="mark3" class="statusimg">
                        Order Delivered<br>Order delivered. Enjoy!</div>

<%= output %>

<div class="statuscontent2">
                <div class="statusitem3">
                    <p>Did you enjoy our services? Leave a feedback below!</p>
                    <a href="feedback.jsp" class="feedbackbutton">Feedback</a>
                </div>
            </div>

 <%
                if (test.getOrder_Status_Id() == 4) {
                    String f = String.format("<div class='statuscontent2'>\n"
                            + "<div class='statusitem3'>\n"
                            + "<p>Did you enjoy our services? Leave a feedback below!</p>\n"
                            + "<a href='feedback.jsp' class='feedbackbutton'>Feedback</a>\n"
                            + "</div>\n"
                            + "</div>\n"
                    );
                    out.println(f);
                }
            %>
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
                    Customer c = (Customer) session.getAttribute("customer");
                    

                    String s = String.format("<div class = 'statusitem'>\n"
                            + "<div class='item'>Customer Name:<br>%s %s</div>\n"
                            + "<div class='item'>Total:<br>%s</div>\n"
                            + "<div class='item'>Address:<br>%s</div>\n"
                            + "<div class='item'>Payment Type:<br>%s</div>\n"
                            + "<div class='item'>Purchases:<br>%s</div>\n"
                            + "</div>",
                            c.getName(), c.getSurname(), c.getOrder().getOrder_Total(),
                            c.getOrder().getAddress(), c.getOrder().getPayment_Method(),
                            c.getOrder().getOrderString());
                    //String.valueOf(test.getCustomer_Id()), String.valueOf(test.getOrder_Id()),
                    //test.getAddress(), test.getPayment_Method());
                    out.println(s);
                %>

                <div class="statusitem2">
                    <div class='item2'>
                        <%
                            ArrayList<String> status = ports.getOrderStats();
                            String output = status.get(test.getOrder_Status_Id());
                            boolean feedback = false;
                            boolean orderEmpty = c.getOrder().isEmpty();
                            boolean order5 = c.getOrder().getOrder_Status_Id() == 5;
                            
                            if (c.getOrder().getOrder_Status_Id() == 1) {
                                //output = "No active orders";
                                String d = String.format("<img src='image/checkmark.png' alt='mark1' class='statusimg'>\n"
                                        + "Order is still being processed.<br>Please be patient.\n");
                                out.println(d);

                            } else if (c.getOrder().getOrder_Status_Id() == 2) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark2' class='statusimg'>\n"
                                        + "Order has been recieved.<br>Please wait as we prepare your order.\n");
                                out.println(d);
                            } else if (c.getOrder().getOrder_Status_Id() == 3) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark3' class='statusimg'>\n"
                                        + "Order is now being delivered.<br>Good pizza will be at your doorstep!\n");
                                out.println(d);
                                feedback = true;
                            } else if (c.getOrder().getOrder_Status_Id() == 4) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark4' class='statusimg'>\n"
                                        + "Order Completed.<br>Thank you for choosing Paul's Pizzeria!\n");
                                out.println(d);
                            } else if (c.getOrder().isEmpty() || c.getOrder().getOrder_Status_Id() == 5) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark5' class='statusimg'>\n"
                                        + "No order at the moment.<br>Fill that cart with some pizza!\n");
                                out.println(d);
                                
                            }
                        %>
                    </div>
                </div>
            </div>
                    <%
                        if (c.getOrder().getOrder_Status_Id() == 4) {
                            String f = String.format("<div class='statuscontent2'>\n"
                                    + "<div class='statusitem3'>\n"
                                    + "<p>Have you received your order? Press the button below to give a feedback!</p>\n"
                                    + "<a href='feedback.jsp' class='feedbackbutton'>Order Received</a>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                            );
                            out.println(f);
                        }
                        
                        
                    %>
            <div class="bg-modal">
                <form class="modal-contents" action = "orderReceived" method = "POST">
                    <p class="modal-text">Has the order arrived?<br>Check the button below to verify and give feedback!</p>
                    <button type="submit" class="yesModal">Yes</button>
                    <button type="button" class="noModal">No</button>
                </form>
            </div>
            <script>
                var jsfeedback = <%=feedback%>
                var isEmpty = <%=orderEmpty%>
                var is5 = <%=order5%>
                console.log(jsfeedback);
                console.log(isEmpty);
                console.log(is5);
                
                if (isEmpty || is5){
                    document.querySelector('.statusitem').style.display = "none";
                }
                
                if (jsfeedback) {
                    document.querySelector('.statuscontent2').style.display = "flex";
                    document.querySelector('.bg-modal').style.display = "flex";

                }

                document.querySelector('.yesModal' && '.noModal').addEventListener("click", function () {
                    document.querySelector('.bg-modal').style.display = "none";
                });
            </script>
        </section>
</html>
