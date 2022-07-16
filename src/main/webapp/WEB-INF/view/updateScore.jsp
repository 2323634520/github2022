<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/25
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateScores</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <input type="text" id="id" value="${requestScope.score.id}" hidden="hidden" /><br>
    成绩：<input type="text" id="score" value="${requestScope.score.score}" /><br>
    <button id="addBnt">保存</button>
</div>
</body>
<script>
    $("#addBnt").click(function () {
        id = document.getElementById("id").value;
        score = document.getElementById("score").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Scores/updateScores",
            data:{
                "id":id,
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
                window.location.href = "${pageContext.request.contextPath}/Scores/getPageScores"
            },
        })
    })
</script>
</html>