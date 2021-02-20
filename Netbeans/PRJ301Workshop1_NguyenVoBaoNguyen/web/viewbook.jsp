<%@page import="BookManagement.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        <% Books b = new Books();
            b = (Books) request.getAttribute("bObject");
            String id = b.getBookID();
            String name = b.getBookName();
            String au = b.getAuthor();
            String des = b.getShortDescription();
            int y = b.getPublishYear();
            String sta = b.getStatus();

        %>
        <table width="900px" border="1px solid">
            <tr>
                <th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> 

            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=name%></td>
                <td><%=au%></td>
                <td><%=y%></td>
                <td><%=des%></td>
                <td><%=sta%></td>
            </tr>
        </table>
        <a href="BookandUserManagementServlet">List of book</a>
    </body>
</html>
