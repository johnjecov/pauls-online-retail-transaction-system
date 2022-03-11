<%-- 
    GAWAN NG MAX WIDTH MGA PICTURES
--%>
<%@page import="java.util.*, ports.models.*"%>
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
                    <% 
                        /*
                        String imageString = "https://drive.google.com/uc?export=view&id=";
                        String url[] = "drive.google.com/file/d/1GYvV2aIoSe0LqEA90P9Dvthw8lNhKiq7/view?usp=sharing".split("/");
                        imageString = imageString + url[3];
                        */
                        ServletContext sc = getServletContext();
                        PortsDatabase ports = (PortsDatabase) getServletContext().getAttribute("dbConnection");
                        ArrayList<Product> menu = ports.getProducts();

                        for (Product x : menu) 
                        {
                            String box = String.format(
                                    "<form class = 'pizzaOrToppingForm'>"
                                        + "<img class = 'pizzaOrToppingImage' src = %s alt = 'No Image Found'>"
                                        + "<input type = 'text' placeholder = 'Product Image Url' value = '%s' name = 'productImageUrl' required>"
                                        + "<input type = 'text' placeholder = 'Product Name' value = '%s' name = 'productName' required>"
                                        + "<input type = 'text' placeholder = 'Product Desc' value = '%s' name = 'productDesc'>"
                                        + "<input type = 'number' min = '0' placeholder = 'Product Price' value = '%s' name = 'productPrice' required>"
                                        + "<input type = 'number' min = '0' placeholder = 'Product Stock' value = '%s' name = 'productStock' required>"
                                        + "<input type = 'text' placeholder = 'Product Availability' value = '%s' name = 'productAvailability' required>"
                                            + "<button onclick = test() type = 'button'>Edit Product</button>"
                                        + "</form>",x.getImage(),x.getImage(),x.getName(), x.getDesc(), x.getPrice(), x.getStock(), x.getAvailability()
                                 );           
                            
                              System.out.println(x.getName());
                              out.println(box);
                        }
        
                    %>
                    
                        <form class = "pizzaOrToppingForm">
                            <img class = "pizzaOrToppingImage" src = <%= "image/pepperoni.jpg" %> alt="No Image Found">
                            <input type = "text" placeholder = "Product Image Url" name = "productImageUrl" required>
                            <input type = "text" placeholder = "Product Name" name = "productName" required>
                            <input type = "text" placeholder = "Product Desc" name = "productDesc">
                            <input type = "number" min = "0" placeholder = "Product Price" name = "productPrice" required>
                            <input type = "number" min = "0" placeholder = "Product Stock" name = "productStock" required>
                            <input type = "text" placeholder = "Product Availability" name = "productAvailability" required>
                            <button onclick = test() type = "button">Edit Product</button>
                        </form>                 
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        
        function test()
        {
            alert("pinindot");
        }
        
    </script>
</html>
