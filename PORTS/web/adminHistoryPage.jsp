<%-- 
    Document   : adminHistoryPage
    Created on : 02 14, 22, 1:01:41 AM
    Author     : chuah_000

change li class pageNumber2 because it is a placeholder
change orders from "----------" to backend
--%>

<%-- scroll="no" style="overflow: hidden" --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, ports.models.*, org.json.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/adminHistory.css?nocache={timestamp}" type="text/css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
    </head>
    <body scroll="no" style="overflow: hidden">


        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo_1.jpg" alt="Paul's Pizzeria Logo">
                <ul class='adminOptions'>
                    <li class="options"><a href="#home">Sales</a></li>
                    <li class="options"><a href="#home">Order List</a></li>
                    <li class="options"><a href="#home">Menu</a></li>
                    <li class="options"><a href="#home">Analytics</a></li>
                </ul>
                <p class='logout'>Logout</p>
            </div>
            <div class="pageContent">
                <div class="adminGreetings">
                    <p class='helloAdmin'>Hello, admin</p>
                </div>
                <div class="adminContent">
                    <form class="arrangeOptions" id = "adminSortForm" action="adminHistorySort" method = "POST">
                        <label for="arrange">Arrange by: </label>
                        <select name="arrange" class="arrange" id="arrange" onchange="this.form.submit()">
                            <option value="order_id"></option>
                            <option value="order_id">Order ID</option>
                            <option value="order_delivery_date">Date</option>
                            <option value="order_total">Price</option>
                        </select>
                    </form>

                    <div class='orderProperties'>
                        <div class="property">Order ID</div>
                        <div class="property">Date</div>
                        <div class="property">Product ID</div>
                        <div class="property">Product Name</div>
                        <div class="property">Quantity</div>
                        <div class="property">Toppings ID</div>
                        <div class="property">Toppings</div>
                        <div class="property">Toppings Quantity</div>
                        <div class="property">Total Price</div>
                    </div>

                    <%
                        ServletContext sc = getServletContext();
                        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");

                        String selectedSort = "order_id";
                        if (sc.getAttribute("selectedSortAttribute") != null) {
                            selectedSort = (String) sc.getAttribute("selectedSortAttribute");
                        }

                        ArrayList<Order> orderList = (ArrayList) ports.getOrderSales(selectedSort);
                        Queue<String> productsList = new LinkedList();
                        Queue<String> toppingsList = new LinkedList();
                        ArrayList<String> orderReports = new ArrayList();

                        String q = "<div class='orderMain' id='orderMain'>";
                        out.println(q);

                        for (Order x : orderList) {
                            ArrayList<OrderItem> orderItems = x.getItems();

                            String r = String.format("<div class = 'orderPropertyChildren'>%s</div>\n"
                                    + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                    + "<div class = 'orderPropertyColumnBig'>",
                                    String.valueOf(x.getOrder_Id()),
                                    x.getOrder_Delivery_Date());

                            String s = "";
                            String t = "";
                            String u = "";
                            String v = "";
                            for (OrderItem y : orderItems) {
                                if (y.getToppings().size() == 0) {
                                    u += String.format(
                                            "<div class = 'orderPropertyEmptyRow2'>"
                                            + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                            + "</div>",
                                            "No Toppings Added");
                                }

                                productsList.add(String.valueOf(y.getProduct().getId()));
                                productsList.add(String.valueOf(y.getProduct().getName()));
                                productsList.add(String.valueOf(y.getQuantity()));

                                s += String.format(
                                        "<div class = 'orderPropertyRow'>"
                                        + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                        + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                        + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                        + "</div>",
                                        productsList.remove(),
                                        productsList.remove(),
                                        productsList.remove());

                                if (y.getToppings().size() > 1) {
                                    s += String.format(
                                            "<div class = 'orderPropertyEmptyRow'>"
                                            + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                            + "</div>",
                                            "e");
                                }

                                ArrayList<OrderItemToppings> orderItemToppings = y.getToppings();

                                for (OrderItemToppings z : orderItemToppings) {
                                    toppingsList.add(String.valueOf(z.getTopping().getId()));
                                    toppingsList.add(String.valueOf(z.getTopping().getName()));
                                    toppingsList.add(String.valueOf(z.getQuantity()));

                                    u += String.format(
                                            "<div class = 'orderPropertyRow'>"
                                            + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                            + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                            + "<div class = 'orderPropertyChildren'>%s</div>\n"
                                            + "</div>",
                                            toppingsList.remove(),
                                            toppingsList.remove(),
                                            toppingsList.remove());
                                }
                            }
                            t = String.format(
                                    "</div>"
                                    + "<div class = 'orderPropertyColumnBig'>");
                            v = String.format(
                                    "</div>"
                                    + "<div class = 'orderPropertyChildren'>%s</div>\n",
                                    x.getOrder_Total());
                            String orderReport = r + s + t + u + v;
                            orderReports.add(orderReport);

                        }
                        String w = "</div>";
                        out.println(w);

                        JSONArray data = new JSONArray(orderReports);
                    %>

                    <script>
                        var list_items = <%=data%>
                    </script>

                    <div class="pagenumbers" id="pagenumbers">
                    </div>

                    <form action="generatePDF.jsp">
                        <button class="generatePDF" type ="submit">Generate Summary Report PDF</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="js/adminHistory.js"></script>
</html>
