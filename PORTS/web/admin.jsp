<%-- 
    Document   : admin
    Created on : 02 15, 22, 5:20:11 PM
    Author     : chuah_000

change li class pageNumber2 because it is a placeholder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/admin.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
            <div class="adminContent">
                <div class="adminGreetings">
                    <p class='helloAdmin'>Hello, admin</p>
                </div>
                    <div class="menuCategory">
                        <ul class="pizzaOrToppings">
                            <li class="pizzaOrToppingsCategory"><a>Pizza<a/></li>
                            <li class="pizzaOrToppingsCategory"><a>Toppings<a/></li>
                            </ul>
                    </div>
                    <div class="pageSelector">
                        <ul class="pageList">
                            <li class="pageNumber">1</li>
                            <li class="pageNumber2">2</li>
                            <li class="pageNumber">3</li>
                        </ul>
                    </div>
                    <div class="editProducts">
                        <button class="editProductsButton" type="button">
                            Edit Products
                        </button>
                    </div>
            </div>
        </div>
    </body>
</html>
