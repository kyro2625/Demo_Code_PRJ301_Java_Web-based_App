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
        <h1>Laptop Management</h1>

        <c:if test="${requestScope.listSuppliers!=null}">
            <c:if test="${not empty requestScope.listSuppliers}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>SUPPLIER ID</th>
                            <th>SUPPLIER NAME</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listSuppliers}" var="dto1">
                        <form action="loadBySupplierName" method="POST">
                            <tr>
                                <td>${dto1.id}</td>
                                <c:url value="loadBySupplierName" var="loadBySupplierNameLink">
                                    <c:param name="id" value="${dto1.id}"/>
                                </c:url>
                                <td><a href="${loadBySupplierNameLink}">${dto1.name}</a> </td>


                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No Laptop here. Add one below here</h2>
        </c:if>
    </c:if>

    <br> <br>
    <c:url value="addNew" var="addNew" />
    <h3> <a href="${addNew}">Create new laptop</a> </h3>
    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
    </script>

</body>
</html>
