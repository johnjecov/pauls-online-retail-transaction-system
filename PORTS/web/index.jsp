<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paul's Pizzeria</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/cssfile.css">

</head>
<body>
    
<!-- header section starts  -->
<%@include file="header.jsp"%>
<!-- header section ends  -->

<section class="shopping-cart-container">
    
</section>

<!-- home section starts  -->
<section class="home" id="home">

    <div class="content">
        <span>Welcome to Paul's Pizzeria</span>
        <h3>Any time is a good time for Pizza!</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis unde dolores temporibus hic quam debitis tenetur harum nemo.</p>
        <a href="#" class="btn">ORDER NOW</a>
    </div>

    <div class="image">
        <img src="image/home-img.png" alt="" class="home-img">
        <img src="image/home-parallax-img.png" alt="" class="home-parallax-img">
    </div>
    
</section>
<!-- home section ends  -->

<div class="line">
    <div class="colmine1"></div>
    <div class="colmine2"></div>
    <div class="colmine3"></div>
</div>

<!-- about section starts  -->
<section class="about" id="about">

    <div class="image">
        <img src="image/about-img.png" alt="">
    </div>

    <div class="content">
        <span>About Us</span>
        <h3 class="title">The Story of Paul's Pizzeria</h3>
        <p><b>Paul Castillo</b> started his business last June, 2020. He was inspired 
            by a relative who was also a business owner. He chose to run a pizzeria 
            simply because it reflects his love towards pizza, and he was inspired by 
            Vito Iacopelli who has a YouTube channel designated for pizza making. 
            He started as a beginner in pizza making, 
            but now he creates pizza that can make customers go for seconds. </p>
         <h3 class="title">The Vision of Paul's Pizzeria</h3>
         <p>To expand the business, franchise more branches, and be the best Pizzeria in the Philippines.</p>
        </div>
    </div>

</section>
<!-- about section ends -->

<!-- popular section starts  -->

<section class="popular" id="popular">
    <div class="heading">
        <span>Popular Pizza</span>
        <h3>MUST TRY PRODUCTS!</h3>
    </div>

    <div class="box-container">

        <div class="box">
            <div class="image">
                <img src="image/food-1.png" alt="">
            </div>
            <div class="content">
                <h3>delicious food</h3>
                <div class="price">$40.00</div>
                <a href="#" class="btn">View More</a>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="image/food-1.png" alt="">
            </div>
            <div class="content">
                <h3>delicious food</h3>
                <div class="price">$40.00</div>
                <a href="#" class="btn">View More</a>
            </div>
        </div>
        
        <div class="box">
            <div class="image">
                <img src="image/food-1.png" alt="">
            </div>
            <div class="content">
                <h3>delicious food</h3>
                <div class="price">$40.00</div>
                <a href="#" class="btn">View More</a>
            </div>
        </div>
    </div>
</section>
<!-- popular section ends -->

<!-- banner section starts  -->
<section class="banner">
    <div class="grid-banner">
        <div class="grid">
            <img src="image/banner-1.png" alt="">
            <div class="content">
                <span>special offer</span>
                <h3>upto 50% off</h3>
            </div>
        </div>
        
        <div class="grid">
            <img src="image/banner-2.png" alt="">
            <div class="content center">
                <span>special offer</span>
                <h3>upto 25% extra</h3>
            </div>
        </div>
        
        <div class="grid">        
            <img src="image/banner-3.png" alt="">
            <div class="content">
                <span>limited offer</span>
                <h3>100% cashback</h3>
            </div>
        </div>
        
    </div>
</section>
<!-- banner section ends -->

<section class="about" id="about">
    <div class="image">
       <div class="mapouter">
        <div class="gmap_canvas">
            <iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=112%20Copenhagen%20St.
            %20Green%20Park%20Village,%20Manggahan,%20Pasig%20City&t=&z=15&ie=UTF8&iwloc=&output=embed" 
            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
        <style>.mapouter{position:relative;text-align:right;height:500px;width:100%;}</style>
        <a href="https://www.embedgooglemap.net">google maps link html</a>
        <style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:100%;}</style>
        <style>.gmap_canvas iframe{position: relative; width: 100%; height: 100%;}</style>
    </div>
</div>
    </div>

    <div class="content">
        <span>Where Are We Located?</span>
        <p>Located in the heart of <b>Pasig</b>, Paul's Pizzeria is situated in the residential 
            zone of <b>Manggahan</b>. Bridging together household communities with the 
            welcoming satisfaction from home-made pizzas. Delivered fresh at your doorstep daily.</p>
        </div>
    </div>

</section>


<!-- order section starts  -->

<section class="order" id="order">

    <div class="heading">
        <span>order now</span>
        <h3>Freshly Made Pizza Home Delivery</h3>
    </div>

    <div class="icons-container">

        <div class="icons">
            <img src="image/icon-1.png" alt="">
            <h3> Tuesday to Sunday</h3>
            <h3>1:00 P.M. to 8:00 P.M.</h3>
        </div>

        <div class="icons">
            <img src="image/icon-2.png" alt="">
            <h3>+63 961 156 7818</h3>
        </div>

        <div class="icons">
            <img src="image/icon-3.png" alt="">
            <h3>112 Copenhagen St. Green Park Village, Manggahan, Pasig City</h3>
        </div>

    </div>

    

</section>

<!-- order section ends -->



<!-- footer section starts  -->

<section class="footer">

    

    <div class="box-container">

        <div class="box">
            <h3>our menu</h3>
            <a href="#"><i class="fas fa-arrow-right"></i> (NAME OF the) pizza</a>
             <a href="#"><i class="fas fa-arrow-right"></i> (NAME OF the) pizza</a>
              <a href="#"><i class="fas fa-arrow-right"></i> (NAME OF the) pizza</a>
               <a href="#"><i class="fas fa-arrow-right"></i> (NAME OF the) pizza</a>
                <a href="#"><i class="fas fa-arrow-right"></i> (NAME OF the) pizza</a>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="#home"> <i class="fas fa-arrow-right"></i> home</a>
            <a href="#about"> <i class="fas fa-arrow-right"></i> about</a>
            <a href="#popular"> <i class="fas fa-arrow-right"></i> popular</a>
            <a href="#menu"> <i class="fas fa-arrow-right"></i> menu</a>
            <a href="#order"> <i class="fas fa-arrow-right"></i> order</a>
        </div>

        <div class="box">
            <h3>extra links</h3>
            <a href="#"> <i class="fas fa-arrow-right"></i> my order</a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my account</a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my favorite</a>
        </div>

        <div class="box">
            <h3>opening hours</h3>
            <p>tuesday: 1:00 P.M. to 8:00 P.M.</p>
            <p>wednesday : 1:00 P.M. to 8:00 P.M.</p>
            <p>friday : 1:00 P.M. to 8:00 P.M.</p>
            <p>Saturday: 1:00 P.M. to 8:00 P.M.</p>
            <p> Sunday and Monday: CLOSED</p>
        </div>

    </div>

    <div class="bottom">

        <div class="share">
            <a href="https://www.facebook.com/Pauls-Pizzeria-100627485039888/" class="fab fa-facebook-f"></a>
            <a href="" class="fab fa-twitter"></a>
            <a href="" class="fab fa-instagram"></a>
        </div>

        <div class="credit"> created <span>TechPare</span> | all rights reserved </div>
        
    </div>

</section>
<!-- footer section ends -->

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>