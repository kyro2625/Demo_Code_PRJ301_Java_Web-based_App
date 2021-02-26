<%@page import="java.util.ArrayList"%>
<%@page import="BookManagement.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<Books> b = new ArrayList();
            b = (ArrayList<Books>) request.getAttribute("bObject");
//           

        %>
        <table width="900px" border="1px solid">
            <tr>
                <th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> 

            </tr>
            <%for (Books cb : b) {%>
            <tr>
                <td><%=cb.getId()%></td>
                <td><%=cb.getName()%></td>
                <td><%=cb.getAuthor()%></td>
                <td><%=cb.getPublishYear()%></td>
                <td><%=cb.getShortDes()%></td>
                <td><%=cb.getSta()%></td>
                <td><a href="BookandUserManagementServlet?action=updateform&pid=<%=cb.getId()%>">Edit</a></td>
                <td><a  onclick="return confirmation()" href="BookandUserManagementServlet?action=delete&pid=<%=cb.getId()%>">Delete</a></td>

            </tr>
            <%}%>
        </table>
        <a href="BookandUserManagementServlet">List of categories</a>
         <script>
            function confirmation() {
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
