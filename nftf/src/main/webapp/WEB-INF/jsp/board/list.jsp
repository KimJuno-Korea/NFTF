<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<c:set var="list" value="${list }" />

	<section>
		<div class="block no-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>게시글 목록</h3>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index" title="">Home</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
	<div class="block less-top">
		<div class="container">
			<div class="row">
				<aside class="col-lg-3 column margin_widget">
					<div class="widget">
						<h3 class="sb-title open">구분</h3>
						<div class="posted_widget">
							<input type="radio" name="division" id="232" checked><label for="232">전체</label><br>
							<input type="radio" name="division" id="wwqe"><label for="wwqe">판매</label><br>
							<input type="radio" name="division" id="all"><label for="all">구매</label><br>
						</div>
					</div>
					
					<div class="widget">
						<h3 class="sb-title open">거래방식</h3>
						<div class="posted_widget">
							<input type="radio" name="tradeWay" value="" id="all2" checked><label for="all2">전체</label><br>
							<input type="radio" name="tradeWay" value="D" id="qwe"><label for="qwe">직거래</label><br>
							<input type="radio" name="tradeWay" value="P" id="wqe"><label for="wqe">택배 거래</label><br>
							<input type="radio"	name="tradeWay" value="T" id="qweqw"><label class="nm" for="qweqw">거래함</label><br>
						</div>
					</div>
					<div class="widget">
						<div class="search_widget_job">
							<div class="field_w_search">
								<input type="text" placeholder="검색할 제목을 입력하세요." id="keyword">
								<button id="searchBtn" style="padding: 0px 0px;">
									<i class="la la-search"></i>
								</button>
							</div>
							<!-- Search Widget -->
							<c:if test="${sessionScope.id != null }">
			 					<a class="apply-thisjob" onclick="location.href='/board/form'" style="padding:10px 30px;">등록하기</a>
			 				</c:if>
						</div>
					</div>
				</aside>
				<div class="col-lg-9 column">
					<div class="emply-list-sec style2">
						<!-- Employe List -->
						<c:forEach var="list" items="${boardList }" varStatus="board">
							<div class="emply-list">
								<div class="emply-list-thumb">
									<img src="<%=request.getContextPath()%>/photo/thumbnail/${list.no}">
								</div>
								<div class="emply-list-info">
									<div class="emply-pstn">
										<c:choose>
											<c:when test="${list.division eq 'S'}">
												<b style="color: #4381ff;">판매&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.division eq 'B'}">
												<b style="color: #fb236a;">구매&nbsp;&nbsp;</b>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${list.tradeWay eq 'D'}">
												<b style="color: black;">&nbsp;&nbsp;직거래&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.tradeWay eq 'P'}">
												<b style="color: black;">&nbsp;&nbsp;택배&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.tradeWay eq 'T'}">
												<b style="color: black;">&nbsp;&nbsp;거래함&nbsp;&nbsp;</b>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${list.status eq 'S'}">
												<b style="color: #fb236a;">&nbsp;&nbsp;거래완료&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.status eq 'M'}">
												<b style="color: #1ede3e;">&nbsp;&nbsp;거래가능&nbsp;&nbsp;</b>
											</c:when>
										</c:choose>
									</div>
									<h3>
										<a href="/board/${list.no}">${list.title }</a>
									</h3>
									<c:choose>
											<c:when test="${list.division eq 'S'}">
												<span  style="color:#4381ff"><fmt:formatNumber value="${list.price}" pattern="#,###,###"/> ￦</span>

											</c:when>
											<c:when test="${list.division eq 'B'}">
												<span  style="color:#fb236a"><fmt:formatNumber value="${list.price}" pattern="#,###,###"/> ￦</span>
											</c:when>
										</c:choose>
									<h6>
<!-- 										<i class="la la-map-marker"></i> 천안지점 아직 하드코딩 되어잇음 -->
									</h6>
									<p>${list.content }</p>
								</div>
							</div>
						</c:forEach>
						<!-- Pagination -->
					</div>

				<div id="search"></div>

				<div class="pagination">
					<ul>
					<c:if test="${paging.prev}">
						<li class="prev">
							<a href="<%=request.getContextPath() %>/board?num=${paging.startPageNum - 1}">
								<i class="la la-long-arrow-left"></i>이전
							</a>
						</li>
					</c:if>

					<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}" var="num">
						<c:if test="${select != num}">
							<li><a href="<%=request.getContextPath() %>/board?num=${num}">${num}</a></li>
						</c:if>
						<c:if test="${select == num}">
							<li class="active">
								<a style="font:bold;">${num}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${paging.next}">
						<li class="next">
							<a href="<%=request.getContextPath() %>/board?num=${paging.endPageNum + 1}">다음
								<i class="la la-long-arrow-right"></i>
							</a>
						</li>
					</c:if>
					</ul>
				</div>

				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

<script>
	document.getElementById('searchBtn').addEventListener('click', ajax_call);
	
	function boardPrice(price){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return price.toString().replace(regexp, ',');
	}

	function ajax_call() {
		var xhr = new XMLHttpRequest();
		var data = "keyword=" + document.getElementById('keyword').value;
		xhr.onreadystatechange = function() {
			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200 || xhr.status === 201) {
					var html = "<table border=\"1\">"
							+ "<thead>"
							+ "<tr>"
							+ "<td>번호</td>"
							+ "<td>아이디</td>"
							+ "<td>제목</td>"
							+ "<td>내용</td>"
							+ "<td>가격</td>"
							+ "<td>구분</td>"
							+ "<td>거래방식</td>"
							+ "<td>상태</td>"
							+ "<td>작성일자</td>"
							+ "</tr>"
							+ "</thead>"
					var msg = JSON.parse(xhr.responseText);
					html += "<tbody>";
					for (var i = 0; i < msg.length; i ++) {
						var no = msg[i].no;
						html += "<tr>";
						html += "<td>" + (i + 1) + "</td>";
						html += "<td><a href=\"/board/" + no + "\">"
								+ msg[i].userId + "</a></td>";
						html += "<td>" + msg[i].title + "</td>";
						html += "<td>" + msg[i].content + "</td>";
						html += "<td>" + msg[i].price + "</td>";
						html += "<td>" + msg[i].division + "</td>";
						html += "<td>" + msg[i].tradeWay + "</td>";
						html += "<td>" + msg[i].status + "</td>";
						html += "<td>" + msg[i].registrateDate + "</td>";
						html += "</tr>";
					}
					html += "</tbody>";
					document.getElementById('search').innerHTML = html;
					} else {
						console.error(xhr.responseText);
					}
				}
			};
			xhr.open("POST", "https://localhost/boardsearch", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send(data);
		};
</script>

</html>
