<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/24
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insertRoom</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center"><br><br>
    <p> 工作室名称：<input type="text" id="category" placeholder="请输入工作室名称"/></p>
    <p> 工作室地址：<input type="text" id="address" placeholder="请输入工作室地址"/></p>
    <p> 工作室老师：<input type="text" id="person" placeholder="请输入工作室老师" /></p>
    <p> 工作室人数：<input type="text" id="num" placeholder="请输入工作室人数" /></p>
    <p> 工作室邮箱：<input type="text" id="email" placeholder="请输入工作室邮箱"/></p>
    <button id="addBnt">添加</button>
</div>
</body>
<script>
    $("#addBnt").click(function () {
        category = document.getElementById("category").value;
        address = document.getElementById("address").value;
        person = document.getElementById("person").value;
        num = document.getElementById("num").value;
        email = document.getElementById("email").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Room/addRooms",
            data:{
                "category":category,
                "address":address,
                "num":num,
                "person":person,
                "email":email,
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
                window.location.href = "${pageContext.request.contextPath}/Room/showAllRoom"
            },
        })
    })
</script>
</html>

