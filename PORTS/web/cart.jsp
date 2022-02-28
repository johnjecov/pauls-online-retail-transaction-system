<%-- 
    Document   : cart
    Created on : 02 24, 22, 5:06:31 PM
    Author     : Paul Ace Canoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
             <table class="table">
     <thead>
     	<tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
     	</tr>
     </thead>
     <tbody>
     	  <tr>
                    <td data-label="Product Name">
                        <div class="cart-info">
                            <img src="image/food-3.png">
                            <div class="pizza-name">
                                Pizza Name
                                <br>
                                <a href="">Remove</a>
                            </div>
                        </div>
                    </td>
                    <td data-label="Price">P250.00 </td>
                    <td data-label="Quantity"> 1 </td>
                    <td data-label="Price">P250.00</td>
                </tr>
                
                
            <tr>
                    <td data-label="Product Name">
                        <div class="cart-info">
                            <img src="image/food-3.png">
                            <div class="pizza-name">
                                Pizza Name
                                <br>
                                <a href="">Remove</a>
                            </div>
                        </div>
                    </td>
                    <td data-label="Price">P250.00 </td>
                    <td data-label="Quantity"> 1 </td>
                    <td data-label="Price">P250.00</td>
                </tr>
                
            <tr>
                    <td data-label="Product Name">
                        <div class="cart-info">
                            <img src="image/food-3.png">
                            <div class="pizza-name">
                                Pizza Name
                                <br>
                                <a href="">Remove</a>
                            </div>
                        </div>
                    </td>
                    <td data-label="Price">P250.00 </td>
                    <td data-label="Quantity"> 1 </td>
                    <td data-label="Price">P250.00</td>
            </tr>

                
     	
     </tbody>
   </table>
        </div>
    <div class="delivery-time">
        <div>
                <h4>Delivery Time: </h4>
          <input type="date"> 

        </div>  
                    <div>
                <h4>Delivery Address:</h4>
                <select class= "Address">
                    <option disabled selected>Choose your address</option>
                    <option value = "0">0</option>
                    <option value = "1">1</option>
                </select>
                </div>
                    
                         <br>
             <div>       
                <h4>Payment Method</h4>
                <input type="radio" id="payment1" name="payment" value="">
                  <label for="payment1"> Cash On Delivery </label>
                  <input type="radio" id="payment2" name="payment" value="">
                  <label for="payment2">GCASH</label>
                  <br>
                  <div class="warning-message">          
                    <p>For GCash Payments, please deposit the total amount to +63 905 316 2163 before proceeding to Checkout and send proof of payment to https://www.messenger.com/t/100627485039888 </p>
                  </div>
                                   
                </div>
                         <div class="grandtotalbx">
                    <p class ="grandtotal">Grand total:
                        P350.00</p>
                         </div>
    </div>
    <div class="checkout">
                  <a href="#" class="btn">PROCEED TO CHECKOUT</a>
    </div>
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
        
        /*------ cart items ------*/

.cart-page{
    margin: 40px;
}

table{
    width: 100%;
    border-collapse: collapse;
}

.cart-info{
    flex-wrap: wrap;
}

th{
    text-align:left;
    padding:5px;
    font-weight: normal;
}

td{
padding: 10px 5px;
}

td input{
width: 40px;
height: 30px;
padding: 5px;
}

td a{
color: #ff523b;
font-size: 12px;
}

td img{
width: 120px;
height: 100px;
margin-right: 10px;
}

.total-price{
display: flex;
justify-content: flex-end;
}

.total-price table{
    border-top: 3px solid #ff523b;
    width: 100%;
    max-width: 500px;
}

td:last-child{
    text-align: right;
}

th:last-child{
    text-align: right;
}

.cart-info p{
    display: none;
}
.grandtotal{
    font-size: 20px;
}
.delivery-time{
    
    display: flex;
    column-gap: 40px;
    flex-wrap: wrap;
    padding: 30px;
}

.box
{
    width: 20px;
}
.last-row{
    background: none;
}
.pizza-name{
    font-size: 20px;
}
.pizza-price{
    font-size: 12px;
}
.grandtotalbx
{
    margin-left: auto;
    align-content: flex-end;
    
}
.warning-message{
    width: 490px;
    height: auto;
}
.btn{
    margin-left: auto;
}
.checkout{
    display: flex;
    padding-right: 20px;
    padding-bottom: 30px;
}




.table{
	width: 100%;
	border-collapse: collapse;
}

.table td,.table th{
  padding:12px 15px;
  border:1px solid #ddd;
  text-align: center;
  font-size:16px;
}

.table th{
	background-color: darkblue;
	color:#ffffff;
}

.table tbody tr:nth-child(even){
	background-color: #f5f5f5;
}

/*responsive*/

@media(max-width: 800px){
	.table thead{
            display: none;
	}
        .warning-message{
            width: auto;
        }
        .grandtotalbx{
            margin-top: 20px;
        }
        .delivery-time{
            flex-direction: column;
        }
	.table, .table tbody, .table tr, .table td{
		display: block;
		width: 100%;
	}
	.table tr{
		margin-bottom:15px;
	}
	.table td{
		text-align: right;
		padding-left: 50%;
		text-align: right;
		position: relative;
	}
	.table td::before{
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
