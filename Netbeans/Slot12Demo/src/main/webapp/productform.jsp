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
           Product p = (Product) request.getAttribute("pObject");
           String headerMsg = (String) request.getAttribute("msg");
           String action =  (String) request.getAttribute("action");
        %>
        
        <h2> <%=headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="ProductManagementServlet" method="POST" name="f1">
                <input type="text" name ="action" value="<%=action%>">
                <tr> 
                    <td>Product ID </td> 
                    <td>: <input type="text" name="id" value="<%=p.getId()%>"/></td> 
                </tr>
                <tr> 
                    <td>Name </td> 
                    <td>: <input type="text" name="name" value="<%=p.getName()%>" /></td> 
                </tr>
                <tr> 
                    <td>Description </td> 
                    <td>: <textarea name="description"><%=p.getDescription()%></textarea></td> 
                </tr>
                <tr> 
                    <td>Quantity </td> 
                    <td>: <input type="text" name="quantity" size="10" value="<%=p.getQuantity()%>" /></td> 
                </tr>
                <tr> 
                    <td>Price</td> 
                    <td>: <input type="text" name="price" size="15" value="<%=p.getPrice()%>" /></td> 
                </tr>
                <tr> 
                    <td>Image URL </td> 
                    <td>: <input type="text" name="url" value="<%=p.getImgURL()%>" /></td> 
                </tr>
                <tr> 
                    <td colspan="2" align="center"> 
                        <input type="submit" value="<%=action%>" /> 
                        <input type="reset" value="Reset" />
                    </td> 
                </tr>
               
            </form>
        </table>
        <br> <br>
        <a href="ProductManagementServlet"> List of products </a>

    </body>
</html>
