<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 정보 조회</title>
</head>
<body>
	<div class="row">
		<h2>거래 정보 조회</h2>
		<div class="col-lg-4 col-sm-7 col-mt-5">
			<div class="row">
				<h4>구매 거래 정보 목록</h4>
				<table border="1">
					<tr>
						<th>관련 게시글</th>
						<th>판매자 아이디</th>
						<th>구매자 아이디</th>
						<th>상태</th>
						<th>거래일자</th>
						<th>인증 QR 발급</th>
					</tr>
					<c:choose>
						<c:when test="${buyerList ne null}">
							<c:forEach var="buy" items="${buyerList}">
								<tr>
									<th><a href="${pageContext.request.contextPath}/board/${buy.boardNo}">게시글 제목</a></th>
									<th>${buy.buyerId}</th>
									<th>${buy.sellerId}</th>
									<c:choose>
										<c:when test="${fn:contains(buy.status, 'S')}">
											<th>거래 완료</th>
										</c:when>
										<c:when test="${fn:contains(buy.status, 'M')}">
											<th>거래 진행중</th>
										</c:when>
										<c:when test="${fn:contains(buy.status, 'C')}">
											<th>거래 취소</th>
										</c:when>
									</c:choose>
									<th>${buy.tradeDate}</th>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>				
				</table>
		 	</div>
		 	
		 	<div class="row">
				<h4>판매 거래 정보 목록</h4>
				<table border="1">
					<tr>
						<th>관련 게시글</th>
						<th>판매자 아이디</th>
						<th>구매자 아이디</th>
						<th>상태</th>
						<th>거래일자</th>
					</tr>
					<c:choose>
						<c:when test="${sellerList ne null}">
							<c:forEach var="sell" items="${sellerList}">
								<tr>
									<th><a href="${pageContext.request.contextPath}/board/${sell.boardNo}">게시글 제목</a></th>
									<th>${sell.buyerId}</th>
									<th>${sell.sellerId}</th>
									<c:choose>
										<c:when test="${fn:contains(sell.status, 'S')}">
											<th>거래 완료</th>
										</c:when>
										<c:when test="${fn:contains(sell.status, 'M')}">
											<th>거래 진행중</th>
										</c:when>
										<c:when test="${fn:contains(sell.status, 'C')}">
											<th>거래 취소</th>
										</c:when>
									</c:choose>
									<th>${sell.tradeDate}</th>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>				
				</table>
		 	</div>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
</script>
</html>