<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
    <div class="common__top">
        <img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    <div class="common__center">
            <img src="${pageContext.request.contextPath}/images/qr_fail_authkey.png"/>
    </div>
    <div class="common__bottom">
            <input type="button" class="button back__button" onclick="location.href='./index'" value="처음으로"/>
    </div>
</body>
</html>