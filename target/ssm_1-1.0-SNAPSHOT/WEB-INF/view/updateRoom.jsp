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
    <title>updateRoom</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <input type="text" id="roomid" value="${requestScope.room.roomid}" hidden="hidden" /><br>
    <p>工作室名称：<input type="text" id="category" value="${requestScope.room.category}" /></p>
    <p>工作室地址：<input type="text" id="address" value="${requestScope.room.address}" /></p>
    <p>工作室人数：<input type="text" id="num" value="${requestScope.room.num}" /></p>
    <p>工作室老师：<input type="text" id="person" value="${requestScope.room.person}" /></p>
    <p>工作室邮箱：<input type="text" id="email" value="${requestScope.room.email}" /></p>
    <p><button id="addBnt">保存</button></p>
</div>
</body>

<script>
    $("#addBnt").click(function () {
        roomid = document.getElementById("roomid").value;
        category = document.getElementById("category").value;
        address = document.getElementById("address").value;
        num = document.getElementById("num").value;
        person = document.getElementById("person").value;
        email = document.getElementById("email").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Room/updateRooms",
            data:{
                "roomid":roomid,
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
