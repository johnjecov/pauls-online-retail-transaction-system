<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ports.models.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/adminPDF.css?nocache={timestamp}" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PDF Page</title>
    </head>
    <body>
         <%@include file="adminLogout.jsp"%>
        <div class="contentHolder">
            <div class="sidebar">
                <img class="logo" src="image/Paul's Pizzeria Logo_1.jpg" alt="Paul's Pizzeria Logo">
                <ul class='adminOptions'>
                    <li class="options"><a href="adminHistoryPage.jsp">Sales</a></li>
                    <li class="options"><a href="adminOrderList.jsp">Order List</a></li>
                    <li class="options"><a href="admin.jsp">Menu</a></li>
                    <li class="options"><a href="adminAnalytics.jsp">Analytics</a></li>
                </ul>
                    <a style="text-decoration:none;" class = "logout" href="./logout">Logout</a>
            </div>
            <div class="pageContent">
            <div class="adminGreetings">
                <p class='helloAdmin'>Hello, admin</p>
            </div>
            
                <embed class="pdfItem" src="generatePDF" type="application/pdf"/>
            
            </div>
        </div>
    </body>
</html>
