<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>

    <div class="common__top"><img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    
    <div class="common__center">
    <div class="common__center__column">
		<div class="tradingbox__row">
                <div class="goodsinfo_type">사용자 ID</div>
                <div class="goodsinfo_content">${sessionScope.id}</div>
            </div>
            <div class="tradingbox__row">
                <div class="goodsinfo_type">등록 거래함 번호</div>
                <div class="goodsinfo_content">${tradingBox.no}번 거래함</div>
            </div>
            <div class="tradingbox__row">
                <div class="goodsinfo_type">관련 게시글 제목</div>
                <div class="goodsinfo_content">${tradingBox.boardTitle}</div>
            </div>
            <div class="tradingbox__row">
                <div class="goodsinfo_type">가격</div>
                <div class="goodsinfo_content">${tradingBox.price}</div>
            </div>
        </div>
    </div>
	<form action="./confirmgoods" method="post" class="common__bottom">
		<input type="hidden" name="no" value="${tradingBox.no}"/>
		<input type="hidden" name="boardNo" value="${tradingBox.boardNo}"/>
		<input type="hidden" name="price" value="${tradingBox.price}"/>
		
         <input type="button" class="button back__button" value="처음으로"/>
		<input type="submit" class="button confirm__button" value="선택완료" />
	</form>
</body>
</html>