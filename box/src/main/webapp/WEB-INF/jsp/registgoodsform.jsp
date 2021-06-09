<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div class="common__top">
        <img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    <div class="common__center">
         <div class="common__center__column">
             <p class="regist-info__p">'${tradingBox.no}' 거래함 물품 등록</p>
             <div class="info__center">
                 <img src="${pageContext.request.contextPath}/images/regist_info.png"></img>
             </div>
        </div>
    </div>
</body>
<script>
	var tradingBox = {
			"no" : "${tradingBox.no}",
			"boardNo" : "${tradingBox.boardNo}",
			"price" : "${tradingBox.price}"
		}
		$.ajax({
			url: "http://localhost:8080/box/registgoods",
			type: "post",
			accept: "application/json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(tradingBox),
			dataType: "json",
		
			success: function(data) {
						if(data) {
							location.href="./successregist";
						} else {
							location.href="../failregist";
						}
					 },
			error: function(jqXHR,textStatus,errorThrown) {
		        		location.href="../failregistform";
					}
		});
</script>
</html>