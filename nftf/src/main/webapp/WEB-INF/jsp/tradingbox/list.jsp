<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 거래함 조회 화면 </h1>
	<h2> </h2>
	<table border="1">
		<thead>
			<tr>
			<th>거래함 번호</th>
			<th>관련 게시글 링크</th>
			<th>상태</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${tradingBoxList}" var="tradingBox">
					<tr>
						<td><c:out value="${tradingBox.no}" /></td>
						<td><a href="/branch/${tradingBox.boardNo}">${boardNo}</a></td>
						<td><c:out value="${tradingBox.status}" /></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	
	<a href="/branch/${name}form" ><input type="button" value="수정"/></a>
	<form action="/branch/${name}" method="post">
		<input type="submit" value="삭제" />
		<input type="hidden" name="_method" value="delete"/>
	</form>
</body>
</html>