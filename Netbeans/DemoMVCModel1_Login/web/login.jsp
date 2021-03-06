<%-- 
    Document   : login.jsp
    Created on : Mar 6, 2021, 1:20:19 PM
    Author     : Van Vo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Login Form</h1>
        <form action="processLogin.jsp" method="POST" name="loginform">
            <table>
                <tr> <td>User name </td> <td>: <input type="text" name="txtUsername" /></td> </tr>
                <tr> <td>Password </td> <td>: <input type="password" name="txtPassword" /></td> </tr>
                <tr> <td colspan="2"> <input type="submit" value="Login" /></td> </tr>
            </table>
        </form>
    </body>
</html>
