<%-- 
    Document   : Login
    Created on : 05 17, 21, 1:36:23 AM
    Author     : manuellouisecruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="shortcut icon" type="image/png" href="images/logotrans.png">
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
        <script src = "https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
        <link rel = "stylesheet" href = "https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <script src = "https://unpkg.com/swiper/swiper-bundle.min.js"></script>
      
        <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
    </head>
    
    <body>
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
     <!-- header section ends -->
        <section>
            <div class = "container">
                <div class = "user Aaddress">
                     <!-- a -->
                    <div class = "formBx">
                            <div class="scrollbx">
               
                        <form method="POST" action="signup" autocomplete="off">
                            <h2>View Addresses</h2>
                            <p class = "signup"><a href = "#" onclick = "toggleForm();">Add New Address</a></p>
                            <br>
                                <div class="viewAddressBx">
                                    <div class="edit">
                                        <h3>Address#1</h3>
                                        <div class="box"></div>
                                       
                                    </div>
                            
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                       Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                       when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                   </p>
                                    <input type = "submit" value = "Edit">
                               </div>
                            <br>
                            
                            <div class="viewAddressBx">
                                    <div class="edit">
                                        <h3>Address#2</h3>
                                        <div class="box"></div>
                                    </div>
                            
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                       Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                       when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                   </p>
                                    <input type = "submit" value = "Edit">
                               </div>
                            <br>
                            <div class="viewAddressBx">
                                    <div class="edit">
                                        <h3>Address#3</h3>
                                        <div class="box"></div>
                                    </div>
                            
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                       Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                       when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                   </p>
                                    <input type = "submit" value = "Edit">
                               </div>
                            <br>
                            
                            <div class="viewAddressBx">
                                    <div class="edit">
                                        <h3>Address#4</h3>
                                        <div class="box"></div>
                                     </div>
                            
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                       Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                       when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                   </p>
                                    <input type = "submit" value = "Edit">
                              
                         
                    </form>  
                            </div>
                </div>
            </div>
                    <div class = "imgBx"><img src="images/ntbk.jpg"></div>
                </div>
                <div class = "user Vaddress">
                         <div class = "imgBx"><img src="images/ntbk.jpg"></div>
                    <div class = "formBx">
                        <form method="POST" action="login" autocomplete="off">
                            <h2>Add New Address</h2>
                            <input id ="user" type = "text" placeholder = "Address Name" name="addressName" required="required">
                            <div class ="radiocon">
                                 <input id ="user" type = "text" placeholder = "First Name" name="firstName" required="required">
                                 <div class="box"></div>
                                 <input id ="user" type = "text" placeholder = "Last Name" name="lastName" required="required">
                                                            </div>
                            
                         
                            <input id ="user" type = "text" placeholder = "Street Number" name="stNumber" required="required">
                            <input id ="user" type = "text" placeholder = "Street Name" name="stName" required="required">
                            
                            <div class ="radiocon">
                                 <input id ="user" type = "text" placeholder = "Province" name="province" required="required">
                                    <div class="box"></div>
                            <input id ="user" type = "text" placeholder = "Barangay No." name="barangay" required="required">
                                    <div class="box"></div>
                            <input id ="user" type = "text" placeholder = "City" name="city" required="required">
                                    <div class="box"></div>
                        </div>
                           
                          
                            <input id ="user" type = "text" placeholder = "Additional Information" name="additionalInfo" required="required">
                          
                            <input type = "submit" value = "Submit"> 
                            <p class = "signup"><a href = "#" onclick = "toggleForm();">View Addresses</a></p>
                        </form>    
                    </div>
                </div>
                    
          </div
        </section>
        
        <script>
            function toggleForm()
            {
                section = document. querySelector('section');
                container = document.querySelector('.container');
                container.classList.toggle('active');
                section.classList.toggle('active');
            }
        </script>
        
      
        
        <script>
            const inputs = document.querySelectorAll("input, select, textarea");
            inputs.forEach(input => {
              input.addEventListener(
                "invalid",
                event => {
                  input.classList.add("error");
                },
                false
              );
            });
            </script>
    </body>
    
    <style>
        
        .scrollbx{
            overflow: hidden;
            overflow-y: scroll;
            height: 100%;
            width: 100%;
            
        }
        
        .viewAddressBx{
            background-color: #eeeeee;
            border-radius: 15px;
            padding: 20px;
        }
 
        .edit{
            display: flex;
           
        }
        
       .box
       {
           width: 30px;
       }
        input:required:focus {
            border: 1px solid cyan !important;
        }
        
       
         *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }
        
        section
        {
            position: relative;
            min-height: 100vh;
            background: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            transition: 0.5s;
        }

        section.active
        {
            background: #f7f7f7;
        }
        
        section .container
        {
           
            position: relative;
            width: 1000px;
            height: 800px;
            background: #fff;
            box-shadow: 0 15px 50px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 70px;
        }
        
        section .container .user
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
        }
        
        section .container .user .imgBx
        {
            position: relative;
            width: 50%;
            height: 100%;
            transition: 0.5s;
        }
        
        section .container .user .imgBx img
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        section .container .user .formBx
        {
            position: relative;
            width: 100%;
            height: 100%;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            transition: 0.5s;
        }
        
        section .container .user .formBx h2
        {
            font-size: 18px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-align: center;
            width: 100%;
            margin-bottom: 10px;
            color: #555;
        }
        
        section .container .user .formBx input
        {
            width: 100%;
            padding: 10px;
            background: #f5f5f5;
            color: #333;
            border: none;
            outline: none;
            box-shadow: none;
            font-size: 14px;
            margin: 8px 0;
            letter-spacing: 1px;
            font-weight: 300;
        }
        
        section .container .user .formBx input[type="submit"]
        {
            max-width: 100px;
            background: #677eff;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 1px;
            transition: 0.5s;
        }

        section .container .user.Vaddress .formBx input[type="submit"]
        {
            background: #8bc34a;
        }
        
        section .container .user .formBx .signup
        {
            position: relative;
            margin-top: 20px;
            font-size: 12px;
            letter-spacing: 1px;
            color: #555;
            text-transform: uppercase;
            font-weight: 300;
        }
        
        section .container .user .formBx .signup a
        {
            font-weight: 600;
            text-decoration: none;
            color: #577eff;
        }
        
        section .container .user .formBx .Vaddress
        {
            display: none;
        }
        section .container .Vaddress
        {
            pointer-events: none;
        }
        
        section .container.active .Vaddress
        {
            pointer-events: initial;
        }
        
        section .container .Vaddress .formBx
        {
            top: 100%;
        }
        
        section .container.active .Vaddress .formBx
        {
            top: 0;
        }
        
        section .container .Vaddress .imgBx
        {
            top: -100%;
            transition: 0.5s;
        }
        
        section .container.active .Vaddress .imgBx
        {
            top: 0;
        }

        section .container .Aaddress .formBx
        {
            top: 0;
        }
        
        section .container.active .Aaddress .formBx
        {
            top: 100%;
        }
        
        section .container .Aaddress .imgBx
        {
            top: 0;
            transition: 0.5s;
        }
        section .container.active .Aaddress .imgBx
        {
            top: 100%;
        }
        
        @media (max-width: 991px)
        {
            section .container
            {
                max-width: 400px;
            }
            section .container .imgBx
            {
                display: none;
            }
            section .container .user .formBx
            {
                width: 100%;
            }
            section .container.active .Aaddress .formBx
            {
                top: -100%  ;
            }
        }
        
        .rad-label
        {
            display: flex;
            align-items: center;
            border-radius: 100px;
            padding: 14px 16px;
            margin: -5px;
            cursor: pointer;
            transition: .3s;
        }
        
        .rad-label:hover,.rad-label:focus-within 
        {
            background: hsla(0, 0%, 80%, .14);
        }
        
        .rad-input
        {
            position: absolute;
            left: 0;
            top: 0;
            width: 1px;
            height: 1px;
            opacity: 0;
            z-index: -1;
        }
        
        .rad-design
        {
            width: 22px;
            height: 22px;
            border-radius: 100px;
            background: linear-gradient(to right bottom, hsl(154, 97%, 62%), hsl(225, 97%, 62%));
            position: relative;
        }
        .rad-design::before
        {
            content: '';
            display: inline-block;
            width: inherit;
            height: inherit;
            border-radius: inherit;

            background: hsl(0, 0%, 90%);
            transform: scale(1.1);
            transition: .3s;
        }
        
        .rad-input:checked+.rad-design::before
        {
            transform: scale(0);
        }
        
        .rad-text
        {
            color: hsl(0, 0%, 60%);
            margin-left: 14px;
            letter-spacing: 3px;
            text-transform: uppercase;
            font-size: 12px;
            font-weight: 900;
            transition: .3s;
        }
        
        .rad-input:checked~.rad-text
        {
            color: hsl(0, 0%, 40%);
        }
        
        .radiocon
        {
            display: flex;
        }
        
        @media (max-width: 500px)
        {
            .radiocon
            {
                flex-direction: column;
            }
        }
        </style>
        
</html>
