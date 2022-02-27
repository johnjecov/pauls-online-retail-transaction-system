<%-- 
    Document   : adminHistoryPage
    Created on : 02 14, 22, 1:01:41 AM
    Author     : chuah_000

change li class pageNumber2 because it is a placeholder
change orders from "----------" to backend
--%>

<%-- scroll="no" style="overflow: hidden" --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <option value="aOrderID">Order ID</option>
                        <option value="aDate">Date</option>
                        <option value="aProductID">Product ID</option>
                        <option value="aProductName">Product Name</option>
                        <option value="aQuantity">Quantity</option>
                        <option value="aToppings">Toppings Name</option>
                        <option value="aToppingsQuantity">Toppings Quantity</option>
                        <option value="aPrice">Price</option>
                    </select>

                </div>
                <div class="orderList">
                    <ul class='orderProperties'>
                        <li class="property">Order ID</li>
                        <li class="property">Date</li>
                        <li class="property">Product ID</li>
                        <li class="property">Product Name</li>
                        <li class="property">Quantity</li>
                        <li class="property">Toppings</li>
                        <li class="property">Toppings Quantity</li>
                        <li class="property">Total Price</li>
                    </ul>
                </div>
                <div class="orders">
                    --------------------------------------------
                </div>
                <div class="pageSelector">
                    <ul class="pageList">
                        <li class="pageNumber">1</li>
                        <li class="pageNumber2">2</li>
                        <li class="pageNumber">3</li>
                    </ul>
                </div>
                <div class="PDFGenerator">
                    <button class="generatePDF" type="button">
                        Generate Summary Report PDF
                    </button>
                </div>
            </div>
        </div>
    </body>
</html>
