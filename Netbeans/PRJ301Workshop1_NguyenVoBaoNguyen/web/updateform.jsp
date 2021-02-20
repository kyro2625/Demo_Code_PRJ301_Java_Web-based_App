<%@page import="BookManagement.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
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
        <table width="600px" border="0px solid" style="margin-top: 20px">
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">
              
                <tr> 
                    <td>Book ID:</td> 
                    <td><%=bid%></td>
                    <td><input type="hidden" name="id" value="<%=bid%>"/></td> 
                </tr>
                <tr> 
                    <td>Name:</td> 
                    <td><input type="text" name="name" value="<%=name%>" /></td> 
                </tr>
                <tr>
                    <td>Author:</td>
                    <td><input type="text" name="author" value="<%=auth%>"></td>
                </tr>
                <tr>
                    <td>Publish Year:</td>
                    <td><input type="text" name="PY" value="<%=py%>"</td>
                </tr>
                <tr> 
                    <td>Description:</td> 
                    <td><textarea name="description" ><%=sd%></textarea></td> 
                </tr>

                <tr> 
                    <td>Status:</td> 
                    <td><input type="text" name="sta"value="<%=sta%>" /></td> 
                </tr>
                <tr> 
                    <td>Category ID: </td> 
                    <td><input type="text" name="catID"value="<%=cat%>" /></td> 
                </tr>
              
                <tr> 
                    <td colspan="2" align="center"> 
                        <input type="submit" value="Submit" /> 
                        <input type="reset" value="Reset" />
                    </td> 
                </tr>

            </form>
        </table>
        <br> <br>
        <a href="BookandUserManagementServlet"> List of products </a>

    </body>
</html>
