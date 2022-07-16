<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/25
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成绩信息</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
    <c:set var="totalPages" value="${requestScope.page.totalPage}"/>
    <c:set var="pageIndex" value="${requestScope.page.currentPage}"/>
    <div align="center">
    </div>
    <table align="center" width="80%" border="1" cellspacing="1" cellpadding="2">
        <br>
        <tr>
            <th>用户名</th>
            <th>真实姓名</th>
            <th>班级信息</th>
            <th>成绩</th>
            <th>考试场次</th>
            <th>操作</th>
        </tr>
        <c:forEach var="scores" items="${requestScope.page.scoreList}">
            <tr align="center">
                <td>${scores.username}</td>
                <td>${scores.realname}</td>
                <td>${scores.classinfo}</td>
                <td>${scores.score}</td>
                <td>${scores.ename}</td>
                <td>
                    <input type="submit" value="录入成绩" onclick="update(${scores.id})"/>
                    <input type="submit" value="修改成绩" onclick="update(${scores.id})"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    <p align="center"> 当前页数:[${pageIndex}/${totalPages}]&nbsp;
        <c:if test="${pageIndex > 1}">
            <a href="${pageContext.request.contextPath}/Scores/getPageScores?currentPage=1&pageSize=5">首页</a>&nbsp;
            <a href="${pageContext.request.contextPath}/Scores/getPageScores?currentPage=${pageIndex-1}&pageSize=5">上一页</a>
        </c:if>
        <c:if test="${pageIndex < totalPages}">
            <a href="${pageContext.request.contextPath}/Scores/getPageScores?currentPage=${pageIndex+1}&pageSize=5">下一页</a>
            <a href="${pageContext.request.contextPath}/Scores/getPageScores?currentPage=${totalPages}&pageSize=5">末页</a>
        </c:if></p>
</body>
<script>
    function update(id){
        window.location.href = "${pageContext.request.contextPath}/Scores/findScoresById?id="+id;
    }
</script>
</html>
