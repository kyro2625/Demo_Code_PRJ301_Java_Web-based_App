
<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.LoginBean" %>
<jsp:useBean id="loginObj" class="beans.LoginBean" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome <jsp:getProperty name="loginObj" property="userName" /> </h1>
        
        <h1>Welcome 1 <%= ((LoginBean) session.getAttribute("loginObj")).getUserName() %> </h1>
        
        <h1> ${ loginObj.userName } </h1>
    </body>
</html>
