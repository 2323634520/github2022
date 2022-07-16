<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/4/27
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div align="center"><br>
        <form action="#" method="post">
            <label>考试名称：</label>
                <select id="examid">
                    <c:forEach var="exam" items="${requestScope.examList}">
                        <option value="${exam.eid}">${exam.ename}</option>
                    </c:forEach>
                </select>
            <button onclick="check()">确定</button>
        </form>
        <br><br>
            <p>考试要求：</p>
            <p>遵守考试纪律！</p>
            <p>听从教师安排！</p>
            <p>保持考场安静！</p>
            <p>祝大家，考试一切顺利！</p>
    </div>
</body>
<script>
    function check() {
        var eid =  document.getElementById("examid").value;
        console.log(eid)
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/Exam/arrangeExam",
            data:{
                "eid":eid,
            },
            xhrFields: {
                withCredentials: true
            },
            success:function(data) {
                if(data=="成功"){
                    alert(data)
                }else if(data=="失败"){
                    alert(data)
                }else {
                    alert(data)
                }
                window.location.href = "${pageContext.request.contextPath}/Exam/exam";
            },

        });
    }
</script>
</html>
