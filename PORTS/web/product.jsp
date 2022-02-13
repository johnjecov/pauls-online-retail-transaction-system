<%-- 
    Document   : product
    Created on : 02 13, 22, 9:28:17 PM
    Author     : manuellouisecruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
    </head>
    
    <body>
        <!-- header section starts -->
        <%@include file="header_external.jsp"%>
        <!-- header section ends -->
        
        <section class = "product-details">
            <div class = "image-slider">
            </div>
            <div class = "details">
                <h2 class="product-brand">Pepperoni Pizza</h2>
                <p class="product-price">₱208.00</p >
                <p class="product-short-des">Extra-virgin oil, garlic, mozarella, mushrooms and olives</p>
                <p class="product-sub-heading">Additional Toppings</p>
                
                <div class = "container">
                    <h1>Quantity</h1>
                    <div class = "card">
                       <button onclick = "decrement()">-</button>
                       <h2 id = "root"></h2>
                       <button onclick = "increment()">+</button>
                    </div>
                </div>
                <button class = "btn cart-btn">Add to Cart</button>
            </div>
        </section>
        
        
        <script src="js/script.js">
        </script>
        
        <script>
            var data = 0;
            document.getElementById("root").innerText=data;
            
            function decrement(){
                data = data-1;
                document.getElementById("root").innerText=data;
            }
            
            function increment(){
                data = data+1;
                document.getElementById("root").innerText=data;
            }
        </script>
    </body>
    
    <style>
        .product-details
        {
            width: 100%;
            padding: 60px 10vw;
            display: flex;
            justify-content: space-between;
        }
        
        .image-slider
        {
            width: 800px;
            height: 800px;
            position: relative;
            background-image: url("image/prod-sample.jpeg");
            background-size: cover;
        }
        
        .details
        {
            width: 50%;
        }
        
        .details .product-brand
        {
            text-transform: capitalize;
            font-size: 30px;
        }
        
        .details .product-price
        {
            font-weight: 700;
            font-size: 30px;
        }
        
        .details .product-short-des
        {
            font-size: 25px;
            line-height: 30px;
            height: auto;
            margin: 15px 0 30px;
            font-style: italic;
        }
        
        .product-sub-heading
        {
            font-size: 20px;
            margin: 30px 0 20px;
            font-weight: 300;
        }
        
        .container
        {
            float: left;

        }
        .container h1
        {
            font-size: 20px;
            margin-bottom: 10px; 
        }
        
        .card
        {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;            
        }
        
        .card h2
        {
            margin: 0 50px;
            font-size: 20px;
        }
        
        .card button
        {
            width: 40px;
            height: 40px;
            outline: none;
            border-style: solid;
            font-size: 20px;
            background-color: white;
            border-color: black;
        }
        
        .btn
        {
            width: 48%;
            padding: 20px;
            border-radius: 5px;
            background: none;
            border: 1px solid #383838;
            color: black;
            font-size: 20px;
            cursor: pointer;
            margin: 100px 20px;
            text-transform: capitalize;  
        }
        
        .btn:hover
        {
            background-color: green;
            color: white;
        }
    </style>
</html>
