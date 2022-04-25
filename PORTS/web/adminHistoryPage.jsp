<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, ports.models.*, org.json.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" href="css/adminHistory.css?nocache={timestamp}" type="text/css">
        <link rel="icon" type="image/png" href="image/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
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
            <div class="pageContent">
                <div class="adminGreetings">
                    <p class='helloAdmin'>Hello, Admin!</p>
                </div>
                <div class="adminContent">
                    <form class="arrangeOptions" id = "adminSortForm" action="adminHistorySort" method = "POST">
                        <label for="arrange">Arrange by: </label>
                        <select name="arrange" class="arrange" id="arrange" onchange="this.form.submit()">
                            <%                            ServletContext sc = getServletContext();
                                String selectedSort = "order_id";
                                String selectedSortLabel = "";
                                if (sc.getAttribute("selectedSortAttribute") != null) {
                                    selectedSort = (String) sc.getAttribute("selectedSortAttribute");
                                    if (selectedSort.equals("order_id")) {
                                        selectedSortLabel = "Order ID";
                                    } else if (selectedSort.equals("order_delivery_date")) {
                                        selectedSortLabel = "Date";
                                    } else if (selectedSort.equals("order_total")) {
                                        selectedSortLabel = "Price";
                                    } else {
                                    }
                                    sc.removeAttribute("selectedSortAttribute");
                                }
                            %>
                            <option value=<%=selectedSort%>><%=selectedSortLabel%></option>
                            <option value="order_id" >Order ID</option>
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
                        PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");

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

                    <div class="scrollnumbers">
                        <div class="pagenumbers" id="pagenumbers">
                        </div>
                    </div>
          
                    
                    <%
                        ArrayList<Order> orderRange = (ArrayList) ports.getOrderSales(selectedSort);
                        String pattern = "MM/dd/yyyy";
                        String pattern2 = "yyyy-MM-dd"; 
                        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern(pattern);
                        LocalDateTime min = LocalDateTime.now().minusDays(0);
                        String startDate = formatDate.format(min);
                        String endDate = startDate;
                        
                        if (!orderRange.isEmpty()) {
                            startDate = orderRange.get(0).getOrder_Made_Date().trim();
                            endDate = orderRange.get(orderRange.size()-1).getOrder_Delivery_Date().trim();
                        }
                        String defaultRange = String.format("%s - %s", startDate, endDate);
                        System.out.println(defaultRange);
                        /*
                        DateFormat formatDate = new SimpleDateFormat(pattern);
                        Date min = formatDate.parse(startDate);
                        Date max = formatDate.parse(endDate);
                        formatDate = new SimpleDateFormat(pattern2);
                        String minDate = formatDate.format(min);
                        String maxDate = formatDate.format(max);
                        */
                    %>
                    <form action="pdfRedirect" method="POST">
                        <input class="dateranges" type="text" name="daterange" value="<%= defaultRange%>"/>
                        <script>
                            $(function () {
                                $('input[name="daterange"]').daterangepicker({
                                    opens: 'left'
                                }, function (start, end, label) {
                                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                                });
                            });             
                        </script>
                        <button class="generatePDF" name="downloadPDF" type ="submit">Generate Summary Report PDF</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="js/adminHistory.js"></script>
</html>
