<%@page import="UserManagerment.User"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <%
           User u= (User) request.getAttribute("pObject");
           String headerMsg = (String) request.getAttribute("msg");
           String action = (String) request.getAttribute("action");
        %>
        
        <h2><%= headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr>
                    <td>User name:</td>
                    <td><input type="text" name="uname" value=""></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="pass" ></td>
                </tr>
                <tr> 
                    <td colspan="2" align="center"> 
                        <input type="submit" value="Submit" /> 
                        <input type="reset" value="Reset" />
                    </td> 
                </tr>
               
            </form>
        </table>
        <br> <br>
        

    </body>
</html>
