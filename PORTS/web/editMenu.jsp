<%-- 
    GAWAN NG MAX WIDTH MGA PICTURES
--%>
<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/editMenu.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Menu</title>
    </head>
    <body scroll="no" style="overflow: hidden">
        <%
            ServletContext sc = getServletContext();
            String editModalDisplay = "none";
            if(sc.getAttribute("editModalDisplay") != null)
            {
                editModalDisplay = (String) sc.getAttribute("editModalDisplay");
                sc.removeAttribute("editModalDisplay");
            }
            
            String productId = "";
            if(sc.getAttribute("productId") != null)
            {
                productId = (String) sc.getAttribute("productId");
            }
            String productType = "";
            if(sc.getAttribute("productType") != null)
            {
                productType = (String) sc.getAttribute("productType");
            }
            String productUrl = "";
            if(sc.getAttribute("productUrl") != null)
            {
                productUrl = (String) sc.getAttribute("productUrl");
            }
            String productName = "";
            if(sc.getAttribute("productName") != null)
            {
                productName = (String) sc.getAttribute("productName");
            }           
            String productDesc = "";
            if(sc.getAttribute("productDesc") != null)
            {
                productDesc = (String) sc.getAttribute("productDesc");
            }              
            String productPrice = "";
            if(sc.getAttribute("productPrice") != null)
            {
                productPrice = (String) sc.getAttribute("productPrice");
            }                  
            String productStock = "";
            if(sc.getAttribute("productStock") != null)
            {
                productStock = (String) sc.getAttribute("productStock");
            }                
            String productAvailability = "";
            if(sc.getAttribute("productAvailability") != null)
            {
                productAvailability = (String) sc.getAttribute("productAvailability");
            }   
        %>
        <div id = "transactionModal" class = "modal"  style = <% out.println(String.format("\"display: %s;\"",editModalDisplay)); %> >
            <form id = 'finalConfirmation' class ='mContent' action ='editProduct' method = 'POST'>
                <h3>Edit Summary</h3>
                <hr>
                <p class = 'text'>Product Id:  <%= productId%> </p>
                <p class = 'text'>Product Type: <%= productType%></p>
                <p class = 'text'>Product Url: <%= productUrl%></p>
                <p class = 'text'>Product Name: <%= productName%></p>
                <p class = 'text'>Product Desc: <%= productDesc%></p>
                <p class = 'text'>Product Price: <%= productPrice%></p>
                <p class = 'text'>Product Stock: <%= productStock%></p>
                <p class = 'text'>Product Availability: <%= productAvailability%></p>
                <input type ="text" value = "confirm" style ="display: none;">
                <input type ="submit" value ="Confirm Edit" class = "summaryButtons">
                <button class = "summaryButtons" value = "Cancel Edit" type = "button" onclick = "closeModal()">Cancel Edit</button>
            </form>
        </div>  
                
        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo.jpg" alt="Paul's Pizzeria Logo">
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
                        <form class = "pizzaOrToppingForm" action ='confirmEdit' method = 'POST'>
                                <img class = "pizzaOrToppingImage addImage" src = <%= "image/plus.png" %> alt="No Image Found">
                                <input type = 'text' value = 'add' style = 'display: none;' name = 'productId'>
                                <input type = 'text' value = 'pizza' style = 'display: none;' name = 'productType' id = 'editProductId'>
                                <input type = "text" placeholder = "Product Image Url" name = "productImageUrl" required>
                                <input type = "text" placeholder = "Product Name" name = "productName" required>
                                <input type = "text" placeholder = "Product Desc" name = "productDesc" required>
                                <input type = "number" min = "0" placeholder = "Product Price" name = "productPrice" required>
                                <input type = "number" min = "0" placeholder = "Product Stock" name = "productStock" required>
                                <input type = "text" placeholder = "Product Availability" name = "productAvailability" required readonly>
                                <input style = 'cursor: pointer;' value = 'Save Changes' type = 'submit'>
                        </form>    

                        <% 
                            /*
                            String imageString = "https://drive.google.com/uc?export=view&id=";
                            String url[] = "drive.google.com/file/d/1GYvV2aIoSe0LqEA90P9Dvthw8lNhKiq7/view?usp=sharing".split("/");
                            imageString = imageString + url[3];
                            */
                            PortsDatabase ports = (PortsDatabase) getServletContext().getAttribute("dbConnection");
                            ArrayList<Product> menuPizza = ports.getProducts();
                            ArrayList<Topping> menuToppings = ports.getToppings();
                            for (Product x : menuPizza) 
                            {
                                String box = String.format(
                                        "<form class = 'pizzaOrToppingForm formPizza' action ='confirmEdit' method = 'POST'>"
                                            + "<img class = 'pizzaOrToppingImage' src = %s alt = 'No Image Found'>"
                                            + "<input type = 'text' value = '%s' style = 'display: none;' name = 'productId'>"
                                            + "<input type = 'text' value = 'pizza' style = 'display: none;' name = 'productType'>"
                                            + "<input type = 'text' placeholder = 'Product Image Url' value = '%s' name = 'productImageUrl' required>"
                                            + "<input type = 'text' placeholder = 'Product Name' value = '%s' name = 'productName' required>"
                                            + "<input type = 'text' placeholder = 'Product Desc' value = '%s' name = 'productDesc' required>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Price' value = '%s' name = 'productPrice' required>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Stock' value = '%s' name = 'productStock' required>"
                                            + "<input type = 'text' placeholder = 'Product Availability' value = '%s' name = 'productAvailability' required readonly>"
                                            + "<input style = 'cursor: pointer;' value = 'Save Changes' type = 'submit'>"
                                       + "</form>", x.getImage(),x.getId(),x.getImage(),x.getName(), x.getDesc(), x.getPrice(), x.getStock(), x.getAvailability()
                                     );           
                                  out.println(box);
                            }
                            
                            
                            for (Topping x : menuToppings) 
                            {
                                String box = String.format(
                                        "<form style = 'display: none' class = 'pizzaOrToppingForm formTopping' action ='confirmEdit' method = 'POST'>"
                                            + "<img class = 'pizzaOrToppingImage' src = %s alt = 'No Image Found'>"
                                            + "<input type = 'text' value = '%s' style = 'display: none;' name = 'productId'>"
                                            + "<input type = 'text' value = 'topping' style = 'display: none;' name = 'productType'>"
                                            + "<input type = 'text' placeholder = 'Product Image Url' value = '%s' name = 'productImageUrl' required>"
                                            + "<input type = 'text' placeholder = 'Product Name' value = '%s' name = 'productName' required>"
                                            + "<input type = 'text' placeholder = 'Product Desc' value = '%s' name = 'productDesc' required>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Price' value = '%s' name = 'productPrice' required>"
                                            + "<input type = 'number' min = '0' placeholder = 'Product Stock' value = '%s' name = 'productStock' required>"
                                            + "<input type = 'text' placeholder = 'Product Availability' value = '%s' name = 'productAvailability' required readonly>"
                                            + "<input style = 'cursor: pointer;' value = 'Save Changes' type = 'submit'>"
                                       + "</form>",x.getImage(),x.getId(),x.getImage(),x.getName(), x.getDesc(), x.getPrice(), x.getStock(), x.getAvailability()
                                     );           
                                  out.println(box);
                            }
                        %>         
                    </div>
                    <button onclick= "window.location.href='admin.jsp'" class="editProductsButton" type="button">
                        Back to Menu
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
                var editProductId = document.getElementById('editProductId');
                editProductId.value = 'pizza';
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
                var editProductId = document.getElementById('editProductId');
                editProductId.value = 'topping';
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

        function closeModal()
        {

            var modal = document.getElementById("transactionModal");
            modal.style.display = "none";
        }
            
    </script>
</html>
