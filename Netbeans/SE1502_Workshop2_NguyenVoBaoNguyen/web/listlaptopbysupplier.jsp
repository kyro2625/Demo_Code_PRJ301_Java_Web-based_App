<%--
    Document   : listlaptopbysupplier
    Created on : Mar 14, 2021, 2:55:18 PM
    Author     : nguye
--%>

<%@page import="dtos.SuppliersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.LaptopDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laptop List By Supplier Page</title>
    </head>
    <body>
        <h1> Supplier: ${requestScope.Supplier}</h1>


        <c:if test="${requestScope.listLaptops!=null}">
            <c:if test="${not empty requestScope.listLaptops}" var="testEmpty">
                <table border="1">
                    <thead>
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
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listLaptops}" var="dto">
                        <form action="loadBySupplierName" method="POST">
                            <tr>
                                <td>${dto.id}</td>
                                <td>${dto.name}</td>
                                <td>${dto.technicalInformation}</td>
                                <td>${dto.yearOfManufacture}</td>
                                <td>${dto.producer}</td>
                                <td>${dto.status}</td>
                                <c:url value="loadByID" var="updateLink">
                                    <c:param name="id" value="${dto.id}"/>
                                </c:url>
                                <td><a href="${updateLink}">Update</a> </td>

                                <c:url value="delete" var="deleteLink">
                                    <c:param name="id" value="${dto.id}"/>
                                </c:url>
                                <td><a onclick="return confirmation()" href="${deleteLink}">Delete</a> </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No Laptop here. Create new one below here</h2>
        </c:if>
    </c:if>
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
