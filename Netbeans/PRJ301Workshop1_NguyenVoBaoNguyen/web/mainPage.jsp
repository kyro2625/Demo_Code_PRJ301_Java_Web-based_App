<%@page import="UserManagement.User"%>
<%@page import="BookManagement.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of books</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            ArrayList<Books> ldt = new ArrayList<Books>();//Khời tạo
            String n = (String) request.getAttribute("names");
            ldt = (ArrayList<Books>) request.getAttribute("data");%>
        <h2>Welcome to <%=n%>'s page</h2>
        <table width="900px"  class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Category Name</th><th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> 
                    <th> </th> <th> </th>
                </tr>
            </thead>
            <%for (Books dt : ldt) {%>
            <tr>
                <td><%=dt.getCateID()%></td>
                <td><%=dt.getBookID()%></td>
                <td><%=dt.getBookName()%></td>
                <td><%=dt.getAuthor()%></td>
                <td><%=dt.getPublishYear()%></td>
                <td><%=dt.getShortDescription()%></td>
                <td><%=dt.getStatus()%></td>


                <td><a href="BookandUserManagementServlet?action=updateform&pid=<%=dt.getBookID()%>" class="btn btn-primary">Edit</a></td>
                <td><a  onclick="return confirmation()" href="BookandUserManagementServlet?action=delete&pid=<%=dt.getBookID()%>" class="btn btn-primary">Delete</a></td>

            </tr>


            <%}%> 
        </table>
        <div class="btn-group-vertical">
            <a href="BookandUserManagementServlet?action=addform" class="btn btn-primary""> Add new book </a> 
            <a href="BookandUserManagementServlet?action=addCate" class="btn btn-primary"> Add new Category </a> 
            <a href="BookandUserManagementServlet?action=find" class="btn btn-info"> Find a book by ID </a> 

        </div>

        <script>
            function confirmation() {
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
