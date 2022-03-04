<%-- 
    Document   : generatePDF
    Created on : 03 1, 22, 9:25:57 PM
    Author     : John Jeco Villanueva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/admin.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PDF Page</title>
    </head>
    <body>
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
            <div class="pdfContent">
                <embed class="pdfItem" src="files/test.pdf" type="application/pdf"/>
            </div>
        </div>
    </body>
</html>
