<%@page import="BookManagement.Books" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%-- --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
            String cat = p.getCateID();
            String bid = p.getBookID();

        %>

        <table width="600px" border="0px solid" style="margin-top: 20px" >
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">

                <tr>
                    <td><label>Book ID:</label></td>
                    <td><input class="w3-input" type="text" disabled="" name="id" value="<%=bid%>"/></td>
                </tr>
                <tr>
                    <td><label>Name:</label></td>
                    <td><input class="w3-input" type="text" name="name" value="<%=name%>" /></td>
                </tr>
                <tr>
                    <td><label>Author:</label></td>
                    <td>
                        <input class="w3-input" type="text" name="author" value="<%=auth%>">
                    </td>
                </tr>
                <tr>
                    <td><label>Publish Year:</label></td>
                    <td><input class="w3-input" type="text" name="PY" value="<%=py%>"></td>
                </tr>
                <tr>
                    <td><label>Description:</label></td>
                    <td> <textarea class="w3-input" name="description"><%=sd%></textarea></td>
                </tr>

                <tr>
                    <td><label>Status:</label></td>
                    <td><select class="form-control" id="sel1" name="sta">
                            <option value="<%=sta%>" selected hidden><%=sta%></option>
                            <option value="Available">Available</option>
                            <option value="Not Available">Not Available</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Category ID:</label></td>
                    <td><input class="w3-input" type="text" name="catID" value="<%=cat%>"></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="btn btn-primary" value="Submit" />
                        <input type="reset" class="btn btn-primary" value="Reset" />
                    </td>
                </tr>

            </form>
        </table>
        <br> <br>   



        <a href="BookandUserManagementServlet"> List of products </a>

    </body>
</html>
