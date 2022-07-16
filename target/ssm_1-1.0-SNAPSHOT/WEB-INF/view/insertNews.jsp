<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加公告信息</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <p>公告标题：<input type="text" id="title" placeholder="请输入公告标题"/></p>
    <p>公告作者:<input type="text" id="author" placeholder="请输入公告作者"/>&nbsp;&nbsp;
    发布时间：<input type="date" id="showtime" placeholder="请输入发布时间" /></p><hr>
    公告内容：<br>
    <textarea  id="content" rows="12" cols="100" placeholder="请输入公告内容"></textarea><br>
    <button id="addBnt">保存</button>
</div>
</body>
<script>
    $("#addBnt").click(function () {
        title = document.getElementById("title").value;
        author = document.getElementById("author").value;
        showtime = document.getElementById("showtime").value;
        content = document.getElementById("content").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/news/addNews",
            data:{
                "title":title,
                "author":author,
                "showtime":showtime,
                "content":content,
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
                window.location.href = "${pageContext.request.contextPath}/news/showNewsAll"
            },
        })
    })
</script>
</html>
