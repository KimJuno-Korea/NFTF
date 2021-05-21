<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 목록 조회 페이지</h1>
	<input type="text" placeholder="게시글 제목을 입력하세요." id="keyword">
	<button id="searchBtn">검색</button>
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
	<h1>test</h1>
</body>
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
			xhr.open("POST", "http://localhost/boardsearch", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send(data);
		};
</script>
</html>