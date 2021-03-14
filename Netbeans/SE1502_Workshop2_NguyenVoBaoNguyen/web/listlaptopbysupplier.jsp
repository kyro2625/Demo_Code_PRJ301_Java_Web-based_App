<%-- 
    Document   : listlaptopbysupplier
    Created on : Mar 14, 2021, 2:55:18 PM
    Author     : nguye
--%>

<%@page import="dtos.SuppliersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.LaptopDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laptop List</title>
    </head>
    <body>

        <%  ArrayList<LaptopDTO> b = new ArrayList();
            b = (ArrayList<LaptopDTO>) request.getAttribute("listLaptops");
            String n = (String) request.getAttribute("Supplier");

        %>
        <h1> Supplier: <%=n%></h1>
        <table  border="1">
            <tr>
                <th>LAPTOP ID</th>
                <th>LAPTOP NAME</th>
                <th>TECHNICAL INFORMATION</th>
                <th>YEAR OF MANUFACTURE</th>
                <th>PRODUCER</th>
                <th>LAPTOP STATUS</th>
                <th></th>
                <th></th>
            </tr>
            <%if (b.isEmpty() == false) {%>
            <%for (LaptopDTO cb : b) {%>
            <tr>
                <td><%=cb.getId()%></td>
                <td><%=cb.getName()%></td>
                <td><%=cb.getTechnicalInformation()%></td>
                <td><%=cb.getYearOfManufacture()%></td>
                <td><%=cb.getProducer()%></td>
                <td><%=cb.getStatus()%></td>
                <td><a href="loadByID?id=<%=cb.getId()%>">Update</a></td>
                <td><a  onclick="return confirmation()" href="delete?id=<%=cb.getId()%>">Delete</a></td>


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
        <br> <br>
    <h3> <a href="addNew">Create new laptop</a> </h3>
    <br> <br>

    <a href="loadListComputer">Back to Supplier List</a>
    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
    </script>
</body>
</html>
