<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>管理员操作界面</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<header style="background-color: #a0b5eb">
    <div class="title">
        <span>管理员操作界面</span>
    </div>
    <nav>
        <div class="userinfo">
            <ul>
                <li><a href="${pageContext.request.contextPath}/Student/exit">退出登录</a></li>
                <li><a href="${pageContext.request.contextPath}/Student/mainPage">返回首页</a></li>
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
                    <div id="user-info" class="link">公告信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/news/showNewsAll" target="my">查看公告信息</a></li>
                        <li><a href ="${pageContext.request.contextPath}/news/addNewsPath" target="my">添加公告信息</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">学生信息管理</div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/Student/getAllData" target="my">学生管理</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">工作室信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Room/showAllRoom" target="my">查看工作室信息</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Room/addRoom" target="my">添加工作室信息</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Room/echarts" target="my">echart表</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">竞赛信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Exam/showAllExams" target="my">查看竞赛信息</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Exam/addExam" target="my">添加竞赛信息</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">成绩信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Exam/showAllExam" target="my">安排考试</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Scores/getAllScores" target="my">查看学生成绩</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Scores/scoresEcharts" target="my">Echarts折线图</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">招新信息管理</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Rec/addRec" target="my">招新信息模板</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Rec/showAllRec" target="my">招新人员名单</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">文件上传</div>
                    <ul class="submenu">
                        <li><a href ="${pageContext.request.contextPath}/Admin/file" target="my">文件上传</a></li>
                        <li><a href ="${pageContext.request.contextPath}/Admin/fileInfo" target="my">文件下载</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link">学习友情链接</div>
                    <ul class="submenu">
                        <li><a href ="https://www.taobao.com/">旭哥的淘宝</a></li>
                        <li><a href ="https://www.nowcoder.com/">牛客网</a></li>
                        <li><a href ="https://www.csdn.net/">CSDN</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="result" class="result" style="background-color: #addcff" >
            <div class="welcome">
                <iframe name = "my" width="95%" height="880" frameborder="0" scrolling="yes" ></iframe>
            </div>
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

