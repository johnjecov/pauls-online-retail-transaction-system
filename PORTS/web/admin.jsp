<%-- 
    Document   : admin
    Created on : 02 15, 22, 5:20:11 PM
    Author     : chuah_000

change li class pageNumber2 because it is a placeholder
 scroll="no" style="overflow: hidden"
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
            <div class="adminGreetings">
                <p class='helloAdmin'>Hello, admin</p>
            </div>
            <div class="adminContent">
                <div class="menuCategory">
                    <ul class="pizzaOrToppings">
                        <li class="pizzaOrToppingsCategory">Pizza</li>
                        <li class="pizzaOrToppingsCategory">Toppings</li>
                    </ul>
                </div>
                <div class="pizzaChoices">
                    <div class="pizzaDisplay1">
                        <img class="pizzaImg" src="image/pizza-sample.png" alt="mama mia">
                        <p class="pizzaName1">PEPPERONI PIZZA</p>
                        <p class="pizzaDesc1">Mozarella, Pepperoni, and Tomato Sauce</p>
                        <p class="price1">- ₱208.00 -</p>
                    </div>
                    <div class="pizzaDisplay2">
                        <img class="pizzaImg" src="image/pizza-sample.png" alt="mama mia">
                        <p class="pizzaName2">CREAMY SPINACH PIZZA</p>
                        <p class="pizzaDesc2">Cream cheese,  Mozarella, Spinach, and Tomato Sauce</p>
                        <p class="price2">- ₱290.00 -</p>
                    </div>
                    <div class="pizzaDisplay3">
                        <img class="pizzaImg" src="image/pizza-sample.png" alt="mama mia">
                        <p class="pizzaName3">CHEESE WITH BASIL</p>
                        <p class="pizzaDesc3">Mozarella, Parmesan, Basil, and Tomato Sauce</p>
                        <p class="price3">- ₱198.00 -</p>
                    </div>
                </div>
                <div class="bottomButtons">
                    <ul class="pageList">
                        <li class="pageNumber">1</li>
                        <li class="pageNumber">2</li>
                        <li class="pageNumber">3</li>
                    </ul>
                    <div class="editProducts">
                        <button class="editProductsButton" type="button">
                            Edit Products
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
