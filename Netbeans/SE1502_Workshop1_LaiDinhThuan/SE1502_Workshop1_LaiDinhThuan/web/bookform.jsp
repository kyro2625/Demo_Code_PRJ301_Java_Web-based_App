<%@page import="BookManagement.Books"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <%
            Books p = (Books) request.getAttribute("pObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
        %>

        <h2><%= headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="BookandUserManagementServlet?action=<%=action%>" method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr> 
                    <td>Book ID:</td> 
                    <td><input type="text" name="id" value=""/></td> 
                </tr>
                <tr> 
                    <td>Name:</td> 
                    <td><input type="text" name="name" value="" /></td> 
                </tr>
                <tr>
                    <td>Author:</td>
                    <td><input type="text" name="author" value=""></td>
                </tr>
                <tr>
                    <td>Publish Year:</td>
                    <td>
                        <select name="PY">
                            <option value="1990">1990</option>
                            <option value="1991">1991</option>
                            <option value="1992">1992</option>
                            <option value="1993">1993</option>
                            <option value="1994">1994</option>
                            <option value="1995">1995</option>
                            <option value="1996">1996</option>
                            <option value="1997">1997</option>
                            <option value="1998">1998</option>
                            <option value="1999">1999</option>
                            <option value="2000">2000</option>
                            <option value="2001">2001</option>
                            <option value="2002">2002</option>
                            <option value="2003">2003</option>
                            <option value="2004">2004</option>
                            <option value="2005">2005</option>
                            <option value="2006">2006</option>
                            <option value="2007">2007</option>
                            <option value="2008">2008</option>
                            <option value="2009">2009</option>
                            <option value="2010">2010</option>
                            <option value="2011">2011</option>
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td>Description:</td> 
                    <td><textarea name="description"></textarea></td> 
                </tr>

                <tr> 
                    <td>Status:</td> 
                    <td>
                        <select name="sta">
                            <option value="Avail">Available</option>
                            <option value="NoAvail">Not Available</option>
                        </select>
                    </td> 
                </tr>
                <tr> 
                    <td>Category ID:</td> 
                    <td><input type="text" name="catID" value="" /></td> 
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
