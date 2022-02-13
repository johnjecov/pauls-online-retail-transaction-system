function start(){
    var url = window.location.href.split('#');
    if(url.length == 1)
    {
        if(url[0].includes("menu.jsp"))
        {
            document.querySelector('#menuL').classList.toggle('active');
            document.querySelector('#aboutL').classList.remove('active');    
            document.querySelector('#popularL').classList.remove('active');
            document.querySelector('#homeL').classList.remove('active');
        }
        else if (url[0].includes("login.jsp") || url[0].includes("register.jsp"))
        {
            document.querySelector('#homeL').classList.remove('active');   
            document.querySelector('#aboutL').classList.remove('active');    
            document.querySelector('#popularL').classList.remove('active');
            document.querySelector('#menuL').classList.remove('active');
        }
        else
        {
            document.querySelector('#homeL').classList.toggle('active');   
            document.querySelector('#aboutL').classList.remove('active');    
            document.querySelector('#popularL').classList.remove('active');
            document.querySelector('#menuL').classList.remove('active');
        }
       
    }
    else
    {
        document.querySelector('#homeL').classList.remove('active');  
        document.querySelector('#aboutL').classList.remove('active');    
        document.querySelector('#popularL').classList.remove('active');
        document.querySelector('#menuL').classList.remove('active');
        document.querySelector('#'+url[1]+'L').classList.toggle('active');
    }
}

window.onload = start;



let searchForm = document.querySelector('.search-form-container');

document.querySelector('#search-btn').onclick = () =>{
    searchForm.classList.toggle('active');
    cart.classList.remove('active');    
    loginForm.classList.remove('active');
    navbar.classList.remove('active');
}

let cart = document.querySelector('.shopping-cart-container');

document.querySelector('#cart-btn').onclick = () =>{
    cart.classList.toggle('active');
    searchForm.classList.remove('active');
    loginForm.classList.remove('active');
    navbar.classList.remove('active');
}

let loginForm = document.querySelector('.login-form-container');

/*
document.querySelector('#login-btn').onclick = () =>{
    loginForm.classList.toggle('active');
    searchForm.classList.remove('active');
    cart.classList.remove('active');    
    navbar.classList.remove('active');
}

*/
let navbar = document.querySelector('.header .navbar');

document.querySelector('#menu-btn').onclick = () =>{
    navbar.classList.toggle('active');
    searchForm.classList.remove('active');
    cart.classList.remove('active');    
    loginForm.classList.remove('active');
}



document.querySelector('#homeL').onclick = () =>{
    document.querySelector('#homeL').classList.toggle('active');
    document.querySelector('#aboutL').classList.remove('active');    
    document.querySelector('#popularL').classList.remove('active');
    document.querySelector('#menuL').classList.remove('active');
}
document.querySelector('#aboutL').onclick = () =>{
    document.querySelector('#aboutL').classList.toggle('active');
    document.querySelector('#homeL').classList.remove('active');    
    document.querySelector('#popularL').classList.remove('active');
    document.querySelector('#menuL').classList.remove('active');
}

document.querySelector('#popularL').onclick = () =>{
    document.querySelector('#popularL').classList.toggle('active');
    document.querySelector('#homeL').classList.remove('active');    
    document.querySelector('#aboutL').classList.remove('active');
    document.querySelector('#menuL').classList.remove('active');
}

document.querySelector('#menuL').onclick = () =>{
    document.querySelector('#menuL').classList.toggle('active');
    document.querySelector('#homeL').classList.remove('active');    
    document.querySelector('#aboutL').classList.remove('active');
    document.querySelector('#popularL').classList.remove('active');
}


window.onscroll = () =>{
    navbar.classList.remove('active');
}

document.querySelector('.home').onmousemove = (e) =>{

    let x = (window.innerWidth - e.pageX * 2) / 90;
    let y = (window.innerHeight - e.pageY * 2) / 90;

    document.querySelector('.home .home-parallax-img').style.transform = `translateX(${y}px) translateY(${x}px)`;
}

document.querySelector('.home').onmouseleave = () =>{

    document.querySelector('.home .home-parallax-img').style.transform = `translateX(0px) translateY(0px)`;
}   