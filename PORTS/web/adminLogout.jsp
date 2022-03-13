<%-- 
    Document   : adminLogout
    Created on : 03 14, 22, 2:56:18 AM
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
        
        String navUser = "";
            
        if(session.getAttribute("employee")!= null)
        {
            Employee e = (Employee) session.getAttribute("employee");
            navUser = (String) e.getUsername();
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
    %>
    </head>
</html>
