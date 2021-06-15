<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="tradingbox__frame">
        <c:set var="counts" value="0" />
        <c:forEach  begin="0" end="${tradingBoxList.size() / 5}" step="2" >
        <div class="tradingbox__row">
           <c:forEach var="tradingBox" items="${tradingBoxList}" begin="${counts}" end="${counts + 5}" >
           <c:set var="counts" value="${counts + 1}"/>
	            	<c:if test="${tradingBox.status eq 'F'}">
						<div class="tradingbox">
	              		<div class="tradingbox__number"></p>${tradingBox.no}</p></div>
		            	<div class="tradingbox__discript"><div class="tradingbox__available">사용 가능</div></div>
						<div class="tradingbox__button"><input type="button" value="등록" onclick="location.href='tradingbox/${tradingBox.no}'"/></div>
					</div>
	            	</c:if>
					<c:if test="${tradingBox.status eq 'T'}">
						<div class="tradingbox">
		              		<div class="tradingbox__number"></p>${tradingBox.no}</p></div>
							<div class="tradingbox__discript"><div class="tradingbox__disable">사용 불가</div></div>
						</div>
					</c:if>
			</c:forEach>
		</div>
        </c:forEach>
		</div>
	</div>
    <div class="common__bottom">
        <input type="button" class="button back__button" onclick="location.href='./index'" value="처음으로"/>
    </div>
</body>
</html>