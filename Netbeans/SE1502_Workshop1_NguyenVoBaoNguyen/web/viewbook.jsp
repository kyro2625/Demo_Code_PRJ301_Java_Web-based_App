<%@page import="BookManagement.Books"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

    </head>
    <body>
        <%  ArrayList<Books> b = new ArrayList();
            b = (ArrayList<Books>) request.getAttribute("bObject");
            String n = (String) request.getAttribute("cname");

        %>
        <h1>Category: <%=n%></h1>

        <table width="900px" border="1px solid" class="table table-striped table-bordered table-hover">
            <tr>
                <th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th>
                <th> </th> <th> </th>

            </tr>
            <%if (b.isEmpty() == false) {%>
            <%for (Books cb : b) {%>
            <tr>
                <td><%=cb.getBookID()%></td>
                <td><%=cb.getBookName()%></td>
                <td><%=cb.getAuthor()%></td>
                <td><%=cb.getPublishYear()%></td>
                <td><%=cb.getShortDescription()%></td>
                <td><%=cb.getStatus()%></td>
                <td><a href="BookandUserManagementServlet?action=updateform&pid=<%=cb.getBookID()%>" class="btn btn-primary">Edit</a></td>
                <td><a  onclick="return confirmation()" href="BookandUserManagementServlet?action=delete&pid=<%=cb.getBookID()%>" class="btn btn-primary">Delete</a></td>

            </tr>
            <%}%>
            <%}%>
            <%if (b.isEmpty() == true) {%>
            <td>No information</td>
            <td>No information</td>
            <td>No information</td>
            <td>No information</td>
            <td>No information</td>
            <td>No information</td>

            <%}%>
        </table>
        <a href="BookandUserManagementServlet?action=mainPage" class="btn btn-primary">List of book</a>
        <script>
            function confirmation() {
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
