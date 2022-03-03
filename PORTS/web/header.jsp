<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/PORTS/css/style.css">
    <link rel="stylesheet" href="/PORTS/css/cssfile.css">
</head>

<header class="header">

       <a href="/PORTS/index.jsp" class="logo"> <i class="fas fa-utensils"></i>Paul's Pizzeria  </a>
    
    <nav class="navbar0">
            <div class="openMenu"><i class="fas fa-bars"></i></div>
            <ul class="mainMenu">
                <li><a href="/PORTS/index.jsp#home">Home</a></li>
                <li><a href="/PORTS/index.jsp#about">about</a></li>
                <li><a href="/PORTS/index.jsp#popular">popular</a></li>
                <li><a href="/PORTS/menu.jsp#menu">menu</a></li>
            <div class="closeMenu"><i class="fa fa-times"></i></div>
                <span class="icons">
                    <i class="fab fa-facebook"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-twitter"></i>
                </span>
            </ul>
    </nav>
                
    <div class="icons">
        <a id="cart-btn" class="fas fa-shopping-cart" href="/PORTS/cart.jsp"></a>
        <a id="login-btn" class="fas fa-user" href="/PORTS/login.jsp"></a>
    </div>
</header>

<script>
    const mainMenu = document.querySelector('.mainMenu');
const closeMenu = document.querySelector('.closeMenu');
const openMenu = document.querySelector('.openMenu');

openMenu.addEventListener('click',show);
closeMenu.addEventListener('click',close);

function show(){
    mainMenu.style.display = 'flex';
    mainMenu.style.top = '0';
}
function close(){
    mainMenu.style.top = '-100%';
}
    </script>
    

    
    
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;

}
body  {
}
nav {
    color: #fff;
    display: flex;
    justify-content: space-between;
}
nav .mainMenu {
    display: flex;
    list-style: none;
}
nav .mainMenu li a {
    display: inline-block;
    padding: 15px;
    text-decoration: none;
    text-transform: uppercase;
    color: #fff;
    font-size: 1.5rem;
}
nav .mainMenu li a:hover {
    background: green;
}
nav .openMenu {
    font-size: 2rem;
    margin: 20px;
    display: none;
    cursor: pointer;
}
nav .mainMenu .closeMenu , .icons i {
    font-size: 2rem;
    display: none;
    cursor: pointer;
}
.fa-facebook:hover {color: rgb(0, 110, 255);}
.fa-twitter:hover {color: rgb(86, 154, 243);}
.fa-instagram:hover {color: rgb(255, 0, 191);}
.fa-github:hover {color: rgb(255, 123, 0);}

nav .logo {
    margin: 6px;
    font-size: 25px;
    cursor: pointer;
}
@media(max-width: 800px){
    nav .mainMenu {
        height: 100vh;
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        z-index: 10;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background: #000;
        transition: top 1s ease;
        display: none;
    }
    nav .mainMenu .closeMenu {
        display: block;
        position: absolute;
        top: 20px;
        right: 20px;
    }
    nav .openMenu {
        display: block;
        top: 0;
        position: fixed;
        padding-left: 20px;
        right: 21%;
    }
    
    nav .mainMenu li a:hover {
        background: none;
        color: green;
        font-size: 1.6rem;
    }
    .icons i {
        display: inline-block;
        padding: 12px;
    }
}
    </style>