<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
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
             <p class="regist-info__p">['${tradingBox.no}'] 번 거래함 물품 등록</p>
             <div class="info__center">
                 <img src="${pageContext.request.contextPath}/images/regist_info.png"></img>
             </div>
        </div>
    </div>
</body>
</html>