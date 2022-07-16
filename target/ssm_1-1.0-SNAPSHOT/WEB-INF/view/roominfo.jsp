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
    <title>工作室信息</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
<div align="center"><br><br>
    <table align="center" width="80%" border="1" cellspacing="1" cellpadding="2">
        <tr>
            <th>工作室名称</th>
            <th>地址</th>
            <th>负责人</th>
            <th>人数</th>
            <th>email</th>
            <th>操作</th>
        </tr>
        <c:forEach var="room" items="${requestScope.roomList}">
            <tr align="center">
                <td>${room.category}</td>
                <td>${room.address}</td>
                <td>${room.person}</td>
                <td>${room.num}</td>
                <td>${room.email}</td>
                <td><input type="submit" value="删除" onclick="func(${room.roomid})"/>
                    <input type="submit" value="修改" onclick="update(${room.roomid})"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function func(roomid){
        console.log(roomid)
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/Room/delRooms",
            data:{
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
                window.location.href = "${pageContext.request.contextPath}/Room/showAllRoom";
            },
        });
    }
    function update(id){
        window.location.href = "${pageContext.request.contextPath}/Room/findRoomById?roomid="+id;
    }
</script>
</html>
