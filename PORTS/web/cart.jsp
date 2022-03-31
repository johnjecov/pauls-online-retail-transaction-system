<%-- 
    Document   : cart
    Created on : 02 24, 22, 5:06:31 PM
    Author     : Paul Ace Canoza
--%>
<%@page import="java.util.*, ports.models.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@  page import = "ports.models.*" %> 
    <%@  page import = "java.util.*" %>  
    <%@  page import = "javax.servlet.*" %>  
    <%
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Expires","-1");
                    
        if(session.getAttribute("customer") == null)
        {
            response.sendRedirect("index.jsp");
        }
    %>
     
    <head>
        <link rel="icon" type="image/png" href="image/logo.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add to Cart</title>
               <link href="https://fonts.googleapis.com/css2?"
              family="Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-
              awesome/4.7.0/css/font-awesome.mid.css">
        
    </head>
    <body>
        <div class="container">
        <!-- header section starts -->
        
        <%@include file="header_external.jsp"%>
        <!-- header section ends -->
        <%       
        ServletContext app = getServletContext();
         PortsDatabase port = (PortsDatabase)app.getAttribute("dbConnection");
         ArrayList<Address> add = new ArrayList<Address>();
          
         Customer c = null;
         Cart theCart = null;
          
         ArrayList items = null;
          
          if(session.getAttribute("customer")!= null)
            {
                c = (Customer) session.getAttribute("customer");
                theCart = c.getCart(port);
                add = port.getCustomerAddresses(c.getCustomer_Id());
                items = (theCart.getItems());
            }
          
        if(items.size()!=0) { %>
        <div class="cartOrders">`
        <h1 style="text-align:center">Order Summary</h1>
        
        <table class="table">
        <thead>
     	<tr>
            <th>Pizza</th>
            <th>Quantity</th>
            <th>Toppings</th>
            <th>Subtotal</th>
     	</tr>
        </thead>
        <tbody>
        <% 
           
         if(add.size()==0)
            response.sendRedirect("address.jsp");
            
            for(int a=0; items.size() > a; a++)
            { 
        %>
        <tr>
            <td data-label="Pizza">
                <div class="cart-info">
                    <img src="image/food-3.png">
                    <div class="pizza-name">
                        <% String pizzaName = ((CartItem)(items.get(a))).getProduct().getName();
                            out.print(pizzaName);
                        %>
                        <br>
                        <form  method="POST" action="removeItemFromCart" autocomplete="off">
                        <button style = "background: transparent; color: #CD212A; cursor: pointer;"name ="remove" value="<%= ((CartItem)(items.get(a))).getCartItemId() %>" class="" style="cursor: pointer;">Remove</button>
                       </form>
                    </div>
                </div>  
            </td>
            <td data-label="Quantity"><%= ((CartItem)(items.get(a))).getQuantity() %> </td>
            <td class="toppingW" data-label="Toppings"><%= ((CartItem)(items.get(a)))%> </td>
            <td data-label="Total Price">₱<%= ((CartItem)(items.get(a))).getItemTotal()  %> </td>
        </tr>
        <% }
        %>
        
          
        </tbody>
        </table>
        </div>
        <form method="POST" action="checkout" autocomplete="off">
        <div class="delivery-time">
        <div>
            <h4>Delivery Time: </h4>
            <%  String pattern = "yyyy-MM-dd";
      
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern(pattern);
        LocalDateTime min = LocalDateTime.now().minusDays(1);
        LocalDateTime max = LocalDateTime.now().plusDays(30);
        String minF = formatDate.format(min);
        String maxF = formatDate.format(max);%>
            <input type="date" name="deliveryDate" required="required" min="<%=minF%>" max="<%=maxF%>"> 
        </div>
            <div>
                <h4>Delivery Address:</h4>
                <select class= "Address" name="address" required>
                    <option value="" disabled selected>Choose your address</option>
                    <%
                     for(int x=0; add.size() > x; x++) {%>
                    <option value = "<%=((Address)add.get(x)).getAddressId()  %>"><%=((Address)add.get(x)).getAddressName()%></option>
                    <%}%>
                 
                </select>
                </div>
            <br>
            <div>       
                <h4>Payment Method</h4>
                <input type="radio" id="payment1" name="payment" value="Cash On Delivery"  required="required">
                <label for="payment1">Cash On Delivery</label>
                <br>
                <input type="radio" id="payment2" name="payment" value="GCash"  required="required">
                <label for="payment2">GCash</label>
                <br>
                
                <div class="warning-message">
                <br>
                <p>For GCash Payments, please deposit GRAND TOTAL amount to +63 905 316 2163 before proceeding to Checkout and send proof of payment to https://www.messenger.com/t/100627485039888 </p>
                </div>
            </div>
            
            <div class="grandtotalbx">
                <p class ="grandtotal">Total: ₱<%= c.getCart(port).getCart_Total()%></p>
            </div>
        </div>
        
        <div class="checkout">
            <%
                Order orderCustomer = c.getOrder(port);
                System.out.println("At Cart: "+orderCustomer.getOrder_Id());
                if(items.size() != 0) {
                    if(!orderCustomer.existingOrder() || !(orderCustomer.getOrder_Status_Id() < 5)) { %>
                        <input class="btn" type = "submit" value = "Place Order"> 
                    <%
                    }
                    else { %>
                        <input class="btn" type = "submit" value = "Place Order" disabled="disabled">
                    <%        
                    }
                }
                else { %>
                    <input class="btn" type = "submit" value = "Place Order" disabled="disabled">
                <%}
            %>
        </div>
            </form>
        </div>
        <% } else {%>
        <div class="noOrders">
        <h2 style="position: relative; top:50%; width: 100%; text-align: center; font-size: 50px; color: white;">You have No Items in your Cart</h2>
        </div>
        <% } %>
          <%@include file="footer_external.jsp"%>
    </body>
    
    <script>
        var MenuItems = document.getElementById("MenuItems");
        
        MenuItems.style.maxHeight = "0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px")
            {
                MenuItems.style.maxHeight = "200px";
            }
            else
            {
                MenuItems.style.maxHeight = "0px"
            }
        }
    </script>
    
    <style>
        
        .cartOrders
        {
            width: 100%;
            min-height: 380px;
        }
        
        .noOrders
        {
            width: 100%;
            height: 680px;
        }
        .toppingW
        {
            min-width: 100px;
            max-width: 300px;
        }
        *
        {
            font-family: 'Poppins', sans-serif;
        }
        html
        {
            background-color: #1e1f20;
        }
        
        .cart-page
        {
            margin: 40px;
        }
        
        table
        {
            width: 100%;
            border-collapse: collapse;
        }
        
        .cart-info
        {
            flex-wrap: wrap;
        }

        th
        {
            text-align: left;
            padding: 5px;
            font-weight: normal;
        }

        td
        {
            padding: 10px 5px;
            color: white;
        }

        td input
        {
            width: 40px;
            height: 30px;
            padding: 5px;
        }

        td a
        {
            color: #ff523b;
            font-size: 12px;
        }

        td img
        {
            width: 120px;
            height: 100px;
            margin-right: 10px;
        }

        .total-price
        {
            display: flex;
            justify-content: flex-end;
        }

        .total-price table
        {
            border-top: 1px solid #ff523b;
            width: 100%;
            max-width: 500px;
        }

        td:last-child
        {
            text-align: right;
        }

        th:last-child
        {
            text-align: right;
        }

        .cart-info p
        {
            display: none;
        }
        
        .grandtotal
        {
            font-size: 30px;
            color: white;
        }
        
        .delivery-time
        {
            display: flex;
            column-gap: 40px;
            flex-wrap: wrap;
            padding: 30px;
            font-size: 15px; 
            color: white;
        }

     
        .last-row
        {
            background: none;
        }
        .pizza-name
        
        {
            font-size: 20px;
        }
        
        .pizza-price
        {
            font-size: 12px;
        }
        
        .grandtotalbx
        {
            margin-left: auto;
            align-content: flex-end;

        }
        
        .warning-message p
        {
            font-size: 13px;
            text-transform: none;
        }
        
        .warning-message
        {
            width: 1000px;
            height: auto;
        }
        
        .btn
        {
            margin-left: auto;
            background-color: #CD212A;
        }
        
        .btn:hover
        {
            background-color: white;
            color: black;   
        }
        
        .checkout
        {
            display: flex;
            padding-right: 20px;
            padding-bottom: 30px;
        }

        .table
        {
            width: 100%;
            border-collapse: collapse;
            border-bottom: 1px solid white;
            color: white;   
        }

        .table td,.table th
        {
            padding: 12px 15px;
            text-align: center;
            font-size: 20px;
        }

        .table th
        {
            border-bottom: 1px solid white;
            color: white;
        }

        h1
        {
            font-size: 40px;
            color: white;
            padding-top: 30px;
            padding-bottom: 30px;
        }
        
        @media(max-width: 800px)
        {
            .table thead
            {
                display: none;
            }
            
            .warning-message
            {
                width: auto;
            }
            
            .grandtotalbx
            {
                margin-top: 20px;
            }
            
            .delivery-time
            {
                flex-direction: column;
            }
            .table, .table tbody, .table tr, .table td
            {
                display: block;
                width: 100%;
            }
            
            .table tr
            {
                margin-bottom:15px;
            }
            .table td
            {
                text-align: right;
                padding-left: 50%;
                text-align: right;
                position: relative;
            }
            .table td::before
            {
                content: attr(data-label);
                position: absolute;
                left:0;
                width: 50%;
                padding-left:15px;
                font-size:15px;
                font-weight: bold;
                text-align: left;
            }
        }
    </style>
</html>
