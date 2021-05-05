<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 지점 목록 조회 화면 </h1>
	<table border="1">
		<thead>
			<tr>
			<th>지점 코드</th>
			<th>지점 명</th>
			<th>지점 위도</th>
			<th>지점 경도</th>
			<th>지점 상태</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${branchList}" var="branch">
					<tr>
						<td><c:out value="${branch.code}" /></td>
						<td><a href="/tradingbox/${branch.name}"><c:out value="${branch.name}" /></a></td>
						<td><c:out value="${branch.latitude}" /></td>
						<td><c:out value="${branch.longtitude}" /></td>
						<td><c:out value="${branch.status}" /></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	
	<a href="/branch/form" ><input type="button" value="등록"/></a>
</body>
</html>