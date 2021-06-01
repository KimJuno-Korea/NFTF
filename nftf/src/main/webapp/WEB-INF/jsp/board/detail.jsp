<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<c:set var="board" value="${board }" />
<section>
		<div class="block">
			<div class="container">
				 <div class="row">
				 	<div class="col-lg-10 column">
				 	<div class="tags-share" style="border-top: 0px; border-bottom:0px">
						 			<div class="tags_widget">
						 				<c:choose>
											<c:when test="${board.division eq 'S'}">
							 					<a style="cursor: default; background: blue">
												<b style="color: white">구매</b>
												</a>
											</c:when>
											<c:when test="${board.division eq 'B'}">
												<a style="cursor: default; background: red">
												<b style="color: white;">판매</b>
								 				</a>
											</c:when>
										</c:choose>
						 				<c:choose>
											<c:when test="${board.tradeWay eq 'D'}">
							 					<a style="cursor: default;">
												<b style="color:black">직거래</b>
												</a>
											</c:when>
											<c:when test="${board.tradeWay eq 'P'}">
												<a style="cursor: default;">
												<b style="color:black">택배</b>
								 				</a>
											</c:when>
											<c:when test="${board.tradeWay eq 'T'}">
												<a style="cursor: default">
												<b style="color:black">거래함</b>
								 				</a>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${board.status eq 'S'}">
							 					<a style="cursor: default; background: red">
												<b style="color:white">거래완료</b>
												</a>
											</c:when>
											<c:when test="${board.status eq 'M'}">
												<a style="cursor: default; background: green">
												<b style="color:white">거래가능</b>
								 				</a>
											</c:when>
											<c:when test="${board.status eq 'W'}">
												<a style="cursor: default; background: blue">
												<b style="color:white">결제대기</b>
								 				</a>
											</c:when>
										</c:choose>
						 		</div>
				 		</div>
				 		<div class="blog-single">
				 		<h2>${board.title }</h2>
				 		
				 		<ul class="post-metas">
				 			<li style="float:right">
				 				<a style="cursor:default">
				 				<i class="la la-calendar-o">
				 				</i>${board.registrateDate }</a>
				 			</li>
				 			<li style="float:right">
				 				<a style="cursor:default">
				 				${board.userId }
				 				</a>
				 			</li>
				 		</ul>
				 		
						<div class="board-photo">
								<c:forEach var="photo" items="${photoList }">
									<img src="<%=request.getContextPath() %>/photo/${photo.no}" style="width:32.5%; height:280px" />
								</c:forEach>
						</div>

						<p style="font-size: 15px;margin-top: 20px;font-weight: bold;">${board.content }</p>
				 			<div class="comment-sec">
				 				<h3>댓글</h3>
				 				<ul class="replyList">
				 					<%@ include file="../board/reply.jsp" %>
				 				</ul>
				 			</div>
				 			
				 			<div class="commentform-sec">
				 				<h3>댓글 작성</h3>
				 				
				 				<form style="padding-right: 0px;" name="replyInsertForm">
									<input type="hidden" name="boardNo" value="${board.no}" />
									<input type="hidden" name="userId" value="${sessionScope.id}" />
									<div class="row">
				 						<div class="col-lg-12">
					 						<div class="pf-field">
					 							<textarea name="content"></textarea>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<button type="button" name="replyInsertBtn">댓글 등록</button>
					 					</div>
				 					</div>
				 				</form>
				 				
				 			</div>
				 		</div>
					</div>
					
					<aside class="col-lg-2 column">
						<form action="<%=request.getContextPath()%>/board/${board.no}" method="post" id="deleteAction">
							<input type="hidden" name="_method" value="DELETE" />
							<div class="widget">
				 				<div class="search_widget_job no-margin">
				 						<a class="button-custom" onClick="location.href='/board?num=1'">목록으로</a>
				 				</div>
				 			</div>
				 			<c:if test="${sessionScope.id == board.userId }">
				 				<div class="widget">
				 					<div class="search_widget_job no-margin">
				 						<a class="button-custom" onClick="location.href='/board/${board.no}/form'">수정</a>
				 					</div>
				 				</div>
				 				<div class="widget">
				 					<div class="search_widget_job no-margin">
			 							<a class="button-custom" onClick="del()">삭제</a>
				 					</div>
				 				</div>
				 			</c:if>
				 				<div class="widget">
				 				<%-- <c:if test="${board.status ne 'W'}"> (기존) --%>
				 	    		<c:if test="${board.status eq 'M'}"> <!-- (변경) M:거래가능, W:결제대기(거래중), S:거래완료 -->
				 	    			<a class="payment-button" onclick="buy()">구매하기</a>
				 	    		</c:if>
				 	    		</div>
				 		
				 		</form>
					</aside>
				 </div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

<script>
	function del() {
		var chk = confirm("해당 게시글을 삭제하시겠습니까?");
		if (chk) {
			document.deleteAction.submit;
		}
	}

	function guid() {
		  function _s4() {
		    return ((1 + Math.random()) * 0x10000 | 0).toString().substring(1);
		  }
		  return _s4() + _s4()  + _s4();
	}
	
	function setting() {
		var data = {
				"no" : "${board.no}"
		}
		
		$.ajax({
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			url : 'http://localhost/payment',
			type : 'PUT',
			data : JSON.stringify(data),
			success : function(result) {
				if (result) {
					console.log("성공");
				}
			}, error : function() {
				console.log("에러");
			}
		});
	}

	function getNow() {
		var now = new Date();
		var year = now.getFullYear();
		var month;
		var day = now.getDate().toString();
		
		if (now.getMonth() < 9) {
			month = "0" + (now.getMonth() + 1);
		} else {
			month = now.getMonth() + 1;
		}
		
		return year + month + day;
	}
	
	function buy() {
		if (confirm("환불이 불가능합니다. 구매 하시겠습니까?")) {
			var data = {
				    "Header": {
				        "ApiNm": "DrawingTransfer",
				        "Tsymd": getNow(),
				        "Trtm": "000000",
				        "Iscd": "000964",
				        "FintechApsno": "001",
				        "ApiSvcCd": "DrawingTransferA",
				        "IsTuno": guid(),
				        "AccessToken": "d75c7bca19d5354441a7b338903a60dcf7caad919f106fc3a004f8a67a5d6860"
				    },
				    "FinAcno" : "${pin}",
				    "Tram":"${board.price}"
			}
			
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : 'https://developers.nonghyup.com/DrawingTransfer.nh',
				type : 'POST',
				data : JSON.stringify(data),
				success : function(result) {
					setting();
					console.log(result);
					alert("구매 성공 : 마이페이지에서 인증키 QR을 발급 받으세요");
				}, error : function() {
					console.log("에러");
				}
			});
		} else {
			alert("취소됨");
		}
	}
</script>
</html>