<%-- 
    Document   : second
    Created on : Jan 27, 2021, 3:04:30 PM
    Author     : Kyro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Second</h1>
        <% String u = request.getParameter("user"); %>
        <%= u%>
    </body>
</html>
