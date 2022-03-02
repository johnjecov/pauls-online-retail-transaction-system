<%-- 
 scroll="no" style="overflow: hidden"
^sa <body> for no scroll
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <li class="options"><a href="#home">Sales</a></li>
                    <li class="options"><a href="#home">Order List</a></li>
                    <li class="options"><a href="#home">Menu</a></li>
                    <li class="options"><a href="#home">Analytics</a></li>
                </ul>
                <p class='logout'>Logout</p>
            </div>
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
                <div class="orderList">
                    <ul class='orderAttributes'>
                        <li class="property">Order ID</li>
                        <li class="property">Date</li>
                        <li class="property">Name</li>
                        <li class="property">Payment</li>
                        <li class="property">Address</li>
                        <li class="property">Order</li>
                        <li class="property">Contact</li>
                        <li class="property">Paid</li>
                        <li class="property">Status</li>
                    </ul>
                </div>
                <div class="orderBody">
                    <ul class="listOfOrders">
                        <ul class="orders" id="order0">
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <li class="orderProperty">Sample</li>
                            <img class="orderRemove" src="image/close-button-orders.png" alt="remove order?">
                        </ul>
                    </ul>
                </div>
                <div class="pageSelector">
                    <ul class="pageList">
                        <li class="pageNumber"><a>1</a></li>
                        <li class="pageNumber2"><a>2</a></li>
                        <li class="pageNumber"><a>3</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
