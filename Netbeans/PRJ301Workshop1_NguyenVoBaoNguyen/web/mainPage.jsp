
<%@page import="BookManagement.Books"%>
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
            ArrayList<Books> ldt = new ArrayList<Books>();//Khời tạo
            String n = (String) request.getAttribute("hello");
             ldt = (ArrayList<Books>) request.getAttribute("data");%>

        <h2>Welcome to Nguyên's page</h2>
        <table width="900px" border="1px solid">
            <tr>
                <th>Category Name</th><th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> 
                <th> </th> <th> </th>
            </tr>

            <%for (Books dt : ldt) {%>
            <tr>
                <td><%=dt.getCateID()%></td>
                <td><%=dt.getBookID()%></td>
                <td><%=dt.getBookName()%></td>
                <td><%=dt.getAuthor()%></td>
                <td><%=dt.getPublishYear()%></td>
                <td><%=dt.getShortDescription()%></td>
                <td><%=dt.getStatus()%></td>


                <td><a href="BookandUserManagementServlet?action=updateform&pid=<%=dt.getBookID()%>">Edit</a></td>
                <td><a  onclick="return confirmation()" href="BookandUserManagementServlet?action=delete&pid=<%=dt.getBookID()%>">Delete</a></td>

            </tr>


            <%}%> 
        </table>
        <a href="BookandUserManagementServlet?action=addform"> Add new book </a> <br>  <br>
        <a href="BookandUserManagementServlet?action=addCate"> Add new Category </a> <br> <br>
        <a href="BookandUserManagementServlet?action=find"> Find a book by ID   </a><br> <br>
        
        <script>
            function confirmation(){
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
