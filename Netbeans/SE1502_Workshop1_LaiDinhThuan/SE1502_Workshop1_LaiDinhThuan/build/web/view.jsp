
<%@page import="BookManagement.Categories"%>
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
            ArrayList<Categories> c = new ArrayList<Categories>();//Khời tạo
            ArrayList<Books> ldt = new ArrayList<Books>();//Khời tạo
            String n = (String) request.getAttribute("hello");
            ldt = (ArrayList<Books>) request.getAttribute("data");
            c = (ArrayList<Categories>) request.getAttribute("data2");
        %>

        <h2>Welcome to Thuận's page</h2>
        <table width="900px" border="1px solid">
            <!--            <tr>
                            <th>Category Name</th><th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> 
                            <th> </th> <th> </th>
                        </tr>-->
            <tr>
                <td>
                    Categories
                </td>
                <%for (Categories dt : c) {%>


                <td>
                  <a href="BookandUserManagementServlet?action=find&cid=<%=dt.getCateID()%>"><%=dt.getName()%></a> <br>  <br>
                </td>

                     

                <%}%> 
            </tr>
        </table>
        <a href="BookandUserManagementServlet?action=addform"> Add new book </a> <br>  <br>

     

       
    </body>
</html>
