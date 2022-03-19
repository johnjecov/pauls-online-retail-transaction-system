<%@page import="java.util.*, ports.models.*"%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
    <!-- header section ends -->
    
    <main class="container">
    <% 
       ServletContext sc = getServletContext();
       int product_id = 0; //default

       if(sc.getAttribute("specificProductId")!= null)
               product_id = Integer.parseInt((String) sc.getAttribute("specificProductId")) - 1;

       PortsDatabase ports = (PortsDatabase) getServletContext().getAttribute("dbConnection");
       ArrayList<Product> menu = ports.getProducts();
       Product pizza = menu.get(product_id);
       

       //for toppings, pwede gamitin para dun sa quantity sa ilalim
       ArrayList<Topping> toppings = ports.getToppings();
       
   %>
    <!-- Left Column / Headphones Image -->
    <div class="left-column">
        <img data-image="red" class="active" src=<%= pizza.getImage() %> alt="">
    </div>
    
    <!-- Right Column -->
    <div class="right-column">
        <!-- Product Description -->

        <div class="product-description">
            <h1><%= pizza.getName()%></h1>
            <h3 >₱<%= pizza.getPrice()%></h3>
            <p><%= pizza.getDesc()%></p>
        </div>
       
        <!-- Product Configuration -->
        <form method="POST" action="addToCart">
             <div class = "indiv-toppings">
            <h4>Quantity</h4>
                <select class= "toppings" id="quantity" name="quan"> 
                    <option disabled selected>Quantity</option>
                    <option value = "1" selected="selected">1</option>
                    <option value = "2">2</option>
                    <option value = "3">3</option>
                    <option value = "4">4</option>
                    <option value = "5">5</option>
                </select>
        </div>
        <div class="product-configuration">
            <!-- Cable Configuration -->
            <div class="cable-config">
                <span>Add-Ons</span>
                <br>
                <div class = "separation">
                    <% for(int z=0; z < toppings.size(); z++)
                    {%>
                    <input class="hiddenValues" name="<%=((Topping)(toppings.get(z))).getName() %>" value ="<%= ((Topping)(toppings.get(z))).getPrice() %>" style="display: none;">
                    <div class = "indiv-toppings">
                        <h4><%= ((Topping)(toppings.get(z))).getName()%><br><%= ((Topping)(toppings.get(z))).getPrice() %></h4>
                        
                        <select class= "toppings" id ="toppings<%=z+1%>" name="toppings"> 
                            <option disabled selected>Quantity</option>
                            <option value = "0" selected="selected">0</option>
                            <option value = "1">1</option>
                            <option value = "2">2</option>
                            <option value = "3">3</option>
                            <option value = "4">4</option>
                            <option value = "5">5</option>
                        </select>
                    </div>
                        
                    <% }%>
                </div>
            </div>
        </div>
           
        <br>
        <!-- Product Pricing -->
        <div class="product-price">
            <h2 id="result"></h2>
            
            <br>  
            
            <button name ="pizza" value="<%= pizza.getId()%>" class="cart-btn" style="cursor: pointer;">ADD TO CART</button>
           <!-- <a href="#" class="cart-btn">Add to cart</a> -->
        </div>
        
         </form>
           <script>
                     $(document).ready(function(){
                         $("#quantity, #toppings1, #toppings2, #toppings3, #toppings4, #toppings5, #toppings6").change(function(event){
                             var total=0;
                             <%double priceDouble = pizza.getPrice();%>
                             var price = <%=priceDouble%>;

                             $("#quantity").each(function(){
                                 total += parseInt($(this).val())*price;
                              
                             });
                             $("#toppings1").each(function(){
                                 total += parseInt($(this).val())*50;
                                  
                             });
                             $("#toppings2").each(function(){
                                 total += parseInt($(this).val())*80;
                             });
                             $("#toppings3").each(function(){
                                 total += parseInt($(this).val())*50;
                             });
                             $("#toppings4").each(function(){
                                 total += parseInt($(this).val())*100;
                             });
                             $("#toppings5").each(function(){
                                 total += parseInt($(this).val())*30;
                             });
                             $("#toppings6").each(function(){
                                 total += parseInt($(this).val())*100;
                             });
                             if(total===0){
                                 $('#result').text('');
                             }
                             else
                             {
                                 $('#result').text("Total: ₱"+total);
                             }
                             
                             
                         });
                     });
               
           </script>
    </div>
    </main>
    
     <style>
        
        h4
        {
            font-size: 15px;
            text-transform: none;
            color: white;
        }
        
        .toppings
        {
            flex-direction: column;
            padding: 8px 12px;
            color: #333333;
            font-size: 15px;
            background-color: #eeeeee;
            border: 1px solid #dddddd;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 15px;
            margin-top: 5px;
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
            flex-wrap: wrap;
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
            color: #008C45;
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
        
        @media(max-width: 768px)
        {
            .container
            {
                flex-direction: column;
            }
            
            .left-column 
            {
                width: 100%;
                position: relative;
            }

            .right-column 
            {
                width: 100%;
                margin-top: 0px;
            }
            
            .left-column img
            {
                width: 100%;
                position: relative;
            }

            .product-description h1 
            {
                font-size: 30px;
            }

            .product-description h3
            {
                font-size: 20px;
            }
            
            .product-description p 
            {
                font-size: 14px;
            }
            
            .product-price h2
            {
                font-size: 30px;
            }
    
            
        }
        /*
        @media(max-width: 768px)
        {
            .left-column 
            {
                width: 100%;
                position: relative;
                height: 100%;
            }

            .right-column 
            {
                width: 0%;
                height: 100%;
            }
            
            .left-column img
            {
                width: 100%;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
                transition: all 0.3s ease;
                align-items: center;
            }

            .left-column img.active 
            {
                opacity: 1;
            }    
            
            .product-description 
            {
                margin-top: 250px;
                margin-left: -380px;
                align-items: center;
            }

            .product-description h1 
            {
                font-size: 30px;
            }

            .product-description h3
            {
                font-size: 20px;
            }
            .product-description p 
            {
                font-size: 14px;
            }
            
            .cable-config span
            {
                margin-left: -380px;
                font-size: 20px;
                font-weight: 500;
            }
            
            h4
            {
                margin-left: -380px;
            }
            
            .Quan
            {
                margin-left: -380px;
            }
            
            .Moz
            {
                margin-left: -380px;
            }
            
            .Ham
            {
                margin-left: -380px;
            }
            
            .Par
            {
                margin-left: -380px;
            }
            
            .Pep
            {
                margin-left: -380px;
            }
            
            .Spi
            {
                margin-left: -380px;
            }
            
            .Cre
            {
                margin-left: -380px;
            }
            
            .product-price h2
            {
                margin-top: -20px;
                margin-left: -380px;
                font-size: 30px;
            }
            .cart-btn
            {
                margin-left: -380px;
            }
            
            .separation
            {
                grid-template-columns: repeat(auto-fit, minmax(0px, 2fr));
            }
        }
        */
        
    </style>
</html>
