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
                    <% 
                        String imageString = "https://drive.google.com/uc?export=view&id=";
                        String url[] = "drive.google.com/file/d/1GYvV2aIoSe0LqEA90P9Dvthw8lNhKiq7/view?usp=sharing".split("/");
                        imageString = imageString + url[3];
                    %>
                    <div class = "pizzaOrToppingContent">
                        <form class = "pizzaOrToppingForm">
                            <img class = "pizzaOrToppingImage" src = <%= imageString %> alt="No Image Found">
                            <input type = "text" placeholder = "Product Image Url" name = "productImageUrl">
                            <input type = "text" placeholder = "Product Name" name = "productName">
                            <input type = "text" placeholder = "Product Desc" name = "productDesc">
                            <input type = "text" placeholder = "Product Price" name = "productName">
                            <input type = "text" placeholder = "Product Stock" name = "productName">
                            <input type = "text" placeholder = "Product Availability" name = "productName">
                            <input type = "submit" value = "Edit Product" name = "productName">
                        </form>
                                          
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
