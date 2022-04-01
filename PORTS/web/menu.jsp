<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="image/logo.png">
    <title>Menu</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body id = "menuBody">
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
        
        <% 
            ServletContext sc = getServletContext();
            PortsDatabase ports = (PortsDatabase) getServletContext().getAttribute("dbConnection");
            ArrayList<Product> menu = ports.getProducts();
 
            for (Product x : menu) 
            {
                String box = "";
                
                if(x.getStock() != 0)
                {
                    box = String.format(
                           "<form class = 'box' id = 'menuBox' action = 'SpecificProduct' method = 'POST'>"
                               + "<input type = 'text' value = '%d' name = 'specificProduct'style = 'display: none;'>"
                               + "<div class = 'image'>"
                                   + "<img src = '%s' alt = 'no image'>"
                               + "</div>"
                               + "<div class = 'content'>"
                                   + "<div class = 'tags'>"
                                       + "<a> <i class = 'fas fa-tag' ></i>₱%s</a>"
                                   + "</div>"
                                   + "<h3>%s</h3>"
                                   + "<p>%s</p>"
                                   + "<input type = 'submit' class = 'btn' value = 'Add to Cart'>"
                               + "</div>"
                           + "</form>", 
                           x.getId(),x.getImage(), x.getPrice(), x.getName(), x.getDesc()
                           );    
                }
                else 
                {
                    box = String.format(
                           "<form class = 'box' id = 'menuBox' action = 'SpecificProduct' method = 'POST'>"
                               + "<input type = 'text' value = '%d' name = 'specificProduct'style = 'display: none;'>"
                               + "<div class = 'image'>"
                                   + "<img src = '%s' alt = 'no image'>"
                               + "</div>"
                               + "<div class = 'content'>"
                                   + "<div class = 'tags'>"
                                       + "<a> <i class = 'fas fa-tag' ></i>₱%s</a>"
                                   + "</div>"
                                   + "<h3>%s</h3>"
                                   + "<p>%s</p>"
                                   + "<input type = 'submit' class = 'btn' value = 'Not Available' disabled>"
                               + "</div>"
                           + "</form>", 
                           x.getId(),x.getImage(), x.getPrice(), x.getName(), x.getDesc()
                           );    
                }
                
                
                  out.println(box);
            }
        %>
     
     
    </div>
</section>

<!-- Menu section ends -->
   <script src="js/script.js"></script>
     <%@include file="footer_external.jsp"%>
    </body>
 
</html>
