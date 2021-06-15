<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trading 365</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <div class="common__top">
        <img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    <div class="common__center">
         <div class="common__center__column">
             <p class="regist-info__p">[ '${sessionScope.tradingBoxNo}' ] 번 거래함 물품 수령</p>
             <div class="info__center">
                 <img src="${pageContext.request.contextPath}/images/receive_info.png"></img>
             </div>
        </div>
    </div>
</body>
<script>
	var tradingBox = {
			"no" : "${sessionScope.tradingBoxNo}"
		}
		$.ajax({
			url: "http://localhost:8080/box/receivegoods",
			type: "post",
			accept: "application/json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(tradingBox),
			dataType: "json",
		
			success: function(data) {
						if(data) {
							location.href="./successreceive";
						} else {
							location.href="../failreceive";
						}
					 },
			error: function(jqXHR,textStatus,errorThrown) {
		        		location.href="../failreceiveform";
					}
		});
</script>
</html>