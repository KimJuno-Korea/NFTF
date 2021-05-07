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
						<td>${board.count }</td>
						<td>${list.userId }</td>
						<td><a href="/nftf/board/${list.no}">${list.title }</a></td>
						<td>${list.content }</td>
						<td>${list.price }</td>
						<td>${list.division }</td>
						<td>${list.tradeWay }</td>
						<td>${list.status }</td>
						<td>${list.registrateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${sessionScope.userId != null }">
		<button onclick="location.href='/nftf/board/form'">등록하기</button>
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
						html += "<td><a href=\"/nftf/board/" + no + "\">"
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
			xhr.open("POST", "http://localhost/nftf/boardsearch", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send(data);
		};
</script>
</html>