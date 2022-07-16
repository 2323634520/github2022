<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/5/21
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/flexslider.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <link rel="stylesheet" href="/css/animate.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <script src="/js/jquery-3.5.1.min.js"></script>
    <style type="text/css">
        body button{
            width: auto;
            height: auto;
            border: 2px solid #33cabb;
            background: #12dbf1;
            font-size: 16px;
            text-align: center;
            color: #0e0e0e;
        }
    </style>
</head>
<body>
<!-- Header Section -->
<section class="tophead" role="tophead">
    <!-- Navigation Section -->
    <header id="header">
        <div class="header-content clearfix"> <a class="logo" href="#">算法工作室管理平台</a>
            <nav class="navigation" role="navigation">
                <ul class="primary-nav">
                    <li><a href="#header-slider">首页</a></li>
                    <li><a href="#services">公告通知</a></li>
                    <li><a href="${pageContext.request.contextPath}/Rec/addRec">社团招新</a></li>
                    <li><a href="${pageContext.request.contextPath}/Student/studentLogin">学生登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/adminLogin">管理员登录</a></li>
                </ul>
            </nav>
            <a href="#" class="nav-toggle">Menu<span></span></a> </div>
    </header>
    <!-- Navigation Section -->
</section>
<!-- Header Section -->
<!-- Slider Section -->
<section id="header-slider" class="section">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active"> <img src="/images/b1.jpeg" alt="Chania">
            </div>
            <div class="item"> <img src="/images/b2.jpeg" alt="Chania">
            </div>
            <div class="item"> <img src="/images/b3.jpeg" alt="Chania">
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span></a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span></a></div>
</section>
<!-- Slider Section -->
<!-- Service Section -->
<section id="services" class="section services">
    <div class="container-fluid">
                <c:set var="totalPages" value="${requestScope.page.totalPage}"/>
                <c:set var="pageIndex" value="${requestScope.page.currentPage}"/>
                <c:forEach var="news" items="${requestScope.page.newsList}">
                    <div align="left">
                        <dd>
                            <h1><b>${news.title}</b></h1>
                            <br>
                            <span><b>作者：</b>${news.author}</span>&nbsp;&nbsp;
                            <span><b>发布时间：</b>${news.showtime}</span>
                            <button align="right" onclick="detele(${news.id})">删除</button>
                            <button align="right" onclick="update(${news.id})">修改</button>
                            <br><hr>
                            <span><b>内容：</b>${news.content}</span>
                            <br>
                        </dd>
                    </div>
                </c:forEach>
                <p align="center"> 当前页数:[${pageIndex}/${totalPages}]&nbsp;
                    <c:if test="${pageIndex > 1}">
                        <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=1&pageSize=1">首页</a>&nbsp;
                        <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=${pageIndex-1}&pageSize=1">上一页</a>
                    </c:if>
                    <c:if test="${pageIndex < totalPages}">
                        <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=${pageIndex+1}&pageSize=1">下一页</a>
                        <a href="${pageContext.request.contextPath}/news/showNewsAll?currentPage=${totalPages}&pageSize=1">末页</a>
                    </c:if></p>
        </fieldset>
    </div>
</section>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.flexslider-min.js"></script>
<script src="/js/retina.min.js"></script>
<script src="/js/modernizr.js"></script>
<script src="/js/main.js"></script>
<script>
    function detele(id) {
        console.log(id)
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/news/deleteNews",
            data:{
                "id":id,
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
        });
    }
    function update(id) {
        window.location.href="${pageContext.request.contextPath}/news/updateNewsPath?id="+id;
    }

</script>
</body>
</html>
