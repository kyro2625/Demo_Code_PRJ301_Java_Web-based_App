
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head> <title>Giảng viên - Đề tài</title></head>
    <body>
        <sql:setDataSource var="snapshot" user="sa" password="123456789"
                           driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url="jdbc:sqlserver://localhost:1433;databaseName=QuanLyGiangVienDeTai" />

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from GIANGVIEN;
        </sql:query>
        <table border="1" width="100%">
            <tr> <th>Faculty ID</th><th>Full Name</th><th>Research Area</th> <th>Telephone Number</th></tr>
                    <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.MaGV}" /></td>

                    <td><c:out value="${row.TENGV}" />
                        <br/><u><i>Danh sách đề tài:</i></u>
                            <sql:query	dataSource="${snapshot}" var="detaigv">
                            SELECT * from DETAI WHERE MAGV=?;
                            <sql:param value="${row.MaGV}" />
                        </sql:query>
                        <ul>
                            <c:forEach var="rowdt" items="${detaigv.rows}">
                                <li><c:out value="${rowdt.TENDT}" /></li>
                                </c:forEach>
                        </ul>
                    </td>
                    <td><c:out value="${row.LINHVUCNGHIENCUU}" /></td>
                    <td><c:out value="${row.SODIENTHOAI}" /></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>


<!--
<sql:setDataSource var="snapshot" user="sa" password="123456789"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=QuanLyGiangVienDeTai" />

<sql:update dataSource = "${snapshot}" var = "result">
    INSERT INTO GIANGVIEN VALUES ('GV104', 'Thanh Van', 'Lĩnh vực', '0011223344');
</sql:update>


<sql:setDataSource var="snapshot" user="sa" password="123456789"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=QuanLyGiangVienDeTai" />
<c:set var = "gvId" value = "GV104"/>

<sql:update dataSource = "${snapshot}" var = "count">
  DELETE FROM GIANGVIEN WHERE MAGV = ?
    <sql:param value = "${gvId}" />
</sql:update>

<sql:setDataSource var="snapshot" user="sa" password="123456789"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=QuanLyGiangVienDeTai" />
<c:set var = "gvId" value = "GV104"/>
<sql:update dataSource = "${snapshot}" var = "count">
   UPDATE GIANGVIEN SET TENGV = 'Van' WHERE MAGV=?;
    <sql:param value = "${gvId}" />
</sql:update>

-->

