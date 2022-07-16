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
    <input type="text" id="eid" value="${requestScope.exam.eid}" hidden="hidden" /><br>
    竞赛名称：<input type="text" id="ename" value="${requestScope.exam.ename}" /><br>
    开始时间：<input type="text" id="starttime" value="${requestScope.exam.starttime}" /><br>
    结束时间：<input type="text" id="endtime" value="${requestScope.exam.endtime}" /><br>
    竞赛地点：<input type="text" id="address" value="${requestScope.exam.address}" /><br>
    <button id="addBnt">保存</button>
</div>
</body>

<script>
    $("#addBnt").click(function () {
        eid = document.getElementById("eid").value;
        ename = document.getElementById("ename").value;
        starttime = document.getElementById("starttime").value;
        endtime = document.getElementById("endtime").value;
        address = document.getElementById("address").value;
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Exam/updateExams",
            data:{
                "eid":eid,
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
