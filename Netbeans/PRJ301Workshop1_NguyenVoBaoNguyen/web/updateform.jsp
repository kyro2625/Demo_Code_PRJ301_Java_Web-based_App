<%@page import="BookManagement.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Page</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        label {
            font-weight: bold;
            color: crimson;
        }
    </style>
</head>
<body>
<%

    Books p = new Books();
    p = (Books) request.getAttribute("pObject");
    String headerMsg = (String) request.getAttribute("msg");
    String action = (String) request.getAttribute("action");
    String name = p.getBookName();
    String auth = p.getAuthor();
    int py = p.getPublishYear();
    String sd = p.getShortDescription();
    String sta = p.getStatus();
    String cat= p.getCateID();
    String bid= p.getBookID();

%>

<h2><%= headerMsg%> </h2>
<table wwidth="600px" border="1px solid">

</table>
<table width="600px" border="0px solid" style="margin-top: 20px" class="">
    <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1" >

        <tr>
            <td> <label>Book ID:</label></td>
            <td  class="w3-input" style="background-color: #ccc"><%=bid%></td>
            <td><input type="hidden" name="id" value="<%=bid%>"/></td>
        </tr>
        <tr>
            <td> <label>Name:</label></td>
            <td><input type="text" name="name" value="<%=name%>"  class="w3-input" required/></td>
        </tr>
        <tr>
            <td> <label>Author:</label></td>
            <td><input type="text" name="author" value="<%=auth%>" class="w3-input"></td>
        </tr>
        <tr>
            <td> <label>Publish Year:</label></td>
            <td><input type="number" name="PY" value="<%=py%>" class="w3-input"></td>
        </tr>
        <tr>
            <td> <label>Description:</label></td>
            <td><textarea name="description"  class="w3-input"><%=sd%></textarea></td>
        </tr>

        <tr>
            <td> <label>Status:</label></td>
            <td><input type="text" name="sta" value="<%=sta%>"  class="w3-input"/></td>
        </tr>
        <tr>
            <td> <label>Category ID:</label></td>
            <td><input type="text" name="catID" value="<%=cat%>" class="w3-input"/></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Submit" class="btn btn-success"/>
                <input type="reset" value="Reset" class="btn btn-warning"/>
            </td>
        </tr>

    </form>
</table>
<br> <br>
<a href="BookandUserManagementServlet" class="btn btn-primary"> List of books </a>

</body>
</html>
