<%-- 
    GAWAN NG MAX WIDTH MGA PICTURES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/editMenu_1.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Menu</title>
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
            <div class = "pageContent">
                 <div class="adminGreetings">
                    <p class='helloAdmin'>Hello, admin</p>
                </div>          
                <div class="adminContent">
                    <ul class = "pizzaOrTopping">
                        <li>
                            Pizzas
                        </li>
                        <li>
                            Toppings
                        </li>
                    </ul>
                    <div class = "pizzaOrToppingContent">
                        Body for content
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
