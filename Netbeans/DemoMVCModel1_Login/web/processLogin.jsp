
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="loginObj" class="beans.LoginBean" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String u = request.getParameter("txtUsername");
            String p = request.getParameter("txtPassword");
        %>  
        
        <jsp:setProperty name="loginObj" property="userName" value="<%= u %>" />
        <jsp:setProperty name="loginObj" property="userPassword" value="<%= p %>" /> 
        
        <% 
            if (loginObj.checkLogin(u, p))
                response.sendRedirect("welcome.jsp");
            else
                out.print("Error!");
            
        %>
        
    </body>
</html>
