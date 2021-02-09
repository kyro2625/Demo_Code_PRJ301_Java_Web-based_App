<%-- 
    Document   : first
    Created on : Jan 27, 2021, 3:05:55 PM
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
        <h1>First</h1>
        <%@include file="Footer.jsp" %>
        <jsp:forward page="second.jsp">
            <jsp:param name="user" value="Admin"/>
            <jsp:param name="gender" value="Male" />
        </jsp:forward>
    </body>
</html>
