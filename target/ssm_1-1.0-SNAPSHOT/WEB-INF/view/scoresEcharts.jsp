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
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
            xAxis: {
                data: ['第一次竞赛', '第二次竞赛', '第三次竞赛', '第四次竞赛','第五次竞赛','第六次竞赛',]
            },
            yAxis: {},
            series: [
                {
                    data: [10, 22, 28, 23,32,22],
                    type: 'line',
                    smooth: true
                }
            ]
        };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>
