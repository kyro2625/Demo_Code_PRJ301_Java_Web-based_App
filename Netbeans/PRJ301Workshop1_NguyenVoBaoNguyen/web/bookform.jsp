<%@page import="BookManagement.Books"%>

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
            Books p = (Books) request.getAttribute("pObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
        %>

        <h2><%= headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr> 
                    <td>Book ID:</td> 
                    <td><input type="text" name="id" value=""/></td> 
                </tr>
                <tr> 
                    <td>Name:</td> 
                    <td><input type="text" name="name" value="" /></td> 
                </tr>
                <tr>
                    <td>Author:</td>
                    <td><input type="text" name="author" value=""></td>
                </tr>
                <tr>
                    <td>Publish Year:</td>
                    <td><input type="text" name="PY" value=""</td>
                </tr>
                <tr> 
                    <td>Description:</td> 
                    <td><textarea name="description"></textarea></td> 
                </tr>

                <tr> 
                    <td>Status:</td> 
                    <td>
                        <select name="sta">
                            <option value="Available">Available</option>
                            <option value="Not Available">Not Available</option>
                        </select>
                    </td> 
                </tr>
                <tr> 
                    <td>Category ID:</td> 
                    <td><input type="text" name="catID" value="" /></td> 
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
        <a href="BookandUserManagementServlet"> List of products </a>

    </body>
</html>
