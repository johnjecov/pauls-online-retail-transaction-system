<%-- 
    GAWAN NG MAX WIDTH MGA PICTURES
--%>
<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/admin.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Page</title>
    </head>
    <body scroll="no" style="overflow: hidden">
        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo_1.jpg" alt="Paul's Pizzeria Logo">
                <ul class='adminOptions'>
                    <li class="options"><a href="adminHistoryPage.jsp">Sales</a></li>
                    <li class="options"><a href="adminOrderList.jsp">Order List</a></li>
                    <li class="options"><a href="admin.jsp">Menu</a></li>
                    <li class="options"><a href="admin.jsp">Analytics</a></li>
                </ul>
                <p class='logout'>Logout</p>
            </div>
            <div class = "pageContent">
                 <div class="adminGreetings">
                    <p class='helloAdmin'>Hello, admin</p>
                </div>          
                <div class="adminContent">
                    <ul class = "pizzaOrTopping">
                        <li style = "background: black;" id = 'togglePizza' onclick= togglePizzaOrTopping("formPizza")>
                            Pizzas
                        </li>
                        <li style = "background: #2e2e2e;"id = 'toggleTopping' onclick= togglePizzaOrTopping("formTopping")>
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
                            ArrayList<Product> menuPizza = ports.getProducts();
                            ArrayList<Topping> menuToppings = ports.getToppings();
                            for (Product x : menuPizza) 
                            {
                                String box = String.format(
                                        "<form class = 'pizzaOrToppingForm formPizza'>"
                                            + "<img class = 'pizzaOrToppingImage' src = %s alt = 'No Image Found'>"
                                            + "<input type = 'text' value = 'pizza' style = 'display: none;' name = 'productType'>"
                                            + "<input type = 'text' placeholder = 'Product Image Url' value = '%s' name = 'productImageUrl' readonly>"
                                            + "<input type = 'text' placeholder = 'Product Name' value = '%s' name = 'productName' readonly>"
                                            + "<input type = 'text' placeholder = 'Product Desc' value = '%s' name = 'productDesc' readonly>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Price' value = '%s' name = 'productPrice' readonly>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Stock' value = '%s' name = 'productStock' readonly>"
                                            + "<input type = 'text' placeholder = 'Product Availability' value = '%s' name = 'productAvailability' readonly>"
                                       + "</form>",x.getImage(),x.getImage(),x.getName(), x.getDesc(), x.getPrice(), x.getStock(), x.getAvailability()
                                     );           
                                  out.println(box);
                            }
                            
                            
                            for (Topping x : menuToppings) 
                            {
                                String box = String.format(
                                        "<form style = 'display: none' class = 'pizzaOrToppingForm formTopping'>"
                                            + "<img class = 'pizzaOrToppingImage' src = %s alt = 'No Image Found'>"
                                            + "<input type = 'text' value = 'topping' style = 'display: none;' name = 'productType'>"
                                            + "<input type = 'text' placeholder = 'Product Image Url' value = '%s' name = 'productImageUrl' readonly>"
                                            + "<input type = 'text' placeholder = 'Product Name' value = '%s' name = 'productName' readonly>"
                                            + "<input type = 'text' placeholder = 'Product Desc' value = '%s' name = 'productDesc' readonly>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Price' value = '%s' name = 'productPrice' readonly>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Stock' value = '%s' name = 'productStock' readonly>"
                                            + "<input type = 'text' placeholder = 'Product Availability' value = '%s' name = 'productAvailability' readonly>"
                                       + "</form>",x.getImage(),x.getImage(),x.getName(), x.getDesc(), x.getPrice(), x.getStock(), x.getAvailability()
                                     );           
                                  out.println(box);
                            }
                        %>         
                    </div>
                    <button onclick= "window.location.href='editMenu.jsp'" class="editProductsButton" type="button">
                        Edit Menu
                    </button>
                </div>
            </div>
        </div>
    </body>
    <script>
        
        function togglePizzaOrTopping(pizzaOrTopping)
        {      

            if(pizzaOrTopping === 'formPizza')
            {
                var productClass = document.getElementsByClassName('formPizza');
                var hideClass = document.getElementsByClassName('formTopping');
                var productColor = document.getElementById('togglePizza');
                var hideColor = document.getElementById('toggleTopping');
                
                productColor.style.background = 'black';
                hideColor.style.background = '#2e2e2e';
                for (var i=0;i<productClass.length;i++){
                  productClass[i].style.display = 'flex';
                }
                for (var i=0;i<hideClass.length;i++){
                  hideClass[i].style.display = 'none';
                }
            }
            else 
            {
                var hideClass = document.getElementsByClassName('formPizza');
                var productClass = document.getElementsByClassName('formTopping');
                var hideColor = document.getElementById('togglePizza');
                var productColor = document.getElementById('toggleTopping');
                
                productColor.style.background = 'black';
                hideColor.style.background = '#2e2e2e';              
            
            
                for (var i=0;i<productClass.length;i++){
                  productClass[i].style.display = 'flex';
                }
                for (var i=0;i<hideClass.length;i++){
                  hideClass[i].style.display = 'none';
                }
            }
        }
      
    </script>
</html>
