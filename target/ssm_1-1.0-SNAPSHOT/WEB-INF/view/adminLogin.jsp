<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/21
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" type="text/css" href="/css/login&register.css">
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body background="/images/bg.jpg">

<!--Header-->
<header>
    <nav>
        <ul>
            <a href="${pageContext.request.contextPath}/Student/loginPage"><li>学生登录</li></a>
            <a href="${pageContext.request.contextPath}/Admin/adminLogin"><li>管理员登录</li></a>
            <a href="${pageContext.request.contextPath}/Student/register"><li>注册</li></a>
            <a href="${pageContext.request.contextPath}/Rec/addRec"><li>社团招新</li></a>
        </ul>
    </nav>
</header>

<main>
    <div class="container">
        <img class="login_bg" src="/images/login.png">
        <form class="form" action="${pageContext.request.contextPath}/Admin/adminLogin" method="post" id="loginForm">
            <h3>算法工作室管理系统(admin)</h3>
            账号：<input type="text" autofocus="autofocus" name="username" id="username" value placeholder="用户名"><br>
            密码：<input type="password" name="password" id="password" value placeholder="密码"><br>
            <input type="submit" id="submit" value="登录"/>
        </form>
    </div>
</main>

<!--Footer-->
<footer>
    <div class="info">
        <ul>
            <a href="${pageContext.request.contextPath}/Student/loginPage"><li>学生登录</li></a>
            <a href="${pageContext.request.contextPath}/Admin/adminLogin"><li>管理员登录</li></a>
            <a href="${pageContext.request.contextPath}/Student/register"><li>注册</li></a>
            <a href="${pageContext.request.contextPath}/Rec/addRec"><li>社团招新</li></a>
        </ul>
    </div>
    <div class="copyright">
        &copy; Copyright. All rights reserved. Design by lzg</a>
    </div>
</footer>

</body>
<script type="text/javascript">

    $("#submit").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();

        if (isEmpty(username)){
            alert("账号不能为空");
            return;
        }
        if (isEmpty(password)){
            alert("密码不能为空");
            return;
        }
    });

    function isEmpty(str) {
        if (str == null || str.trim() == ""){
            return true;
        }
        return false;

    };
</script>
</html>


