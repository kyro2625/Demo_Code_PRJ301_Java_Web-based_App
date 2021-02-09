
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- import here --%>
<%@page import="java.util.ArrayList"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of products</title>
    </head>
    <body>
        <h2>List of products</h2>
        <a href="ProductManagementServlet?action=addform"> Add new Product </a> <br> <br> 
         <table width="600px" border="1px solid">
            <tr>
                <th>Product ID </th> <th>Name </th>  <th>Description </th><th>Quantity </th> <th>Price </th>
                <th>Image URL </th>
                <th> </th> <th> </th>
            </tr>
            <%  
                // Insert Code here

            %> 
        </table>
    </body>
</html>
