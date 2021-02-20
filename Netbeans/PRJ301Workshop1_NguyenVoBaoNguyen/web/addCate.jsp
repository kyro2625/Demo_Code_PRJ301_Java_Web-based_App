<%@page import="BookManagement.Categories"%>

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
           Categories p= (Categories) request.getAttribute("cObject");
           String headerMsg = (String) request.getAttribute("msg");
           String action = (String) request.getAttribute("action");
        %>
        
        <h2><%= headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr> 
                    <td>Category ID </td> 
                    <td>: <input type="text" name="cateid" value=""/></td> 
                </tr>
                <tr> 
                    <td>Category Name </td> 
                    <td>: <input type="text" name="catename" value="" /></td> 
                </tr>
                
                    <td>Description </td> 
                    <td>: <textarea name="des"></textarea></td> 
                </tr>
           
                    <td colspan="2" align="center"> 
                        <input type="submit" value="Submit" /> 
                        <input type="reset" value="Reset" />
                    </td> 
                </tr>
               
            </form>
        </table>
        <br> <br>
        <a href="BookandUserManagementServlet"> List of products </a>

    </body>
</html>
