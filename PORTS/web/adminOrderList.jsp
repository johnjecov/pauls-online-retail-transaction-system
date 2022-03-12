<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, ports.models.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/adminOrderList.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
    </head>
    <body scroll="no" style="overflow: hidden">
        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo.jpg" alt="Paul's Pizzeria Logo">
                <ul class='adminOptions'>
                    <li class="options"><a href="/PORTS/adminHistoryPage.jsp">Sales</a></li>
                    <li class="options"><a href="/PORTS/adminOrderList.jsp">Order List</a></li>
                    <li class="options"><a href="/PORTS/admin.jsp">Menu</a></li>
                    <li class="options"><a href="#home">Analytics</a></li>
                </ul>
                <p class='logout'>Logout</p>
            </div>
            <div class="pageContent">
                <div class="adminGreetings">
                    <p class='helloAdmin'>Hello, admin</p>
                </div>
                <div class="adminContent">
                    <div class="arrangeOptions">
                        <label for="arrange">Arrange by: </label>

                        <select name="arrange" class="arrange">
                            <option value="aProperty">Order ID</option>
                            <option value="aProperty">Date</option>
                            <option value="aProperty">Name</option>
                            <option value="aProperty">Payment</option>
                            <option value="aProperty">Address</option>
                            <option value="aProperty">Order</option>
                            <option value="aProperty">Contact</option>
                            <option value="aProperty">Paid</option>
                            <option value="aProperty">Status</option>
                        </select>

                    </div>
                    <div class='orderList'>
                        <div class="property">Order ID</div>
                        <div class="property">Date</div>
                        <div class="property">Name</div>
                        <div class="property">Payment</div>
                        <div class="property">Address</div>
                        <div class="property">Order</div>
                        <div class="property">Contact</div>
                        <div class="property">Paid</div>
                        <div class="property">Status</div>
                    </div>

                    <%
                        ServletContext sc = getServletContext();
                        PortsDatabase ports = (PortsDatabase) getServletContext().getAttribute("dbConnection");
                        ArrayList<Order> orderList = (ArrayList) ports.getOrderHistory("order_id");
                        ArrayList orderStatus = ports.getOrderStats();
                        for (Order x : orderList) {
                            String s = String.format("<div class = 'orderBody'>\n"
                                    + "<ul class = 'orders'>\n"
                                    + "<li class = 'orderProperty'>%s</li>"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "<li class = 'orderProperty'>%s</li>\n"
                                    + "</ul>\n"
                                    + "<p class = 'orderRemove' id = 'orderRemoveID'>%s</p>\n"
                                    + "</div>",
                                    String.valueOf(x.getOrder_Id()), x.getOrder_Delivery_Date(), String.valueOf(x.getCustomer_Id()), x.getPayment_Method(),
                                    x.getAddress(), String.valueOf(x.getOrder_Id()), x.getPayment_Status(), orderStatus.get(x.getOrder_Status_Id() - 1), "+");
                            out.println(s);
                        }
                    %>

                    <script>
                        document.getElementById('orderRemoveID').addEventListener('click',
                                function () {
                                    document.querySelector('.cancelModal').style.display = 'flex';
                                });

                    </script>
                    <div class="pageSelector">
                        <ul class="pageList">
                            <li class="pageNumber1"><a>1</a></li>
                            <li class="pageNumber"><a>2</a></li>
                            <li class="pageNumber"><a>3</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="cancelModal">
            <div class="modalContent">
                <p class="modalText">
                    Do you want to cancel<br>orderN
                </p>
                <div class="modalButtons">
                    <button class="modalButtonYes" type="button">Yes</button>
                    <button class="modalButtonNo" type="button">No</button>
                    <script>
                        document.querySelector('.modalButtonYes').addEventListener('click',
                                function () {
                                    document.querySelector('.cancelModal').style.display = 'none';
                                    var myobj = document.getElementById("order1");
                                    myobj.remove();
                                });

                        document.querySelector('.modalButtonNo').addEventListener('click',
                                function () {
                                    document.querySelector('.cancelModal').style.display = 'none';
                                });

                    </script>
                </div>
            </div>
        </div>
    </body>
</html>
