<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<section class="overlape">
		<div class="block no-padding">
			<div data-velocity="-.1" style="background: url(&quot;https://placehold.it/1600x800&quot;) 50% -97.9px repeat scroll transparent;" class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
			<div class="container fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner-header">
							<h3>Employer</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
	<div class="block less-top">
		<div class="container">
		<aside class="col-lg-3 column margin_widget">
				 		<div class="widget">
				 			<div class="search_widget_job">
				 				<div class="field_w_search">
				 					<input type="text" placeholder="게시글 제목을 입력하세요." id="keyword">
				 					<button id="searchBtn" style="padding:0px 0px;"><i class="la la-search"></i></button>
				 				</div><!-- Search Widget -->
				 			</div>
				 		</div>
				 		<div class="widget border">
				 			<h3 class="sb-title open">구분</h3>
				 			<div class="specialism_widget" style="">
				 				<div class="simple-checkbox">
									<p><input type="checkbox" name="spealism" id="as"><label for="as">팝니다 </label></p>
									<p><input type="checkbox" name="spealism" id="asd"><label for="asd">삽니다 </label></p>
								</div>
				 			</div>
				 		</div>
				 		<div class="widget border">
				 			<h3 class="sb-title open">거래방식</h3>
				 			<div class="specialism_widget" style="">
				 				<div class="simple-checkbox">
									<p><input type="checkbox" name="spealism" id="as"><label for="as">직거래 </label></p>
									<p><input type="checkbox" name="spealism" id="asd"><label for="asd">택배 거래 </label></p>
									<p><input type="checkbox" name="spealism" id="errwe"><label for="errwe">거래함</label></p>
				 				</div>
				 			</div>
				 		</div>
				 	</aside>
	<input type="text" placeholder="게시글 제목을 입력하세요." id="keyword">
	<!-- <button id="searchBtn">검색</button> -->
	<div id="display">
		<table border="1">
			<thead>
				<tr>
					<td>사진</td>
					<td>번호</td>
					<td>아이디</td>
					<td>제목</td>
					<td>내용</td>
					<td>가격</td>
					<td>구분</td>
					<td>거래방식</td>
					<td>상태</td>
					<td>작성일자</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${boardList }" varStatus="board">
					<tr>
						<td><img src="<%=request.getContextPath()%>/photo/thumbnail/${list.no}"></td>
						<td>${count - board.index }</td>
						<td>${list.userId }</td>
						<td><a href="/board/${list.no}">${list.title }</a></td>
						<td>${list.content }</td>
						<td>${list.price }</td>
						<td>
							<c:choose>
								<c:when test="${list.division eq 'S'}">
									구매
								</c:when>
								<c:when test="${list.division eq 'B'}">
									판매
								</c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${list.tradeWay eq 'D'}">
									직거래
								</c:when>
								<c:when test="${list.tradeWay eq 'P'}">
									택배
								</c:when>
								<c:when test="${list.tradeWay eq 'T'}">
									거래함
								</c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${list.status eq 'S'}">
									거래완료
								</c:when>
								<c:when test="${list.status eq 'M'}">
									거래중
								</c:when>
							</c:choose>
						</td>
						<td>${list.registrateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${paging.prev}">
			<span>[ <a href="<%=request.getContextPath() %>/board?num=1">처음</a>
				]
			</span>
			<span>[ <a href="<%=request.getContextPath() %>/board?num=${paging.startPageNum - 1}">이전</a>
				]
			</span>
		</c:if>
		<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}" var="num">
			<span> 
				<c:if test="${select != num}">
					<a href="<%=request.getContextPath() %>/board?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${paging.next}">
			<span>[ <a href="<%=request.getContextPath() %>/board?num=${paging.endPageNum + 1}">다음</a>
				]
			</span>
		</c:if>
	</div>
	<c:if test="${sessionScope.userId != null }">
		<button onclick="location.href='/board/form'">등록하기</button>
	</c:if>
	
	
	
	
	
	</div>
</div>
</section>

<script>
	document.getElementById('searchBtn').addEventListener('click', ajax_call);
	
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
					document.getElementById('display').innerHTML = html;
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

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
</html>