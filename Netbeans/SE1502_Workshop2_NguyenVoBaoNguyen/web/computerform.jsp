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
        <title>Create a new laptop</title>
    </head>
    <body>
        <h1>Add new laptop information</h1>
        <form action="create" method="POST">
            <table>
                <tr>
                    <td>Laptop ID</td>
                    <td>: <input type="text" name="txtID" value="${param.txtID}">
                        <font color="red">${requestScope.INVALID.idError}</font></td>
                </tr>
                <tr>
                    <td>Laptop Name</td>
                    <td>: <input type="text" name="txtName" value="${param.txtName}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Technical Information</td>
                    <td>: <input type="text" name="txtTechInfo" value="${param.txtTechInfo}">
                        <font color="red">${requestScope.INVALID.technicalInformationError}</font></td>
                </tr>
                <tr>
                    <td>Year of Manufacture (1900-2099)</td>
                    <td>: <input type="number" name="txtYearOfManu" value="${param.txtYearOfManu}">
                        <font color="red">${requestScope.INVALID.yearofManufactureError}</font></td>
                </tr>
                <tr>
                    <td>Producer</td>
                    <td>: <input type="text" name="txtProducer" value="${param.txtProducer}">
                        <font color="red">${requestScope.INVALID.producerError}</font></td>
                </tr>
                <tr>
                    <td>Laptop Status</td>
                    <td>: <input type="text" name="txtStatus" value="${param.txtStatus}">
                        <font color="red">${requestScope.INVALID.statusError}</font></td>
                </tr>
                <tr>
                    <td>Supplier</td>
                    <td>: <select name="cboSupplier">
                            
                            <c:forEach items="${requestScope.listSuppliers}" var="dto">
                            <option value="${dto.id} - ${dto.name}"> ${dto.id} - ${dto.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"> <input type="submit" value="Create"/></td>
                </tr>

            </table>
        </form>
                <br> <br>
                
                <a href="loadListComputer">Back to Suppliers List</a>
    </body>
</html>
