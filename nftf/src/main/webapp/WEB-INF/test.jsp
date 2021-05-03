<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 페이지</title>
</head>
<body>
${user.id}<br>
${user.email}
${user.division}
	<c:choose>
		<c:when test="${fn:contains(user.division, 'A')}">
			<h1>어드민 입니다.</h1>
		</c:when>
		<c:when test="${fn:contains(user.division, 'M')}">
			<h1>일반회원 입니다.</h1>
		</c:when>
		<c:when test="${fn:contains(user.division, 'D')}">
			<h1>탈퇴한 회원 입니다.</h1>
		</c:when>
	</c:choose>
</body>
</html>