<%-- 
    Document   : customerLogout
    Created on : 03 14, 22, 11:59:02 PM
    Author     : manuellouisecruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <%@page import="java.util.*, ports.models.*"%>
    <%  
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Expires","-1");
        
        String custUser = "";
            
        if(session.getAttribute("customer")!= null)
        {
            Customer c = (Customer) session.getAttribute("customer");
            custUser = (String) c.getUsername();
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
    %>
    </head>
</html>
