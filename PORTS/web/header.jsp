<head>
    <%@page import="java.util.*, ports.models.*"%>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/PORTS/css/style.css">
    <link rel="stylesheet" href="/PORTS/css/cssfile.css">
     <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
</head>

<header class="header">
    <%  
        String navUser = "";
            
        if(session.getAttribute("customer")!= null)
        {
            Customer c = (Customer) session.getAttribute("customer");
            navUser = (String) c.getUsername();
        }
    %>
 
    <a href="/PORTS/index.jsp" class="logo"> <i class="fas fa-utensils"></i>Paul's Pizzeria  </a>
    
    <nav class="navbar0">
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
        <a id="openMenu" class="fas fa-bars"></a>    
    </div>
    
    <% if (navUser == "") { %>
        <div class="dropdown">
            <button class="dropbtn" style="cursor: pointer;" onclick="window.location.href='/PORTS/login.jsp'">Login</button>
            
        </div>
        <% } %>
        
        <% if (navUser != "") { %>
        <div class="dropdown">
            <button class="dropbtn"> <%= navUser%> </button>
            <div class="dropdown-content">
                <a href="/PORTS/address.jsp">View Address</a>
                <a href="/PORTS/changePassword.jsp">Change Password</a>
                <a href="/PORTS/orderstatus.jsp">View Order Status</a>
                <a href="#logout">Logout</a>
            </div>
        </div>
        <% } %>
</header>

<script>
    const mainMenu = document.querySelector('.mainMenu');
    const closeMenu = document.querySelector('.closeMenu');
    const openMenu = document.getElementById('openMenu');

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
    
    body  
    {
        
    }
    
    nav {
        color: #fff;
        display: flex;
        justify-content: space-between;
        margin-left: 100px;
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
        background: #CD212A;
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

    #openMenu {
        visibility: hidden;
    }

    nav .logo {
        margin: 6px;
        font-size: 25px;
        cursor: pointer;
    }
    
    @media(max-width: 750px){
        #openMenu {
            visibility: visible;
        }
        nav {
            color: #fff;
            display: flex;
            justify-content: space-between;
            margin-left: 50px;
        }
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
            color: #CD212A;
            font-size: 1.6rem;
        }
        
        .icons i {
            display: inline-block;
            padding: 12px;
        }
    }
    
    .icons-size{
        color: #333;
        font-size: 14px;
    }
    
    .action{
        position: fixed;
        right: 30px;
        top:20px
    }
    
    .action .profile{
        border-radius: 50%;
        cursor: pointer;
        height: 60px;
        overflow: hidden;
        position: relative;
        width: 60px;
    }
    
    .action .profile img{
        width: 100%;
        top:0;
        position: absolute;
        object-fit: cover;
        left: 0;
        height: 100%;
    }
    
    .action .menu{
        background-color:#FFF;
        box-sizing:0 5px 25px rgba(0,0,0,0.1);
        border-radius: 15px;
        padding: 10px 20px;
        position: absolute;
        right: -10px;
        width: 200px;
        transition: 0.5s;
        top: 120px;
        visibility: hidden;
        opacity: 0;
    }
    
    .action .menu.active{
        opacity: 1;
        top: 80px;
        visibility: visible;
    }
    
    .action .menu::before{
        background-color:#fff;
        content: '';
        height: 20px;
        position: absolute;
        right: 30px;
        transform:rotate(45deg);
        top:-5px;
        width: 20px;
    }
    
    .action .menu h3{
        color: #555;
        font-size: 16px;
        font-weight: 600;
        line-height: 1.3em;
        padding: 20px 0px;
        text-align: left;
        width: 100%;
    }
    
    .action .menu h3 div{
        color: #818181;
        font-size: 14px;
        font-weight: 400;
    }
    
    .action .menu ul li{
        align-items: center;
        border-top:1px solid rgba(0,0,0,0.05);
        display: flex;
        justify-content: left;
        list-style: none;
        padding: 10px 0px;
    }
    
    .action .menu ul li img{
        max-width: 20px;
        margin-right: 10px;
        opacity: 0.5;
        transition:0.5s
    }
    
    .action .menu ul li a{
        display: inline-block;
        color: #555;
        font-size: 14px;
        font-weight: 600;
        padding-left: 15px;
        text-decoration: none;
        text-transform: uppercase;
        transition: 0.5s;
    }
    
    .action .menu ul li:hover img{
        opacity: 1;
    }
    
    .action .menu ul li:hover a{
        color:#ff00ff;
    }
    
    /* Dropdown Button */
    .dropbtn {
        background-color: #008C45;
        color: white;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 5%;
        
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown {
        position: relative;
        display: inline-block;
   
        
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #302c2c;
        min-width: 145px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        
    }

    /* Links inside the dropdown */
    .dropdown-content a {
        color: white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        font-size: 12px;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {background-color: whitesmoke; color: black;}

    /* Show the dropdown menu on hover */
    .dropdown:hover .dropdown-content {display: block;}

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown:hover .dropbtn {background-color: #CD212A;}

</style>