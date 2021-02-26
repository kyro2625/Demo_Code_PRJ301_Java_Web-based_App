<%-- 
    Document   : greet
    Created on : Feb 15, 2021, 11:21:37 PM
    Author     : Baby Bear
--%>
<%
    String name = (String)request.getAttribute("name");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Greeting Page</title>
    </head>
    <body>
        <h1>Hello <%=name%></h1>
        <a href="BookandUserManagementServlet">List of categories</a>
    </body>
</html>
