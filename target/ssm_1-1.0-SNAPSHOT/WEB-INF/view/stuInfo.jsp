<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/17
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>学生操作界面</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
<table align="center" width="80%" border="1" cellspacing="1" cellpadding="2">
    <tr>
        <th>用户账号</th>
        <th>用户密码</th>
        <th>真实姓名</th>
        <th>班级信息</th>
        <th>电话号码</th>
    </tr>
    <tr align="center">
        <td>${sessionScope.student.username}</td>
        <td>${sessionScope.student.password}</td>
        <td>${sessionScope.student.realname}</td>
        <td>${sessionScope.student.classinfo}</td>
        <td>${sessionScope.student.phonenum}</td>
    </tr>
</table>
</body>
</html>
