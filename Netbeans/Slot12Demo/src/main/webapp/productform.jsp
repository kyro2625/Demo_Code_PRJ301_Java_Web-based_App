<%@page import="java.util.ArrayList"%> 
<%@page import="entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           Product p= (Product) request.getAttribute("pObject");
           String headerMsg = (String) request.getAttribute("msg");
           String action = (String) request.getAttribute("action");
        %>
        
        <h2><%=headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="ProductManagementServlet?action=<%=action%>"method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr> 
                    <td>Product ID </td> 
                    <td>: <input type="text" name="id" value=""/></td> 
                </tr>
                <tr> 
                    <td>Name </td> 
                    <td>: <input type="text" name="name" value="" /></td> 
                </tr>
                <tr> 
                    <td>Description </td> 
                    <td>: <textarea name="description"></textarea></td> 
                </tr>
                <tr> 
                    <td>Quantity </td> 
                    <td>: <input type="text" name="quantity" size="10" value="" /></td> 
                </tr>
                <tr> 
                    <td>Price</td> 
                    <td>: <input type="text" name="price" size="15" value="" /></td> 
                </tr>
                <tr> 
                    <td>Image URL </td> 
                    <td>: <input type="text" name="url" value="" /></td> 
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
        <a href="ProductManagementServlet"> List of products </a>

    </body>
</html>
