<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>学生操作界面</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<header style="background-color: #a0b5eb">
    <div class="title">
        <span>学生操作界面</span>
    </div>
    <nav>
        <div class="userinfo">
            <ul>
                <li><a href="${pageContext.request.contextPath}/Student/exit">退出登录</a></li>
                <li><a href="${pageContext.request.contextPath}/Student/stuInfo">返回首页</a></li>
            </ul>
        </div>
    </nav>
</header>

<main>
    <div class="container">
        <div class="select">
            <h3>请选择操作</h3>
            <ul id="accordion" class="accordion">
                <li>
                    <div id="user-info" class="link">公告通知管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/news/showNews" target="my">查看公告信息</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">个人信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Student/stuInfo" target="my">查看个人信息</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Student/stuUpdate" target="my">修改个人信息</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">工作室信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Room/showAllRooms" target="my">查看工作室信息</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Room/echarts" target="my">Echarts</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">竞赛信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Exam/showAllExamss" target="my">查看竞赛信息</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">文件信息下载</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Admin/fileInfo" target="my">文件下载</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">算法练习链接</div>
                    <ul class="submenu">
                        <li><a href ="https://leetcode.com/">LeetCode</a></li>
                        <li><a href ="https://www.nowcoder.com/">牛客网</a></li>
                        <li><a href ="https://www.csdn.net/">CSDN</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div id="result" class="result" style="background-color: #addcff">
            <div class="welcome">
                <iframe name = "my" width="95%" height="880" frameborder="0" ></iframe>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="copyright">
        &copy; Copyright. All rights reserved. Design by lzg</a>
    </div>
</footer>
<script src="/js/jquery-3.5.1.min.js"></script>
<script src="/js/index.js"></script>
</body>
</html>