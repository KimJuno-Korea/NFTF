<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />

	<section>
		<div class="block no-padding  gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>거래 정보 조회</h3>
								<span>거래 정보를 조회합니다.</span>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index" title="">Home</a></li>
									<li><a href="${pageContext.request.contextPath}/user/form/${sessionScope.id}" title="">MyPage</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
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
									<c:if test="${fn:contains(buy.status, 'M')}">sellQR(${buy.boardNo})
										<td><img id="buyQR" src=''><input type='button' value="buyQR" onclick="buyQR(${buy.boardNo})"></td>
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
										<td>
											<div id="timer${sell.boardNo}"></div>
											<img id="sellQR${sell.boardNo}" src=''>
											<input id="sellQRBtn${sell.boardNo}" type='button' value="QR인증키 발급" onclick="sellQR(${sell.boardNo})">
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>				
				</table>
		 	</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

<script>
	
	function sellTimer(sec, no) {
		$("#timer"+no).text(sec);
		for (var i = 0 ; i < sec ; i++) {
			setTimeout(function() {
				$("#timer"+no).text(--sec);
				if (sec <= 0) {
					$('#sellQRBtn'+no).val("재발급");
					$("#sellQRBtn"+no).show();
					$('#sellQR'+no).hide();
				}
			}, 1000+(i*1000));
		}
	}
	
	function sellQR(no) {
		$.ajax({
			url : '${pageContext.request.contextPath}/payment/qr',
			type : 'POST',
			data : "no="+no,
			success : function(result) {
				$('#sellQR'+no).attr('src', 'data:image/png;base64, ' + result);
				sellTimer(30, no);
				$('#sellQRBtn'+no).hide();
				$('#sellQR'+no).show();
				//서버에서 DB의 시간이랑 현재 시간 비교해서 30초뒤면 안되도록 구현
			}, error : function() {
				console.log("error");
			}
		});
	}
	
	function buyQR(no) {
		$.ajax({
			url : '${pageContext.request.contextPath}/payment/qr',
			type : 'POST',
			data : "no="+no,
			success : function(result) {
				$('#buyQR').attr('src', 'data:image/png;base64, ' + result);
			}, error : function() {
				console.log("error");
			}
		});
	}

</script>
</html>