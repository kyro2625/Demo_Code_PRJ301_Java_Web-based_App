<%-- 
    Document   : computerform
    Created on : Mar 12, 2021, 12:11:32 AM
    Author     : nguye
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update laptop information</title>
    </head>
    <body>
        <h1>Update laptop information</h1>
        <form action="update" method="POST">
            <table>
                <tr>
                    <td>Laptop ID</td>
                    <td>: ${laptop.id}
                        <input type="text" name="txtID" value="${param.id}" hidden>
                </tr>
                <tr>
                    <td>Laptop Name</td>
                    <td>: <input type="text" name="txtName" value="${laptop.name}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Technical Information</td>
                    <td>: <input type="text" name="txtTechInfo" value="${laptop.technicalInformation}">
                        <font color="red">${requestScope.INVALID.technicalInformationError}</font></td>
                </tr>
                <tr>
                    <td>Year of Manufacture (1900-2099)</td>
                    <td>: <input type="number" name="txtYearOfManu" value="${laptop.yearOfManufacture}">
                        <font color="red">${requestScope.INVALID.yearofManufactureError}</font></td>
                </tr>
                <tr>
                    <td>Producer</td>
                    <td>: <input type="text" name="txtProducer" value="${laptop.producer}">
                        <font color="red">${requestScope.INVALID.producerError}</font></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>: <input type="text" name="txtStatus" value="${laptop.status}">
                        <font color="red">${requestScope.INVALID.statusError}</font></td>
                </tr>
                <tr>
                    <td>Supplier</td>
                    <td>: <select name="cboSupplier">
                            <c:forEach items="${requestScope.listSuppliers}" var="dto">
                                <c:if test="${laptop.supplier.id == dto.id}">                             
                                    <option value="${dto.id} - ${dto.name}" selected="true"> ${dto.id} - ${dto.name}</option>
                                </c:if>
                                <option value="${dto.id} - ${dto.name}"> ${dto.id} - ${dto.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> <input type="submit" value="Update"/></td>
                    <td> <input type="reset" value="Reset"/></td>

                </tr>

            </table>
        </form>
        <a href="loadListComputer">Back to Suppliers List</a>
    </body>
</html>
