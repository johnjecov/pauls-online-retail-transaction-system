<%-- 
    Document   : index
    Created on : 02 10, 22, 1:44:12 PM
    Author     : Kirby Wenceslao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Template</title>
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0, text/html; charset=UTF-8">
    </head>
    
    <style>
        *
        {
            margin: 0px;
            padding: 0px;
        }
        
        header
        {
            text-align: center;
            height: 30px;
            background-color: yellow;
        }
        
        .content
        {
            min-height: 98vh;
            background-color: pink;
            display: flex;
            align-items: center;
            justify-content: center;  
            font-size: 50px;
        }
        footer
        {
            text-align: center;
            height: 30px;
              background-color: yellow;
        }
    </style>
    <body>
        <header>Title</header>
        <div class = "content">Content</div>
        <footer><center>This is the Footer</center></footer>
    </body>
</html>
