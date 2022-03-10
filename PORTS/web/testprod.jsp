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
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        <div class = "indiv-toppings">
            <h4>Quantity</h4>
                <select class= "Quan" name="quan"> 
                    <option disabled selected>Quantity</option>
                    <option value = "1" selected="selected">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
        </div>
        <!-- Product Configuration -->
        <form method="POST" action="addToCart">
        <div class="product-configuration">
            <!-- Cable Configuration -->
            <div class="cable-config">
                <span>Add-Ons</span>
                <br>
                <div class = "separation">
                    <div class = "indiv-toppings">
                        <h4>Mozzarella ₱50.00/50 g.</h4>
                        <select class= "Moz" name="moz"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                                        
                    <div class = "indiv-toppings">
                    <h4>Ham ₱80.00/50 g.</h4>
                        <select class= "Ham" name="ham"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                    
                    <div class = "indiv-toppings">
                        <h4>Parmesan ₱50.00/50 g.</h4>
                        <select class= "Par" name="par"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                                     
                    <div class = "indiv-toppings">
                    <h4>Pepperoni ₱100.00/50 g.</h4>
                        <select class= "Pep" name="pep"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                    
                    <div class = "indiv-toppings">
                        <h4>Spinach ₱30.00/10 pc.</h4>
                        <select class= "Spi" name="spi"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                                                            
                    <div class = "indiv-toppings">
                        <h4>Cream Cheese ₱100.00/75 g.</h4>
                        <select class= "Cre" name="cre"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                </div>                
            </div>
        </div>
           
        <br>
        <!-- Product Pricing -->
        <div class="product-price">
            <h2>Total: ₱290.00</h2>
            <br>  
            
            <button name ="pizza" value="Pepperoni" class="cart-btn" style="cursor: pointer;">ADD TO CART</button>
           <!-- <a href="#" class="cart-btn">Add to cart</a> -->
        </div>
        
         </form>
    </div>
    </main>
    
     <style>
        
        h4
        {
            font-size: 15px;
            text-transform: none;
            color: white;
        }
        
        .Quan
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
            margin-bottom: 20px;
        }
        
        html, body
        {
            height: 100%;
            width: 100%;
            margin: 0;
            background-color: #1e1f20;
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
            width: 85%;
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
            border-bottom: 1px solid white;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        
        .product-description h1 
        {
            font-weight: 300;
            font-size: 45px;
            color: white;
        }
        
        .product-description h3
        {
            font-weight: 700;
            font-size: 25px;
            color: white;
            margin-bottom: 5px;
        }
        .product-description p 
        {
            font-size: 16px;
            font-weight: 300;
            color: white;
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
            color: white;
        }

        .cable-config 
        {
            border-bottom: 1px solid #E1E8EE;
            margin-bottom: 10px;
            color: white;
            
        }
        
        /* Product Price */
        .product-price h2
        {
            font-size: 30px;
            font-weight: 600;
            color: white;
        }
        .cart-btn
        {
            display: inline-block;
            background-color: #CD212A;
            border-radius: 6px;
            font-size: 16px;
            color: #FFFFFF;
            text-decoration: none;
            padding: 12px 30px;
            transition: all .5s;
        }
        
        .cart-btn:hover
        {
            background-color: white;
            color: black;
        }
        
        .separation
        {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 2fr));
        }
        
        .indiv-toppings
        {
            width: auto;
        }
        
    </style>
</html>
