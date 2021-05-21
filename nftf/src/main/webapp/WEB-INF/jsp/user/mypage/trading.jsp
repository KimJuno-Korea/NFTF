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
						<th>구매자 아이디</th>
						<th>판매자 아이디</th>
						<th>상태</th>
						<th>거래일자</th>
						<th>인증 QR 발급</th>
					</tr>
					<c:choose>
						<c:when test="${buyerList ne null}">
							<c:forEach var="buy" items="${buyerList}">
								<tr>
									<td><a href="${pageContext.request.contextPath}/board/${buy.boardNo}">게시글 제목</a></td>
									<td>${buy.buyerId}</td>
									<td>${buy.sellerId}</td>
									<c:choose>
										<c:when test="${fn:contains(buy.status, 'S')}">
											<td>거래 완료</td>
										</c:when>
										<c:when test="${fn:contains(buy.status, 'M')}">
											<td>거래 진행중</td>
										</c:when>
										<c:when test="${fn:contains(buy.status, 'C')}">
											<td>거래 취소</td>
										</c:when>
									</c:choose>
									<td>${buy.tradeDate}</td>
									<c:if test="${fn:contains(buy.status, 'M')}">
										<td><img src='${pageContext.request.contextPath}/payment/qr?no=${buy.boardNo}'></td>
										<!-- <td><input type="button" value="인증키 QR 발급" onclick="sellQR()"><div id="html"></div></td> -->
									</c:if>
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
						<th>구매자 아이디</th>
						<th>판매자 아이디</th>
						<th>상태</th>
						<th>거래일자</th>
						<th>인증 QR 발급</th>
					</tr>
					<c:choose>
						<c:when test="${sellerList ne null}">
							<c:forEach var="sell" items="${sellerList}">
								<tr>
									<td><a href="${pageContext.request.contextPath}/board/${sell.boardNo}">게시글 제목</a></td>
									<td>${sell.buyerId}</td>
									<td>${sell.sellerId}</td>
									<c:choose>
										<c:when test="${fn:contains(sell.status, 'S')}">
											<td>거래 완료</td>
										</c:when>
										<c:when test="${fn:contains(sell.status, 'M')}">
											<td>거래 진행중</td>
										</c:when>
										<c:when test="${fn:contains(sell.status, 'C')}">
											<td>거래 취소</td>
										</c:when>
									</c:choose>
									<td>${sell.tradeDate}</td>
									<c:if test="${fn:contains(sell.status, 'M')}">
										<td><img src='${pageContext.request.contextPath}/payment/qr?no=${sell.boardNo}'></td>
										<!-- <td><input type="button" value="인증키 QR 발급" onclick="sellQR()"><div id="html"></div></td> -->
									</c:if>
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

	function sellQR(no) {
		var html = "<img src='${pageContext.request.contextPath}/payment/qr?no=${sell.boardNo}'>"
		$('#html').html(html);
	}

</script>
</html>