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
	
	<section style="margin-bottom:60px">	
		<div class="trading-list">
			<div class="container">
				<div class="trading-row">
					<div class="row">
						<div class="col-12">
							<c:choose>
								<c:when test="${buyerList[0] ne null}">
								<h4>구매 거래 정보 목록</h4>
									<div class="trading-table">
										<table class="trading" border="1" style="width:100% !important">
											<tr>
												<th>관련 게시글</th>
												<th>구매자 아이디</th>
												<th>판매자 아이디</th>
												<th>상태</th>
												<th>거래일자</th>
												<th>인증 QR 발급</th>
											</tr>
											
									<c:forEach var="buy" items="${buyerList}" varStatus="status">
										<tr>
											<td><a class="herf" href="${pageContext.request.contextPath}/board/${buy.boardNo}">${buyerBoardList[status.index].title}</a></td>
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
										
											<td>
												<c:if test="${buy.status eq 'M'}">
													<input class="trading-qr-btn"  type='button' onclick="buyQR(${buy.boardNo})" value="QR인증키 발급">
												</c:if>
											</td>
											<div class="modal qr" id="buyQrModal${buy.boardNo}" 
													tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
										<!-- 				<div class="modal-header"> -->
										<!-- 				</div> -->
														<div class="modal-body">
															<div class="col-12">
																<div class="qr-timer" id="buyTimer${buy.boardNo}"></div>
																<img class="trading-qr" id="buyQR${buy.boardNo}" src=''>
															</div>
														</div>
										<!-- 				<div class="modal-footer"> -->
										<!-- 				</div> -->
													</div>
												</div>
											</div>
										</tr>
									</c:forEach>
									</table>
									</div>
								</c:when>
							</c:choose>				
						</div>
					</div>
				</div>
				<div class="trading-row">
					<div class="row">
						<div class="col-12">
							<c:choose>
								<c:when test="${sellerList[0] ne null}">
									<h4>판매 거래 정보 목록</h4>
									<div class="trading-table">
										<table class="trading" border="1" style="width:100% !important">
											<tr>
												<th>관련 게시글</th>
												<th>구매자 아이디</th>
												<th>판매자 아이디</th>
												<th>상태</th>
												<th>거래일자</th>
												<th>인증 QR 발급</th>
											</tr>
									<c:forEach var="sell" items="${sellerList}" varStatus="status">
										<tr>
											<td><a class="herf" href="${pageContext.request.contextPath}/board/${sell.boardNo}">${sellerBoardList[status.index].title}</a></td>
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
											<c:if test="${sell.status eq 'M'}">
												<td>
													<c:if test="${sell.buyerId eq ''}">
														<input class="trading-qr-btn" id="sellQRBtn${sell.boardNo}" type='button' value="QR인증키 발급" onclick="sellQR(${sell.boardNo})">
													</c:if>
												</td>
												<div class="modal qr" id="sellQrModal${sell.boardNo}" 
														tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
											<!-- 				<div class="modal-header"> -->
											<!-- 				</div> -->
															<div class="modal-body">
																<div class="col-12">
																	<div class="qr-timer" id="sellTimer${sell.boardNo}"></div>
																	<img class="trading-qr" id="sellQR${sell.boardNo}" src=''>
																</div>
															</div>
											<!-- 				<div class="modal-footer"> -->
											<!-- 				</div> -->
														</div>
													</div>
												</div>
											</c:if>
										</tr>
									</c:forEach>
									</table>
									</div>
								</c:when>
							</c:choose>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

<script>
	
	function sellTimer(sec, no) {
		$("#sellTimer"+no).text(sec + "초 뒤 창이 닫힙니다.");
		for (var i = 0 ; i < sec ; i++) {
			setTimeout(function() {
				$("#sellTimer"+no).text(--sec + "초 뒤 창이 닫힙니다.");
				if (sec <= 0) {
					$('#sellQrModal'+no).modal('hide');
					$('#sellTimer'+no).text('');
				}
			}, 1000+(i*1000));
		}
	}
	
	function buyTimer(sec, no) {
		$("#buyTimer"+no).text(sec + "초 뒤 창이 닫힙니다.");
		for (var i = 0 ; i < sec ; i++) {
			setTimeout(function() {
				$("#buyTimer"+no).text(--sec + "초 뒤 창이 닫힙니다.");
				if (sec <= 0) {
					alert(sec);
					$('#buyQrModal'+no).modal('hide');
					$('#buyTimer'+no).text('');
				}
			}, 1000+(i*1000));
		}
	}
	
	function sellQR(no) {
		if ($('#sellTimer'+no).text() <= 0 || $('#sellTimer'+no).text() == null) {
			$.ajax({
				url : '${pageContext.request.contextPath}/payment/qr',
				type : 'POST',
				data : "no="+no,
				success : function(result) {
					$('#sellQrModal'+no).modal('show');
					$('#sellQR'+no).attr('src', 'data:image/png;base64, ' + result);
					sellTimer(30, no);
				}, error : function() {
					console.log("error");
				}
			});
		} else {
			$('#sellQrModal'+no).modal('show');
		}
	}
	
	function buyQR(no) {
		if ($('#buyTimer'+no).text() <= 0 || $('#buyTimer'+no).text() == null) {
			$.ajax({
				url : '${pageContext.request.contextPath}/payment/qr',
				type : 'POST',
				data : "no="+no,
				success : function(result) {
					$('#buyQrModal'+no).modal('show');
					$('#buyQR'+no).attr('src', 'data:image/png;base64, ' + result);
					buyTimer(30, no);
				}, error : function() {
					console.log("error");
				}
			});
		} else {
			$('#buyQrModal'+no).modal('show');
		}
	}

</script>
