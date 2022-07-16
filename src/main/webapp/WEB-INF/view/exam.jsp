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
</head>
<style>
    table{
        width: 100%;
        border-collapse: collapse;
    }
    table caption{
        font-size: 2em;
        font-weight: bold;
        margin: 1em 0;
    }
    th,td{
        border: 1px solid #132e45;
        text-align: center;
        padding: 20px 0;
    }
    table tr{
        color: #111111;
    }
    body input{
        width: auto;
        height: auto;
        border: 2px solid #33cabb;
        background: #7dee4e;
        font-size: 16px;
        text-align: center;
        color: #0e0e0e;
    }
</style>
<body>
<div align="center"><br><br>
    <table align="center" width="80%" border="1" cellspacing="1" cellpadding="2">
        <tr>
            <th>竞赛信息</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>竞赛地点</th>
            <th>操作</th>
        </tr>
        <c:forEach var="exam" items="${requestScope.examList}">
            <tr align="center">
                <td>${exam.ename}</td>
                <td>${exam.starttime}</td>
                <td>${exam.endtime}</td>
                <td>${exam.address}</td>
                <td><input type="submit" value="删除" onclick="func(${exam.eid})"/>
                    <input type="submit" value="修改" onclick="update(${exam.eid})"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function func(eid){
        console.log(eid)
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/Exam/delExams",
            data:{
                "eid":eid,
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
                window.location.href = "${pageContext.request.contextPath}/Exam/showAllExams";
            },
        });
    }
    function update(id){
        window.location.href = "${pageContext.request.contextPath}/Exam/findExamById?eid="+id;
    }
</script>
</html>
