<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/4
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insertStu</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <p>用户账号：<input type="text" id="username" placeholder="请输入用户账号"/></p>
    <p>用户密码：<input type="text" id="password" placeholder="请输入用户密码"/></p>
    <p>真实姓名：<input type="text" id="realname" placeholder="请输入真实姓名" /></p>
    <p>班级信息：<input type="text" id="classinfo" placeholder="请输入班级信息"/></p>
    <p>电话号码：<input type="text" id="phonenum" placeholder="请输入电话号码" /></p>
    <p><input type="text" id="roomid" value="1" hidden="hidden"/></p><br>
    <button id="addbnt">添加</button>

</div>
</body>
<script>
    $("#addbnt").click(function () {
        username = document.getElementById("username").value;
        password = document.getElementById("password").value;
        realname = document.getElementById("realname").value;
        classinfo = document.getElementById("classinfo").value;
        phonenum = document.getElementById("phonenum").value;
        roomid = document.getElementById("roomid").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Student/addStudent",
            data:{
                "username":username,
                "password":password,
                "realname":realname,
                "classinfo":classinfo,
                "phonenum":phonenum,
                "roomid":roomid,
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
                window.location.href = "${pageContext.request.contextPath}/Student/getPageStudent";
            },
        })
    })
</script>
</html>
