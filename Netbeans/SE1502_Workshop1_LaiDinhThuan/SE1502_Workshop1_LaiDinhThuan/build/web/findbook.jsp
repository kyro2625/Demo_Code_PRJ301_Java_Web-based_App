<%-- 
    Document   : findbook
    Created on : Feb 17, 2021, 11:20:04 AM
    Author     : Baby Bear
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find Book</title>
    </head>
    <body>
        <%String n = (String) request.getAttribute("msg"); %>
        <h3><%=n%></h3><br>
        <form action="BookandUserManagementServlet?action=search" method="POST" name="s">
            <input type="number" name="bid" value="">
            <input type="submit" value="Find">
        </form>
    </body>
</html>
