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
    <title>学生注册界面</title>
    <link rel="stylesheet" type="text/css" href="/css/login&register.css">
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body background="/images/bg.jpg">

<!--Header-->
<header>
    <nav>
        <ul>
            <a href="#"><li>算法工作室管理平台</li></a>
            <a href="${pageContext.request.contextPath}/Student/loginPage"><li>学生登录</li></a>
            <a href="${pageContext.request.contextPath}/Admin/adminLogin"><li>管理员登录</li></a>
            <a href="${pageContext.request.contextPath}/Room/selectRoom"><li>注册</li></a>
        </ul>
    </nav>
</header>

<main>
    <div class="container">
        <img class="login_bg" src="/images/login.png">
        <form class="register_form" action="${pageContext.request.contextPath}/Student/addStudent" method="post">
            <h3>算法工作室管理平台(注册)</h3>
            <input type="text" autofocus="autofocus" name="username" value placeholder="用户名" required="required">
            <input type="password" name="password" value placeholder="密码" required="required">
            <input type="text" autofocus="autofocus" name="realname" value placeholder="真实姓名" required="required">
            <input type="text" autofocus="autofocus" name="classinfo" value placeholder="班级信息" required="required">
            <input type="text" autofocus="autofocus" name="phonenum" value placeholder="电话号码" required="required">

            <p>工作室选择：</p>
            <span class="radio">
                <select name="roomid">
                <c:forEach var="room" items="${requestScope.rooms}">
                        <option class="radio" value="${room.roomid}">${room.category}</option>
                </c:forEach>
                </select>
            </span>
            <input id="submit" type="submit" name="submit" value="注册">
        </form>
    </div>
</main>

<!--Footer-->
<footer>
    <div class="info">
        <ul>
            <a href="#"><li>算法工作室管理平台</li></a>
            <a href="${pageContext.request.contextPath}/Student/loginPage"><li>学生登录</li></a>
            <a href="${pageContext.request.contextPath}/Admin/adminLogin"><li>管理员登录</li></a>
        </ul>
    </div>
    <div class="copyright">
        &copy; Copyright. All rights reserved. Design by lzg</a>
    </div>
</footer>

</body>
</html>

