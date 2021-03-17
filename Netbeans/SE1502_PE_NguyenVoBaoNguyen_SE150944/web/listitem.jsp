<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
        <p style="display: inline-block">Welcome, ${sessionScope.Welcome} ||</p>
        <c:url value="logout" var="logoutLink" />
        <a href="${logoutLink}">Logout</a>
        <h1>LIST ALL OF ITEMS</h1>

        <c:if test="${requestScope.listItems!=null}">
            <c:if test="${not empty requestScope.listItems}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>ITEM CODE</th>
                            <th>ITEM NAME</th>
                            <th>UNIT</th>
                            <th>PRICE</th>
                            <th>SUPPLYING</th>
                            <th>SUPPLIER NAME</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listItems}" var="dto">
                        <form action="loadBySupplierName" method="POST">
                            <tr>
                                <td>${dto.id}</td>
                                <td>${dto.name}</td>
                                <td>${dto.unit}</td>
                                <td>${dto.price}</td>
                                <td>${dto.supplying}</td>
                                <td>${dto.supplier.name}</td>
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
            <h2>No Item here. Create new one below here</h2>
        </c:if>
    </c:if>
    <br> <br>
    <c:url value="addNew" var="addNew" />
    <h3> <a href="${addNew}">Add new Item</a> </h3>
    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
    </script>

</body>
</html>
