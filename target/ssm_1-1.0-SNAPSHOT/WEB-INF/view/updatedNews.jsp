<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/21
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateNews</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <input type="text" id="id" value="${requestScope.news.id}" hidden="hidden" />
    <input type="text" id="title" value="${requestScope.news.title}" placeholder="请输入公告标题"/>
    <input type="text" id="author" value="${requestScope.news.author}" placeholder="请输入公告作者"/>
    <input type="date" id="showtime" placeholder="请输入发布时间" /><hr>
    <textarea  id="content" rows="12" cols="100"  placeholder="请输入公告内容">${requestScope.news.content}</textarea><br>
    <button id="addBnt">修改</button>
</div>
</body>

<script>
    $("#addBnt").click(function () {
        id = document.getElementById("id").value;
        title = document.getElementById("title").value;
        author = document.getElementById("author").value;
        showtime = document.getElementById("showtime").value;
        content = document.getElementById("content").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/news/updateNews",
            data:{
                "id":id,
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
                window.location.href = "${pageContext.request.contextPath}/news/showNewsAll";
            },
        })
    })
</script>
</html>
