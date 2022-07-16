<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/7
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <input type="text" id="id" value="${requestScope.student.id}" hidden="hidden" />
    <input type="text" id="username" value="${requestScope.student.username}" disabled="disabled"/>
    <input type="password" id="password" value="${requestScope.student.password}" disabled="disabled"/><br>
    真实姓名：<input type="text" id="realname" value="${requestScope.student.realname}" /><br>
    班级信息：<input type="text" id="classinfo" value="${requestScope.student.classinfo}" /><br>
    电话号码：<input type="text" id="phonenum" value="${requestScope.student.phonenum}" /><br>
    <button id="updatabtn">修改</button>
</div>
</body>
<script>
    $("#updatabtn").click(function () {
        id =  document.getElementById("id").value;
        username = document.getElementById("username").value;
        password = document.getElementById("password").value;
        realname = document.getElementById("realname").value;
        classinfo = document.getElementById("classinfo").value;
        phonenum = document.getElementById("phonenum").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Student/updateStu",
            data:{
                "id":id,
                "username":username,
                "password":password,
                "realname":realname,
                "classinfo":classinfo,
                "phonenum":phonenum,
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
    })
</script>
</html>
