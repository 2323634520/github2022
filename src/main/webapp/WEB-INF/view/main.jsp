<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/3/30
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
<c:if test="${not empty requestScope.page}">
<c:set var="totalPages" value="${requestScope.page.totalPage}"/>
<c:set var="pageIndex" value="${requestScope.page.currentPage}"/>
  <div align="center">
      <input type="text" id="search" placeholder="根据真实姓名查询" />
      <button id="query">查询</button>
      <button id="addStu">添加</button>
  </div>
<table align="center" width="80%" border="1" cellspacing="1" cellpadding="2">
    <br>
    <tr>
        <th>用户账号</th>
        <th>用户密码</th>
        <th>真实姓名</th>
        <th>班级信息</th>
        <th>电话号码</th>
        <th>工作室</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:forEach var="stu" items="${requestScope.page.sList}">
        <tr align="center">
            <td>${stu.username}</td>
            <td>${stu.password}</td>
            <td>${stu.realname}</td>
            <td>${stu.classinfo}</td>
            <td>${stu.phonenum}</td>
            <td>${stu.category}</td>
            <td>${stu.state}</td>
            <td><input type="submit" value="删除" onclick="func(${stu.id})"/>
                <input type="submit" value="修改" onclick="update(${stu.id})"/>
                <input type="submit" value="审批" onclick="updateState(${stu.id})"/>
            </td>
        </tr>
    </c:forEach>
</table>
    <p align="center"> 当前页数:[${pageIndex}/${totalPages}]&nbsp;
        <c:if test="${pageIndex > 1}">
            <a href="${pageContext.request.contextPath}/Student/getPageStudent?currentPage=1&pageSize=5">首页</a>&nbsp;
            <a href="${pageContext.request.contextPath}/Student/getPageStudent?currentPage=${pageIndex-1}&pageSize=5">上一页</a>
        </c:if>
        <c:if test="${pageIndex < totalPages}">
            <a href="${pageContext.request.contextPath}/Student/getPageStudent?currentPage=${pageIndex+1}&pageSize=5">下一页</a>
            <a href="${pageContext.request.contextPath}/Student/getPageStudent?currentPage=${totalPages}&pageSize=5">末页</a>
        </c:if></p>
</c:if>
</body>
<script>
    $("#exit").click(function () {
        window.location.href = "${pageContext.request.contextPath}/Student/exit";
    })
    function func(id){
        console.log(id)
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/Student/deleteStu",
            data:{
                "id":id,
            },
            xhrFields: {
                withCredentials: true
            },
            success:function(data) {
                console.log(data)
                if(data=="成功"){
                    alert(data)
                }else{
                    alert(data)
                }
                window.location.href = "${pageContext.request.contextPath}/Student/getPageStudent"
            },
        });
    }
    function update(id){
        window.location.href = "${pageContext.request.contextPath}/Student/findStuById?id="+id;
    }

    function updateState(id){
        window.location.href = "${pageContext.request.contextPath}/Student/updateState?id="+id;
        alert("审批通过")
    }



    $("#addStu").click(function(){
        window.location.href = "${pageContext.request.contextPath}/Student/addPage";
    })

    $("#query").click(function () {
        var name = document.getElementById("search").value
        window.location.href="${pageContext.request.contextPath}/Student/getPageStudent?searchName="+name+"&type=0";
    });
</script>
</html>
