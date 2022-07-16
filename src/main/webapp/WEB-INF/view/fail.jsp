<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/5/2
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
<div>
<%--    <form action="${pageContext.request.contextPath}/Admin/download" method="post">--%>
<%--        <input type="text" name="filename" />--%>
<%--        <input type="submit" value="下载">--%>
<%--    </form>--%>
    <table align="center" width="40%" border="1" cellspacing="1" cellpadding="2">
        <tr>
            <th>下载</th>
        </tr>
        <c:forEach var="file" items="${requestScope.filelist}">
            <tr align="center">
                <td><a href="${pageContext.request.contextPath}/Admin/download?filename=${file.filename}">${file.filename}</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
