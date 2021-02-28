<%@page import="BookManagement.Books"%>

<%@page import="BookManagement.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of books</title>
    </head>
    <body>
        <%
            ArrayList<Categories> c = new ArrayList<Categories>();//Khời tạo
            ArrayList<Books> ldt = new ArrayList<Books>();//Khời tạo
            String n = (String) request.getAttribute("hello");
            ldt = (ArrayList<Books>) request.getAttribute("data");
            c = (ArrayList<Categories>) request.getAttribute("data2");
        %>


        <table width="900px" border="1px solid">
            <tr>
                <th>Category ID</th> <th>Short Description</th> <th>Status</th>
                <th> </th> <th> </th>
            </tr>

            <%for (Categories dt : c) {%>
            <tr>
                <td><%=dt.getCateID()%></td>
                <td><%=dt.getCateName()%></td>


            </tr>


            <%}%>
        </table>
        <a href="BookandUserManagementServlet?action=addform"> Add new book </a> <br>  <br>
        <a href="BookandUserManagementServlet?action=addCate"> Add new Category </a> <br> <br>
        <a href="BookandUserManagementServlet?action=find"> Find a book by ID   </a><br> <br>

        <script>
            function confirmation() {
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
