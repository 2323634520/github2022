<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/20
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>News</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <style type="text/css">
        body button{
            width: auto;
            height: auto;
            border: 2px solid #33cabb;
            background: #12dbf1;
            font-size: 16px;
            text-align: center;
            color: #0e0e0e;
        }
    </style>
</head>
<body>
<fieldset>
    <c:if test="${not empty requestScope.page}">
        <c:set var="totalPages" value="${requestScope.page.totalPage}"/>
        <c:set var="pageIndex" value="${requestScope.page.currentPage}"/>
        <c:forEach var="news" items="${requestScope.page.newsList}">
            <div align="left">
                <dd>
                    <h1><b>${news.title}</b></h1>
                    <br>
                    <span><b>作者：</b>${news.author}</span>&nbsp;&nbsp;
                    <span><b>发布时间：</b>${news.showtime}</span>
                    <br><hr>
                    <span><b>内容：</b>${news.content}</span>
                    <br>
                </dd>
            </div>
        </c:forEach>
        <p align="center"> 当前页数:[${pageIndex}/${totalPages}]&nbsp;
            <c:if test="${pageIndex > 1}">
                <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=1&pageSize=1">首页</a>&nbsp;
                <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=${pageIndex-1}&pageSize=1">上一页</a>
            </c:if>
            <c:if test="${pageIndex < totalPages}">
                <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=${pageIndex+1}&pageSize=1">下一页</a>
                <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=${totalPages}&pageSize=1">末页</a>
            </c:if></p>
    </c:if>
</fieldset>
</body>
</html>
