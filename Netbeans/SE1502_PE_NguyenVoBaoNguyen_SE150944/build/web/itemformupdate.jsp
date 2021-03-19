<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Item information</title>
    </head>
    <body>
        <h1>Update Item information</h1>
        <form action="update" method="POST">
            <table>
                <tr>
                    <td>Item code</td>
                    <td>: ${item.id}
                        <input type="text" name="txtID" value="${param.id}" hidden>
                </tr>
                <tr>
                    <td>Item Name</td>
                    <td>: <input type="text" name="txtName" value="${item.name}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td>: <input type="text" name="txtUnit" value="${item.unit}">
                        <font color="red">${requestScope.INVALID.unitError}</font></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>: <input type="number" name="txtPrice" value="${item.price}">
                        <font color="red">${requestScope.INVALID.priceError}</font></td>
                </tr>
                <tr>
                    <td>Supplying</td>
                    <td>: <input type="checkbox" name="txtSupplying" value="1">
                        <font color="red">${requestScope.INVALID.supplyingError}</font></td>
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
                    <td> <input type="submit" value="Update Item"/></td>
                </tr>

            </table>
        </form>
        <a href="loadListItem">Back to Items List</a>
    </body>
</html>
