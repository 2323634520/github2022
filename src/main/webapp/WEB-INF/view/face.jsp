<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 23236
  Date: 2022/3/30
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Face</title>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <style>
        #div{
            width: 200px;
            height: 200px;
            background-color: powderblue;
            margin-top: 100px;
            margin-bottom: 150px;
            margin-right:600px;
            margin-left: 600px;
        }
        #video{
            width: 150px;
            height: 150px;
            margin-top: 25px;
            margin-bottom: 25px;
            margin-right: 25px;
            margin-left: 25px;
        }
        #canvas{
            width: 150px;
            height: 150px;
        }

    </style>
</head>
<body>
<div id="div">
    <video id="video" autoplay="autoplay"></video>
    <canvas id="canvas" hidden="hidden"></canvas>
</div>

<script>
    let mediaStreamTrack=null; // 视频对象(全局)
    let video ;
    //打开摄像头
    window.onload = function(){
        function openMedia() {
            let constraints = {
                video: { width: 150, height: 150 },
                audio: false
            };
            //获得video摄像头
            video = document.getElementById('video');
            let promise = navigator.mediaDevices.getUserMedia(constraints);
            promise.then((mediaStream) => {
                mediaStreamTrack=mediaStream.getVideoTracks();
                video.srcObject = mediaStream;
                video.play();
                takePhoto();
            });
        }
        openMedia();
    }
    function takePhoto() {
        setTimeout(function(){
            let video = document.getElementById('video');
            let canvas = document.getElementById('canvas');
            let ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0, 150, 150);
            let img = document.getElementById('canvas').toDataURL();
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/Student/faceLogin",
                data:{
                    "img":img,
                },
                xhrFields: {
                    withCredentials: true
                },
                success:function(data){
                    console.log(data);
                    if(data.code==0){
                        closeMedia();
                        window.location.href = "${pageContext.request.contextPath}/Student/mainPage";
                    }else if(data.code==222202){
                        alert("没有检测到人脸");
                        takePhoto();
                    }else if(data.code==1){
                        alert("人脸检查不匹配");
                        takePhoto();
                    }else if(data.code==2){
                        closeMedia();
                        alert("没有录入人脸");
                        window.location.href = "${pageContext.request.contextPath}/Student/loginPage";
                    }
                },
            });
        },3000);
    }
    // 关闭摄像头
    function closeMedia() {
        let stream = document.getElementById('video').srcObject;
        let tracks = stream.getTracks();
        tracks.forEach(function(track) {
            track.stop();
        });
        document.getElementById('video').srcObject = null;
    }
</script>

</body>
</html>
