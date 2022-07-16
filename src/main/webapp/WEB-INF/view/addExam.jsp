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
    <title>addExam</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center"><br><br>
    <p>竞赛名称：<input type="text" id="ename" placeholder="请输入竞赛名称"/></p>
    <p>开始时间：<input type="text" id="starttime" placeholder="请输入开始时间"/></p>
    <p>结束时间：<input type="text" id="endtime" placeholder="请输入结束时间" /></p>
    <p>竞赛地点：<input type="text" id="address" placeholder="请输入竞赛地点" /></p>
    <p><button id="addBnt">添加</button>
</div>
</body>
<script>
    $("#addBnt").click(function () {
        ename = document.getElementById("ename").value;
        starttime = document.getElementById("starttime").value;
        endtime = document.getElementById("endtime").value;
        address = document.getElementById("address").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Exam/addExams",
            data:{
                "ename":ename,
                "starttime":starttime,
                "endtime":endtime,
                "address":address,
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
                window.location.href = "${pageContext.request.contextPath}/Exam/showAllExams"
            },
        })
    })
</script>
</html>
