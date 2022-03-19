<%-- 
    GAWAN NG MAX WIDTH MGA PICTURES
--%>
<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/adminAnalytics.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Analytics Page</title>
    </head>
    <body scroll="no" style="overflow: hidden">
        <%//@include file="adminLogout.jsp"%>
 
        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo_1.jpg" alt="Paul's Pizzeria Logo">
                <ul class='adminOptions'>
                    <li class="options"><a href="adminHistoryPage.jsp">Sales</a></li>
                    <li class="options"><a href="adminOrderList.jsp">Order List</a></li>
                    <li class="options"><a href="admin.jsp">Menu</a></li>
                    <li class="options"><a href="admin.jsp">Analytics</a></li>
                </ul>
                <a style="text-decoration:none;" class = "logout" href="./logout">Logout</a>
            </div>
            <div class = "pageContent">
                 <div class="adminGreetings">
                    <p style="font-family: 'Satisfy', cursive;" class='helloAdmin'>Hello, Admin!</p>
                </div>  
                
                <%
                    ServletContext sc = getServletContext();
                    PortsDatabase ports = (PortsDatabase) sc.getAttribute("dbConnection");
                    Analytics analytics = (Analytics) sc.getAttribute("analytics");
                    ArrayList<Order> completedOrders = ports.retrieveOrderSales("order_id");
                    ArrayList<OrderFeedback> orderFeedbacks = analytics.getOrderFeedbacks();
                    ArrayList<Order> activeOrders = ports.retrieveOrderHistory("order_id");
                    ArrayList<ProductSales> productSales = analytics.getProductSales();
                    ArrayList<ToppingSales> toppingSales = analytics.getToppingSales();    
                    ProductSales topP = productSales.get(0);
                    String topPizza = "No data yet";
                    if(topP.getQuantity() != 0)
                        topPizza = topP.getProduct().getName();
                    
                    ToppingSales topT = toppingSales.get(0);
                    String topTopping = "No Data yet";
                    
                    if(topT.getQuantity() != 0)
                        topTopping = topT.getTopping().getName();
                %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>     
                
        <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Total Sales ", { role: "style" } ],
        ["Peperroni", 100, "#b87333"],
        ["Chicken BBQ", 200, "silver"],
        ["Cheese with Basil", 300, "gold"],
        ["Hawaiian", 350, "color: #e5e4e2"],
        ["Creamy Spinach", 400, "pink"],
        ["Garlic Shrimp \n with Parsley", 500, "orange"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Number of Sales Per Pizza" ,
        width: 1000,
        height: 600,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
  </script>
                
                
                <div class="adminContent">
                    
                    <div class = "chartContainer">
                        <div id="barchart_values" class="chart-chart" style="width: 980px; height: 600px; text-align: center;"></div>
                    </div>
                    
                    <div class = "analyticsContainer">
                        <div class = "overviewContainer">
                            <h3>Overview</h3>
                            <div class = "overviewRow">
                                <div class = "text"><p>Most Popular Pizza:</p></div>
                                <div class = "value"><p><%=topPizza%></p></div>
                            </div>
                            <div class = "overviewRow">
                                <div class = "text"><p>Most Popular Topping:</p></div>
                                <div class = "value"><p><%=topTopping%></p></div>
                            </div>
                            <div class = "overviewRow">
                                <div class = "text"><p>Number of Orders Completed:</p></div>
                                <div class = "value"><p><%=completedOrders.size()%></p></div>
                            </div>
                            <div class = "overviewRow">
                                <div class = "text"><p>Total Sales:</p></div>
                                <div class = "value"><p><%= analytics.getOrderTotal()%> PHP</p></div>
                            </div>
                            <div class = "overviewRow">
                                <div class = "text"><p>Number of Active Orders:</p></div>
                                <div class = "value"><p><%=activeOrders.size()%></p></div>
                            </div>
                        </div>
                        <div class = "feedbacksContainer">
                            <h3>Customer Feedback</h3>
                            
                            <div class = "feedbackRowH">
                                <div class = "col1">
                                    <p>
                                       Order ID 
                                    </p>
                                </div>
                                <div class = "col2">
                                    <p>
                                       Customer Name
                                    </p>
                                </div>
                                <div class = "col1">
                                    <p>
                                        Rating<br>(5/5)
                                    </p>
                                </div>
                                <div class = "col3">
                                    <p>
                                       Comment
                                    </p>
                                </div>
                            </div>
                            
                            <%
                                String box = "";
                                if(analytics.noFeedback())
                                {
                                    box = String.format(
                                            "<div class = 'feedbackRow'>"
                                                + "<div>"
                                                    + "<p>"
                                                        + "No feedbacks yet"
                                                    + "</p>"
                                                + "</div>"
                                          + "</div>");
                                    
                                    out.println(box);  
                                }
                                else
                                {
                                    
                                    for(OrderFeedback o: orderFeedbacks)
                                    {
                                        if(o.hasFeedBack())
                                        {
                                            Order x = o.getOrder();
                                            box = String.format(
                                            "<div class = 'feedbackRow'>"
                                            + "<div class = 'col1'>"
                                                + "<p>"
                                                    + "%s"
                                                + "</p>"
                                            + "</div>"
                                            + "<div class = 'col2'>"
                                                + "<p>"
                                                    + "%s"
                                                + "</p>"
                                            + "</div>"
                                            + "<div class = 'col1'>"
                                                + "<p>"
                                                    + "%s/5"
                                                + "</p>"
                                            + "</div>"
                                            + "<div class = 'col3'>"
                                                + "<p>"
                                                    + "%s"
                                                + "</p>"
                                            + "</div>"
                                          + "</div>"
                                            , x.getOrder_Id(), x.getCustomerName(), o.getRating(), o.getComment());
                                            out.println(box);
                                        }
                                        
                                        
                                    }
                                      
                                                
                                }
                                
                                 
                            %>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
