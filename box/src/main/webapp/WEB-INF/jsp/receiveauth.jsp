<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<title>:: jsQR 테스트 ::</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsQR.js"></script>
	<style type="text/css">
			canvas {
				width:100%;
				margin-right:10%;
			}
	</style>
</head>
<body>
    <div class="common__top">
        <img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    <div class="registauth__center">
        <div class="common__double">
            <img src="${pageContext.request.contextPath}/images/qr_authkey.png"/>
        </div>
        <div class="common__double">
            <div id="frame"></div>
                        <div id="loadingMessage">
						비디오 스트림에 액세스 할 수 없습니다
					<br/>웹캠이 활성화되어 있는지 확인하십시오
				</div>
           	 <canvas id="canvas"></canvas>
        </div>
    </div>
    <div class="common__bottom">
            <input type="button" class="button back__button" onclick="location.href='../index'" value="처음으로"/>
    </div>
</body>


<script type="text/javascript">	
document.addEventListener("DOMContentLoaded", function() {
	var video = document.createElement("video");		
	var canvasElement = document.getElementById("canvas");
	var canvas = canvasElement.getContext("2d");
	var loadingMessage = document.getElementById("loadingMessage");

	function drawLine(begin, end, color) {
		canvas.beginPath();
		canvas.moveTo(begin.x, begin.y);
		canvas.lineTo(end.x, end.y);
		canvas.lineWidth = 4;
		canvas.strokeStyle = color;
		canvas.stroke();
    }
	navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
  		        video.srcObject = stream;
  		        video.setAttribute("playsinline", true);
     		video.play();
  		        requestAnimationFrame(tick);
	});

	function tick() {

		loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

		if(video.readyState === video.HAVE_ENOUGH_DATA) {
    		      loadingMessage.hidden = true;
    		      canvasElement.hidden = false;
    		      canvasElement.height = video.videoHeight;
    	 	      canvasElement.width = video.videoWidth;
    		      canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);

    		      var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
    		      var code = jsQR(imageData.data, imageData.width, imageData.height, {
                                inversionAttempts : "dontInvert",
    		      				});
    		      
                          if(code) {
                                drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");
                                drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");
                                drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");
                                drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000");
                               
                                var codeData = String(code.data);
                                var splitedCodeDatas = codeData.split('/');
                                if (splitedCodeDatas.length == 2) {
                                	var authKey = splitedCodeDatas[0];
                                	var no = splitedCodeDatas[1];		
                                	$.ajax({
                                		url: "http://localhost:8080/box/receiveauth",
                                		type: "post",
                                		accept: "application/json",
                                		contentType: "application/json; charset=utf-8",
                                		data: JSON.stringify({'authKey': authKey,
                                								'no' : no}),
                                		dataType: "json",

                                		success: function(data) {
                                			if(data) {
                            					location.href="../receivegoods";
                                			} else {
                                				location.href="../failreceive";
                                			}
                                		},
	                                	error: function(jqXHR,textStatus,errorThrown) {
	    	                                			location.href="../failreceive";
	                                	}
                              		}); 
                              }
                          }
        }
		requestAnimationFrame(tick);
		}
  		      
});
</script>
</html>