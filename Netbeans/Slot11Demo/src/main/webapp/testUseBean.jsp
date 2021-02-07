<%-- 
    Document   : testUseBean
    Created on : Jan 27, 2021, 3:20:34 PM
    Author     : Kyro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean class="Beans.Employee" id="emp" scope="request"/>
<jsp:setProperty name="emp" property="*"/>
<%@page import="Beans.Employee" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
            Employee e = new Employee();
            e.setEmpName("Nguyen");
            
        %>
        <%= e.getEmpName() %>
        <jsp:setProperty name="emp" property="empNo" value="kjasshwd"/>
        
        <h2><jsp:getProperty name="emp" property="empNo" /> </h2>
        
    </body>
</html>
