<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Item</title>
    </head>
    <body>
        <h1>Add new item information</h1>
        <form action="create" method="POST">
            <table>
                <tr>
                    <td>Item Code</td>
                    <td>: <input type="text" name="txtID" value="${param.txtID}">
                        <font color="red">${requestScope.INVALID.idError}</font></td>
                </tr>
                <tr>
                    <td>Item Name</td>
                    <td>: <input type="text" name="txtName" value="${param.txtName}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td>: <input type="text" name="txtUnit" value="${param.txtUnit}">
                        <font color="red">${requestScope.INVALID.unitError}</font></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>: <input type="number" name="txtPrice" value="${param.txtPrice}">
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

        <a href="loadListItem">Back to Items List</a>
    </body>
</html>
