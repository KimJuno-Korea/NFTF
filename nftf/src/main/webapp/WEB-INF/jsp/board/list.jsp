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
					<td><a href="<%=request.getContextPath() %>/nftf/board/${list.no}">${list.title }</a></td>
					<td>${list.content }</td>
					<td>${list.price }</td>
					<td>${list.division }</td>
					<td>${list.tradeWay }</td>
					<td>${list.status }</td>
					<td>${registrateDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button onclick="location.href='<%=request.getContextPath()%>/nftf/board/form'">등록하기</button>

</body>
</html>