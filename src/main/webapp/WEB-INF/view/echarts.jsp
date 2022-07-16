<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/5/2
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/echarts.js" type="text/javascript"></script>
    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<body>
<!-- 为 ECharts 准备一个定义了宽高的 DOM -->
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var arry = new Array();
    var index = 0;
    <c:forEach var="list" items="${requestScope.countList}">
    arry[index++] = ${list};
    </c:forEach>
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 工作室人数'
        },
        tooltip: {},
        legend: {
            data: ['人数']
        },
        xAxis: {
            data: ['java工作室', 'c/c++工作室', 'python工作室','智能硬件工作室']
        },
        yAxis: {},
        series: [
            {
                name: '人数',
                type: 'bar',
                data: [8,5,3,7]
            }
        ]
    };
    myChart.setOption(option);
</script>
</body>
</html>
