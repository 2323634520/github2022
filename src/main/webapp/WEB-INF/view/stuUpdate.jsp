<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>学生操作界面</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <input type="text" id="id" value="${sessionScope.student.id}" hidden="hidden" /><br>
    <p>用户账号：<input type="text" id="username" value="${sessionScope.student.username}" /></p>
    <p> 用户密码：<input type="password" id="password" value="${sessionScope.student.password}" /></p>
    <p>真实姓名：<input type="text" id="realname" value="${sessionScope.student.realname}" /></p>
    <p>班级信息：<input type="text" id="classinfo" value="${sessionScope.student.classinfo}" /></p>
    <p>电话号码：<input type="text" id="phonenum" value="${sessionScope.student.phonenum}" /></p>
    <p><button id="updatabtn">保存</button></p>
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
                window.location.href = "${pageContext.request.contextPath}/Student/stuInfo"
            },
        });
    })
</script>
</html>