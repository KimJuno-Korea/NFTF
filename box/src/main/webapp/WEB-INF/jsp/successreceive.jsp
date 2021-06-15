<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trading 365</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <div class="common__top">
        <img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    <div class="common__center">
         <div class="common__center__column">
             <h1> 물품 수령 완료 </h1>
             <h3> ※물품 수령이 정상적으로 처리되었습니다. 이용해 주셔서 감사합니다.</h3>
        </div>
    </div>
    <div class="common__bottom">
        <input type="button" class="button back__button" onclick="location.href='./index'" value="처음으로"/>
	</div>
</body>
</html>