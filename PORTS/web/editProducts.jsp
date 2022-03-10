<%-- 
    GAWAN NG MAX WIDTH MGA PICTURES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/editProducts.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Products Page</title>
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
            <div class="adminGreetings">
                <p class='helloAdmin'>Hello, admin</p>
            </div>
            <div class="adminContent">
                <div class="menuCategory">
                    <ul class="pizzaOrToppings">
                        <li class="pizzaOrToppingsCategory">Pizza</li>
                        <li class="pizzaOrToppingsCategory">Toppings</li>
                    </ul>
                </div>
                <div class="pizzaChoices">
                    <div class="pizzaDisplay1">
                        <img class="pizzaImg" src="image/plus.png" alt="mama mia">
                        <input type="text" class="pizzaName1" name="enterProductName" placeholder="ENTER PRODUCT NAME">
                        <input type="text" class="pizzaDesc1" name="enterProductDesc" placeholder="Product Description">
                        <input type="text" class="price1" name="enterPrice" placeholder="PRICE">
                        <div class="quantityDiv">
                            <img id="quantityPlusButton" class="quantityPlusButton" src="image/plus_yellow.png" alt="plus button">
                            <input type="text" id="quantity1" class="quantity1" name="enterQuantity" placeholder="0">
                            <img id="quantityMinusButton" class="quantityMinusButton" src="image/minus_yellow.png" alt="minus button">
                        </div>
                        <button class="availabilityButton" type="button">Available</button>
                    </div>
                    <div class="pizzaDisplay2">
                        <img class="pizzaImg" src="image/pizza-sample.png" alt="mama mia">
                        <p class="pizzaName2">CREAMY SPINACH PIZZA</p>
                        <p class="pizzaDesc2">Cream cheese,  Mozarella, Spinach, and Tomato Sauce</p>
                        <p class="price2">- ₱290.00 -</p>
                        <div class="quantityDiv">
                            <img id="quantityPlusButton" class="quantityPlusButton" src="image/plus_yellow.png" alt="plus button">
                            <input type="text" id="quantity2" class="quantity2" name="enterQuantity" placeholder="0">
                            <img id="quantityMinusButton" class="quantityMinusButton" src="image/minus_yellow.png" alt="minus button">
                        </div>
                        <button class="availabilityButton" type="button">Available</button>
                        <p class="orderRemove" id="orderRemoveID">+</p>
                    </div>
                    <div class="pizzaDisplay3">
                        <img class="pizzaImg" src="image/pizza-sample.png" alt="mama mia">
                        <p class="pizzaName3">CHEESE WITH BASIL</p>
                        <p class="pizzaDesc3">Mozarella, Parmesan, Basil, and Tomato Sauce</p>
                        <p class="price3">- ₱198.00 -</p>
                        <div class="quantityDiv">
                            <img id="quantityPlusButton" class="quantityPlusButton" src="image/plus_yellow.png" alt="plus button">
                            <input type="text" id="quantity3" class="quantity3" name="enterQuantity" placeholder="0">
                            <img id="quantityMinusButton" class="quantityMinusButton" src="image/minus_yellow.png" alt="minus button">
                        </div>
                        <button class="availabilityButton" type="button">Available</button>
                        <p class="orderRemove" id="orderRemoveID">+</p>
                    </div>
                    <script>
                        document.querySelector('.availabilityButton').addEventListener('click',
                                function () {
                                    if (document.querySelector('.availabilityButton').style.backgroundColor === '#008c45') {
                                        document.querySelector('.availabilityButton').style.backgroundColor = '#999999';
                                    } else {
                                        document.querySelector('.availabilityButton').style.backgroundColor = '#008c45';
                                    }
                                });

                        document.querySelector('.quantityPlusButton').addEventListener('click',
                                function () {
                                    var inputVal = document.getElementById("quantity1").value;
                                    if (inputVal === null) {
                                        inputVal = 0;
                                        document.getElementById("quantity1").setAttribute('value', parseInt(inputVal) + 1);
                                    } else {
                                        document.getElementById("quantity1").setAttribute('value', parseInt(inputVal) + 1);
                                    }
                                });
                    </script>
                </div>
                <div class="bottomButtons">
                    <ul class="pageList">
                        <li class="pageNumber">1</li>
                        <li class="pageNumber">2</li>
                        <li class="pageNumber">3</li>
                    </ul>
                    <div class="saveChanges">
                        <button class="saveChangesButton" type="button">
                            Save Changes
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
