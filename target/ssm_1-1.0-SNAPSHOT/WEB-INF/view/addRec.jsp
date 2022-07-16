<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/24
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addRec</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/Rec.css">
</head>
<body>
<form id="payment" action="${pageContext.request.contextPath}/Rec/addRecs">
    <fieldset>
        <legend>填写个人简历信息</legend>
        <ol>
            <li>
                <label for="realname">姓名：</label>
                <input id="realname" name="realname" type="text" placeholder="请输入用户名" required>
            </li>
            <li>
                <label for="age">年龄：</label>
                <input id="age" name="age" type="text" placeholder="某岁" required>
            </li>
            <li>
                <label for="sex">性别：</label>
                <input id="sex" name="sex" type="text" placeholder="sex" required>
            </li>
            <li>
                <label for="phonenum">联系电话：</label>
                <input id="phonenum" name="phonenum" type="tel" placeholder="010-12345678" required>
            </li>
            <li>
                <label for="classinfo">班级信息：</label>
                <input id="classinfo" name="classinfo" type="text" placeholder="软件182" required>
            </li>
            <li>
                <label for="roomname">工作室意向：</label>
                <input id="roomname" name="roomname" type="text" required>
            </li>
            <li>
                <label for="infor">个人优势：</label>
                <textarea id="infor" name="infor" rows="5" required></textarea>
            </li>
            <li>
                <input id="state" name="state" type="text" value="0" required hidden="hidden">
            </li>
        </ol>
        <button type="addBnt">提交</button>
    </fieldset>
</form>
</body>
<script>
    $("#addBnt").click(function () {
        realname = document.getElementById("realname").value;
        age = document.getElementById("age").value;
        sex = document.getElementById("sex").value;
        phonenum = document.getElementById("phonenum").value;
        classinfo = document.getElementById("classinfo").value;
        roomname = document.getElementById("roomname").value;
        infor = document.getElementById("infor").value;
        state = document.getElementById("state").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Rec/addRecs",
            data:{
                "realname":realname,
                "age":age,
                "sex":sex,
                "phonenum":phonenum,
                "classinfo":classinfo,
                "roomname": roomname,
                "infor":infor,
                "state":state,
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
                window.location.href = "${pageContext.request.contextPath}/Rec/success"
            },
        })
    })
</script>
</html>
