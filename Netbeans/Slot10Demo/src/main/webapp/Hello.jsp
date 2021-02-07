<%@ page import="java.lang.*" %>
<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 25-Jan-21
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" content="text/html" http-equiv="Content-Type">
    <title>Calculator</title>
</head>
<body>
    <h1>Hello World</h1>
    <!-- HTML Comment-->
    <%-- Comment of JSP element --%>
    <%! String name ="Van"; %>
    <%!
        int calculateTotal(int a, int b) {
            return a+b;
        }
    %>
    <h1>Hello <%=name%></h1>
    <h1>Total 5+3 = <%= calculateTotal(5,3)%></h1>
    <%
        String n = request.getParameter("name");
        String ua = application.getInitParameter("useradmin");

        out.println("<h1> Hello From Scriptlet: "  + n + ".Variable from web.xml " + ua +"</h1>");
       
    %>
</body>
</html>
