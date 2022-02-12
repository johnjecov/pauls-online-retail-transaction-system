<%-- 
    Document   : menu
    Created on : 02 10, 22, 6:11:38 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
    <body>
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
     <!-- header section ends -->
     
        <!-- Menu section starts  -->

<section class="blogs" id="menu">

    <div class="heading">
        <span>Freshly Made Pizza</span>
        <h3>Choose your Pizza</h3>
    </div>

    <div class="box-container">

        <div class="box">
            <div class="image">
                <img src="image/blog-1.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Price </a>
                </div>
                <h3> (Pizza Name) </h3>
                <p>Toppings list....</p>
                <a href="#" class="btn">view more</a>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="image/blog-2.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Price </a>
                </div>
                <h3> (Pizza Name) </h3>
                <p>Toppings list....</p>
                <a href="#" class="btn">view more</a>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="image/blog-3.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Price </a>
                </div>
                <h3> (Pizza Name) </h3>
                <p>Toppings list....</p>
                <a href="#" class="btn">view more</a>
            </div>
        </div>
        
        <div class="box">
            <div class="image">
                <img src="image/blog-3.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Price </a>
                </div>
                <h3> (Pizza Name) </h3>
                <p>Toppings list....</p>
                <a href="#" class="btn">view more</a>
            </div>
        </div>
        
        <div class="box">
            <div class="image">
                <img src="image/blog-3.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Price </a>
                </div>
                <h3> (Pizza Name) </h3>
                <p>Toppings list....</p>
                <a href="#" class="btn">view more</a>
            </div>
        </div>

    </div>

</section>

<!-- Menu section ends -->
   <script src="js/script.js"></script>
    </body>
 
</html>
