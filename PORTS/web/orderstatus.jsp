<%@page import="java.util.*, ports.models.*"%>
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
        <%@include file="customerLogout.jsp"%>
        <!-- header section ends --> 
        <section class="status">
            <div class="statusheader">
                <p class="headertext">Order Status</p>
            </div>


            <div class="statuscontent">
                <%
                    ServletContext sc = getServletContext();
                    PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
                    ArrayList orderStatus = ports.getOrderStats();
                    Customer c = (Customer) session.getAttribute("customer");
                    Order customerOrder = c.getOrder(ports);
                    boolean orderEmpty = customerOrder.isEmpty();
                    
                    int orderid = -999;
                            
                    
                    if (!orderEmpty) {
                        String s = String.format("<div class = 'statusitem'>\n"
                         + "<div class='item'>Customer Name:<br>%s %s</div>\n"
                         + "<div class='item'>Total:₱<br>%s</div>\n"
                         + "<div class='item'>Address:<br>%s</div>\n"
                         + "<div class='item'>Payment Type:<br>%s</div>\n"
                         + "<div class='item'>Purchases:<br>%s</div>\n"
                         + "</div>",
                         c.getName(), c.getSurname(), customerOrder.getOrder_Total(),
                         customerOrder.getAddress(), customerOrder.getPayment_Method(),
                         customerOrder.getOrderString());
                        out.println(s);
                        orderid = customerOrder.getOrder_Id();
                    }
                 
                %>

                <div class="statusitem2">
                    <div class='item2'>
                        <%
                            ArrayList<String> status = ports.getOrderStats();
                            boolean feedback = false;
                            
                            boolean order5 = false;
                            
                            if(!orderEmpty)
                                order5 = customerOrder.getOrder_Status_Id() == 5;
                            
                            if (orderEmpty || customerOrder.getOrder_Status_Id() == 5) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark5' class='statusimg'>\n"
                                        + "No order at the moment.<br>Fill that cart with some pizza!\n");
                                out.println(d);
                            }
                            else if (customerOrder.getOrder_Status_Id() == 1) {
                                //output = "No active orders";
                                String d = String.format("<img src='image/checkmark.png' alt='mark1' class='statusimg'>\n"
                                        + "Order is still being processed.<br>Please be patient.\n");
                                out.println(d);

                            } else if (customerOrder.getOrder_Status_Id() == 2) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark2' class='statusimg'>\n"
                                        + "Order has been recieved.<br>Please wait as the delivery date comes.\n");
                                out.println(d);
                            } else if (customerOrder.getOrder_Status_Id() == 3) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark3' class='statusimg'>\n"
                                        + "Order is now being prepared.<br>Good pizza will be at your doorstep!\n");
                                out.println(d);
                                feedback = true;
                            } else if (customerOrder.getOrder_Status_Id() == 4) {
                                String d = String.format("<img src='image/checkmark.png' alt='mark4' class='statusimg'>\n"
                                        + "Order is now being delivered.<br>Thank you for choosing Paul's Pizzeria!\n");
                                out.println(d);
                                feedback = true;
                            }
                        %>
                    </div>
                </div>
            </div>
                    <%
                        if ( !orderEmpty && customerOrder.getOrder_Status_Id() == 4) {
                            String f = String.format("<div class='statuscontent2'>\n"
                                    + "<div class='statusitem3'>\n"
                                    + "<p>Have you received your order? Press the button below to give a feedback!</p>\n"
                                    + "<a onclick = 'orderReceived()' class='feedbackbutton'>Order Received</a>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                            );
                            out.println(f);
                        }  
                    %>
            <div class="bg-modal">
                <form class="modal-contents" action = "orderReceived" method = "POST">
                    <p class="modal-text">Has the order arrived?<br>Click yes to confirm and finish your order, and no if the order hasn't arrived!</p>
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
                
                function orderReceived() {
                    document.querySelector('.statuscontent2').style.display = "flex";
                    document.querySelector('.bg-modal').style.display = "flex";
                }
            </script>
        </section>
                  <%@include file="footer_external.jsp"%>
    </body>
</html>
