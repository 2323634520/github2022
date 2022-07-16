<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/5/2
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>File</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
    <form action="${pageContext.request.contextPath}/Admin/saveUpload" method="post" enctype="multipart/form-data">
        <p align="center"><input type="file" name="file" value="请选择文件"/>
            <input type="submit" value="上传" onclick="func()"></p>
    </form>
</div>
</body>
<script>
    function func() {
        alert("上传成功")
        window.location.href = "${pageContext.request.contextPath}/Admin/file"
    }
</script>
</html>
