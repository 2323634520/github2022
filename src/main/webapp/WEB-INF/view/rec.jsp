<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/23
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>招新信息</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
<div align="center"><br><br>
    <table align="center" width="100%" border="1" cellspacing="1" cellpadding="2">
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>工作室意向</th>
            <th>班级信息</th>
            <th>个人优势</th>
            <th>操作</th>
        </tr>
        <c:forEach var="rec" items="${requestScope.recList}">
            <tr align="center">
                <td>${rec.realname}</td>
                <td>${rec.sex}</td>
                <td>${rec.age}</td>
                <td>${rec.roomname}</td>
                <td>${rec.classinfo}</td>
                <td>${rec.infor}</td>
                <td>
                    <input type="submit" value="删除" onclick="func(${rec.id})"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function func(id){
        console.log(id)
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/Rec/delRec",
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
                window.location.href = "${pageContext.request.contextPath}/Rec/showAllRec";
            },
        });
    }
</script>
</html>
