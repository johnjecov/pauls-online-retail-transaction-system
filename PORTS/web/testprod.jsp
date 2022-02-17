<%-- 
    Document   : testprod
    Created on : 02 17, 22, 4:30:12 PM
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
    
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
    <!-- header section ends -->
    
    <main class="container">
 
    <!-- Left Column / Headphones Image -->
    <div class="left-column">
        <img data-image="red" class="active" src="image/prod-sample.jpeg" alt="">
    </div>
    
    <!-- Right Column -->
    <div class="right-column">
        <!-- Product Description -->
        <div class="product-description">
            <h1>Pepperoni Pizza</h1>
            <h3>₱208.00</h3>
            <p>Extra-virgin oil, garlic, mozzarella, mushrooms and olives</p>
        </div>
        
        <!-- Product Configuration -->
        <div class="product-configuration">

            <!-- Cable Configuration -->
            <div class="cable-config">
                <span>Add-Ons</span>
                <h4>Mozzarella ₱50.00/50 g.</h4>
                <select class= "Moz">
                    <option disabled selected>Quantity</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
                
                <h4>Parmesan ₱50.00/50 g.</h4>
                <select class= "Par">
                    <option disabled selected>Quantity</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
                
                <h4>Ham ₱80.00/50 g.</h4>
                <select class= "Ham">
                    <option disabled selected>Quantity</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
                
                <h4>Pepperoni ₱100.00/50 g.</h4>
                <select class= "Pep">
                    <option disabled selected>Quantity</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
                
                <h4>Cream Cheese ₱100.00/75 g.</h4>
                <select class= "Cre">
                    <option disabled selected>Quantity</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
                
                <h4>Spinach ₱30.00/10 pcs.</h4>
                <select class= "Spi">
                    <option disabled selected>Quantity</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
            </div>
        </div>
        
        <!-- Product Pricing -->
        <div class="product-price">
            <h2>Total: ₱290.00</h2>
            <a href="#" class="cart-btn">Add to cart</a>
        </div>
    </div>
    </main>
    
    <style>
        
        h4
        {
            font-size: 15px;
            text-transform: none;
        }
        
        .Moz
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .Par
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .Ham
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .Pep
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .Cre
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .Spi
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        html, body
        {
            height: 100%;
            width: 100%;
            margin: 0;
        }
        
        .container
        {
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px;
            display: flex;
        }

        /* Columns */
        .left-column 
        {
            width: 65%;
            position: relative;
        }

        .right-column 
        {
            width: 35%;
            margin-top: 60px;
        }

        /* Left Column */
        .left-column img
        {
            width: 100%;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .left-column img.active 
        {
            opacity: 1;
        }

        /* Product Description */
        .product-description 
        {
            border-bottom: 1px solid black;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        
        .product-description h1 
        {
            font-weight: 300;
            font-size: 45px;
            color: black;
        }
        
        .product-description h3
        {
            font-weight: 700;
            font-size: 25px;
            color: black;
            margin-bottom: 5px;
        }
        .product-description p 
        {
            font-size: 16px;
            font-weight: 300;
            color: black;
            font-style: italic;
            line-height: 24px;
            margin-bottom: 10px;
        }

        /* Cable Configuration */
        .cable-choose
        {
            margin-bottom: 20px;
        }
        
        .cable-config span
        {
            font-size: 30px;
            font-weight: 500;
        }

        .cable-config 
        {
            border-bottom: 1px solid #E1E8EE;
            margin-bottom: 10px;
        }
        
        /* Product Price */
        .product-price h2
        {
            font-size: 30px;
            font-weight: 600;
        }
        .cart-btn
        {
            display: inline-block;
            background-color: #7DC855;
            border-radius: 6px;
            font-size: 16px;
            color: #FFFFFF;
            text-decoration: none;
            padding: 12px 30px;
            transition: all .5s;
        }
        
        .cart-btn:hover
        {
            background-color: #64af3d;
        }
        
    </style>
</html>
