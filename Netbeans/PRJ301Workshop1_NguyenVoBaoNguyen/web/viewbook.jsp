<%@page import="BookManagement.Books"%>
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
        <% Books b = new Books();
            b = (Books) request.getAttribute("bObject");
            String id = b.getBookID();
            String name = b.getBookName();
            String au = b.getAuthor();
            String des = b.getShortDescription();
            int y = b.getPublishYear();
            String sta = b.getStatus();
            String cat = b.getCateID();

        %>
        <table width="900px" border="1px solid" class="table table-striped table-bordered table-hover">
            <tr>
                <th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> <th>Category ID</th>

            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=name%></td>
                <td><%=au%></td>
                <td><%=y%></td>
                <td><%=des%></td>
                <td><%=sta%></td>
                <td><%=cat%></td>

            </tr>
        </table>
        <a href="BookandUserManagementServlet" class="btn btn-primary">List of book</a>
    </body>
</html>
