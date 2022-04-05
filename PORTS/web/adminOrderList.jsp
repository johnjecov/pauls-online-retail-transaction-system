
<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/adminOrderList.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="image/logo.png">
        <title>Order List</title>
    </head>
    <body scroll="no" style="overflow: hidden">
         <%@include file="adminLogout.jsp"%>
     
        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo_1.jpg" alt="Paul's Pizzeria Logo">
                <ul class='adminOptions'>
                    <li class="options"><a href="adminHistoryPage.jsp">Sales</a></li>
                    <li class="options"><a href="adminOrderList.jsp">Order List</a></li>
                    <li class="options"><a href="admin.jsp">Menu</a></li>
                    <li class="options"><a href="adminAnalytics.jsp">Analytics</a></li>
                </ul>
                <a style="text-decoration:none;" class = "logout" href="./logout">Logout</a>
            </div>
            
            <% 
            ServletContext sc = getServletContext();
            String adminModalDisplay = "none";
            String message = "No message";
            if(sc.getAttribute("adminModalDisplay") != null)
            {
                adminModalDisplay = (String) sc.getAttribute("adminModalDisplay");
                sc.removeAttribute("adminModalDisplay");

            }
            if(sc.getAttribute("adminModalMessage") != null)
            {
                message = (String) sc.getAttribute("adminModalMessage");    
                sc.removeAttribute("adminModalMessage");
            }
            
   
            %>
            <div id = "transactionModalAdmin" class = "modal"  style = <% out.println(String.format("\"display: %s;\"",adminModalDisplay)); %> > 
                <form id = 'finalConfirmation' class ='mContent' action ='adminUpdate' method = 'POST'>
                    <p><%= message %></p>    
                    <hr>
                    <input type ="submit" value ="Confirm Update" class = "summaryButtons">
                    <button class = "summaryButtons" value = "Cancel Update" type = "button" onclick = "closeModal()">Cancel Edit</button>
                </form>
            </div>
            <div class="pageContent">
                <div class="adminGreetings">
                    <p style="font-family: 'Satisfy', cursive;" class='helloAdmin'>Hello, admin!</p>
                </div>
                <div class="adminContent">
                    <div class='orderHeading'>
                        <div class="col1">ID</div>
                        <div class="col2">Date</div>
                        <div class="col2">Name</div>
                        <div class="col2">Payment Details</div>
                        <div class="col2">Address</div>
                        <div class="col3">Order</div>
                        <div class="col2">Contact</div>
                        <div class="col2">Payment Status</div>
                        <div class="col2">Order Status</div>
                        <div class="colx">X</div>
                    </div>
                    
                    <%  
                        PortsDatabase ports = (PortsDatabase) getServletContext().getAttribute("dbConnection");
                        ArrayList<Order> orderList = (ArrayList) ports.getOrderHistory("order_id");
                        ArrayList<String> orderStatus = ports.getOrderStats();
                        
                        if(orderList.size() == 0){
                            out.println(
                                    "<div class = 'orderRow'>"
                                        + "<div class = col3>No Active Orders</div>"
                                  + "</div>");
                        }
                        for (Order x : orderList) {
                            String address = x.getAddress().toString();
                            String order_id = String.valueOf(x.getOrder_Id());
                            String status = orderStatus.get(x.getOrder_Status_Id() - 1);
                            String disableButton = "";
                            String disablePaymentButton = "";
                            String paymentStyle = "";
                            String updateStyle = "";
                            String paymentDetails = String.format("%s  PHP<br>%s", String.valueOf(x.getOrder_Total()),x.getPayment_Method());
                            String form1name = String.format("paymentF%d", x.getOrder_Id());
                            String form2name = String.format("updateF%d", x.getOrder_Id());
                            String form3name = String.format("deleteF%d", x.getOrder_Id());
                            System.out.print(form1name);
                            System.out.println("Status id " + x.getOrder_Status_Id());
                             if(x.getOrder_Status_Id() >= 4)
                             {
                                 disableButton = "disabled";
                                 updateStyle = "style = 'background-color: #008C45'";
                             }
                             
                            if(x.getPayment_Status().equals("paid"))
                             {
                                 disablePaymentButton = "disabled";
                                 paymentStyle = "style = 'background-color: #008C45'";
                             }
                                
                             
                            String s = String.format(
                                "<div class = 'orderRow'>"
                                    + "<div class='col1'>%s</div>"
                                    + "<div class='col2'>%s</div>"
                                    + "<div class='col2'>%s</div>"
                                    + "<div class='col2'>%s</div>"
                                    + "<div class='col2'>%s</div>"
                                    + "<div class='col3'>%s</div>"
                                    + "<div class='col2'>%s</div>"
                                    + "<form id = '%s' action ='updatePayment' method = 'POST' style = 'display: none'>"
                                         + "<input type = 'text' name = 'adminUpdateOrderId' value = '%s'>"
                                    + "</form>"
                                    + "<div class='col2'><button class='statusButtons' type = 'submit' %s form = '%s' %s>%s</button></div>"
                                        + "<form id = '%s' action ='updateOrderStatus' method = 'POST' style = 'display: none'>"
                                             + "<input type = 'text' name = 'adminUpdateOrderId' value = '%s'>"
                                        + "</form>"
                                    + "<div class='col2'><button class='statusButtons' type = 'submit' %s form = '%s' %s>%s</button></div>"
                                        + "<form id = '%s' action ='deleteOrder' method = 'POST' style = 'display: none'>"
                                             + "<input type = 'text' name = 'adminUpdateOrderId' value = '%s'>"
                                        + "</form>"
                                    + "<div class='colx'><button type = 'submit' form = '%s'>X</button></div>"
                             + "</div>",
                                    order_id, x.getOrder_Delivery_Date(), x.getCustomerName(), paymentDetails,
                                    address.toString(), x.getOrderString(), x.getCustomerContactNumber(),
                                    form1name, order_id, paymentStyle, form1name,disablePaymentButton, x.getPayment_Status(),
                                    form2name, order_id, updateStyle, form2name, disableButton, status,
                                    form3name, order_id,form3name);
                            out.println(s);
                            
                        }

                    %>
                </div>
                              
            </div>

                    
                    
        </div>
    </body>
    
    <script>
        function closeModal()
        {

            var modal = document.getElementById("transactionModalAdmin");
            modal.style.display = "none";
        }
    </script>
</html>
