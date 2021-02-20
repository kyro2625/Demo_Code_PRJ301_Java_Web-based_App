<%-- 
    Document   : greet
    Created on : Feb 10, 2021, 11:21:37 PM
    Author     : Kyro
--%>
<%@page import="UserManagement.User" %>
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
        <a href="BookandUserManagementServlet">List of book</a>
    </body>
</html>
