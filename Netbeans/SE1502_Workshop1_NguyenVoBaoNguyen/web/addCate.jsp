<%@page import="BookManagement.Categories"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
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
            Categories p = (Categories) request.getAttribute("cObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
        %>

        <h2><%= headerMsg%> </h2>
        <br>

        <table width="600px" border="0px solid">
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr> 
                    <td><label>Category ID:</label></td> 
                    <td> <input type="text" name="cateid" value="" class="w3-input"/></td> 
                </tr>
                <tr> 
                    <td><label>Category Name:</label></td> 
                    <td> <input type="text" name="catename" value=""  class="w3-input"/></td> 
                </tr>

                <td><label>Description:</label> </td> 
                <td> <textarea name="des" class="w3-input"></textarea></td> 
                </tr>

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