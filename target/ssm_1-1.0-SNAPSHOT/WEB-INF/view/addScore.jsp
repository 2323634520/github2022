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
    <p>分数：<input type="text" id="score" placeholder="请输入分数"/></p>
    <button id="addBnt">添加</button>
</div>
</body>
<script>
    $("#addBnt").click(function () {
        score = document.getElementById("score").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Scores/addScores",
            data:{
                "score":score,
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
                window.location.href = "${pageContext.request.contextPath}/Scores/showAllScores"
            },
        })
    })
</script>
</html>

