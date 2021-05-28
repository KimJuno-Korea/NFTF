<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<c:set var="board" value="${board }" />

<section>
		<div class="block">
			<div class="container">
				 <div class="row">
				 	<div class="col-lg-9 column">
				 		<div class="blog-single">
						<div class="bs-thumb">
							<c:forEach var="photo" items="${photoList }">
								<img src="<%=request.getContextPath() %>/photo/${photo.no}" />
							</c:forEach>
						</div>
						
						
						<ul class="post-metas">
				 				<li>
				 					<a style="cursor: default">
				 					${board.userId }
				 					</a>
				 				</li>
				 				<li>
				 					<a>
				 					<i class="la la-calendar-o">
				 					</i>${board.registrateDate }</a>
				 				</li>
				 			</ul>

						<h2>${board.title }</h2>
						
						<p>${board.content }</p>
						<div class="tags-share">
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
												<b>택배</b>
								 				</a>
											</c:when>
											<c:when test="${board.tradeWay eq 'T'}">
												<a style="cursor: default">
												<b>거래함</b>
								 				</a>
											</c:when>
										</c:choose>
						 				<a style="cursor: default">Travel</a>
						 				<c:choose>
											<c:when test="${list.status eq 'S'}">
												<b style="color: red;">&nbsp;거래완료</b>
											</c:when>
											<c:when test="${list.status eq 'M'}">
												<b style="color: green;">&nbsp;거래가능</b>
											</c:when>
										</c:choose>
						 			</div>
				 			</div>
				 			<div class="comment-sec">
				 				<h3>댓글</h3>
				 				<ul>
				 					<li>
				 						<div class="comment">
				 							<div class="comment-detail">
				 								<h3>Ali TUFAN</h3>
				 								<div class="date-comment"><a href="#" title=""><i class="la la-calendar-o"></i>Jan 16, 2016 07:48 am</a></div>
				 								<p>Far much that one rank beheld bluebird after outside ignobly allegedly more when oh arrogantly vehement tantaneously eel valiantly petted this along across highhandedly much. </p>
				 							</div>
				 						</div>
				 					</li>
				 					<li>
				 						<div class="comment">
				 							<div class="comment-detail">
				 								<h3>Kate ROSELINE</h3>
				 								<div class="date-comment"><a href="#" title=""><i class="la la-calendar-o"></i>Jan 16, 2016 07:48 am</a></div>
				 								<p>Far much that one rank beheld bluebird after outside ignobly allegedly more when oh arrogantly vehement tantaneously eel valiantly petted this along across highhandedly much. </p>
				 							</div>
				 						</div>
				 					</li>
				 					<li>
				 						<div class="comment">
				 							<div class="comment-detail">
				 								<h3>Luis DANIEL</h3>
				 								<div class="date-comment"><a href="#" title=""><i class="la la-calendar-o"></i>Jan 16, 2016 07:48 am</a></div>
				 								<p>Far much that one rank beheld bluebird after outside ignobly allegedly more when oh arrogantly vehement tantaneously eel valiantly petted this along across highhandedly much. </p>
				 							</div>
				 						</div>
				 					</li>
				 				</ul>
				 			</div>
				 			<div class="commentform-sec">
				 				<h3>댓글 작성</h3>
				 				<form>
				 					<div class="row">
				 						<div class="col-lg-12">
					 						<div class="pf-field">
					 							<textarea></textarea>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<button type="submit">Post Comment</button>
					 					</div>
				 					</div>
				 				</form>
				 			</div>
				 		</div>
					</div>
					<aside class="col-lg-3 column">
						<div class="widget">
				 			<div class="search_widget_job no-margin">
				 				<div class="field_w_search">
				 					<input placeholder="Search Keywords" type="text">
				 					<i class="la la-search"></i>
				 				</div><!-- Search Widget -->
				 			</div>
				 		</div>
					</aside>
				 </div>
			</div>
		</div>
	</section>




<h1>게시글 상세 페이지</h1>

	<div class="goods">
		<div class="goodsImg">
			<c:forEach var="photo" items="${photoList }">
				<img src="<%=request.getContextPath() %>/photo/${photo.no}" />
			</c:forEach>
		</div>
	</div>
	<div class="goodsInfo">
		번호 : ${board.no } <br>
		아이디 : ${board.userId }<br>
		제목 : ${board.title }<br>
		내용 : ${board.content }<br>
		가격 : ${board.price }<br>
		구분 : <c:choose>
				<c:when test="${board.division eq 'S'}">
					구매
				</c:when>
				<c:when test="${board.division eq 'B'}">
					판매
				</c:when>
			  </c:choose><br>
		거래방식 :<c:choose>
					<c:when test="${board.tradeWay eq 'D'}">
						직거래
					</c:when>
					<c:when test="${board.tradeWay eq 'P'}">
						택배
					</c:when>
					<c:when test="${board.tradeWay eq 'T'}">
						거래함
					</c:when>
				</c:choose><br>
		상태 : <c:choose>
				<c:when test="${board.status eq 'S'}">
					거래완료
				</c:when>
				<c:when test="${board.status eq 'M'}">
					거래중
				</c:when>
				<c:when test="${board.status eq 'W'}">
					결제 후 수령 대기중
				</c:when>
			  </c:choose><br>
		작성일자 : ${board.registrateDate }<br>
		</div>
	
	<form action="<%=request.getContextPath()%>/board/${board.no}" method="post" id="deleteAction">
		<input type="hidden" name="_method" value="DELETE" />
		<input type="button" onClick="location.href='/board?num=1'" value="목록으로" />
		<c:if test="${sessionScope.id == board.userId }">
			<input type="button" onClick="location.href='/board/${board.no}/form'" value="수정" />
			<button onClick="del()">삭제</button>
		</c:if>
	</form>
	<br>
	<div class="container">
        <label for="content"></label>
        <form name="replyInsertForm">
            <div class="input-group">
               <input type="hidden" name="boardNo" value="${board.no}"/>
               <input type="hidden" name="userId" value="${sessionScope.id}"/>
               <textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
               <span class="input-group-btn">
                    <button type="button" name="replyInsertBtn">등록</button>
               </span>
              </div>
              <hr>
        </form>
    </div>
	<div class="container">
        <div class="replyList"></div>
    </div>
    <div class="row">
    	<c:if test="${board.status ne 'W'}">
	    	<input type="button" value="구매" onclick="buy()">
    	</c:if>
    </div>
	
	<%@ include file="../board/reply.jsp" %>
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
<script>
	var myImage = document.getElementById("mainImage");
	var imageArray = [ "/blog/resource/img/m1.jpg",
			"/blog/resource/img/m2.jpg", "/blog/resource/img/m3.jpg" ];
	var imageIndex = 0;

	function changeImage() {
		myImage.setAttribute("src", imageArray[imageIndex]);
		imageIndex++;
		if (imageIndex >= imageArray.length) {
			imageIndex = 0;
		}
	}
	setInterval(changeImage, 3000);
</script>
</html>