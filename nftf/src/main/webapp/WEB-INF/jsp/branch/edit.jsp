<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<h1> 지점 수정 화면 </h1>
	<form action="/branch" method="post">
		<input type="hidden" name="_method" value="put"/>
		
		<div>
		<label>지점 코드</label>
		<h2>${branch.code}</h2>
		
		</div>
		<div>
		<label>지점 명
			<input type="text" name="name" value="${branch.name}"/>
		</label>
		</div>
		<div>
		<label>지점 위도
			<input type="text" name="latitude" placeholder="${branch.latitude}"/>
		</label>
		</div>
		<div>
		<label>지점 경도
			<input type="text" name="longtitude" placeholder="${branch.longtitude}"/>
		</label>
		</div>
		<div>
		<label>지점 상태
			<select name="status" >
				<c:choose>
					<c:when test="${branch.status eq 'Y'}">
						<option value="Y" selected> Y </option>
						<option value="N"> N </option>
					</c:when>
					<c:otherwise>
						<option value="Y"> Y </option>
						<option value="N" selected> N </option>
					</c:otherwise>
				</c:choose>
			</select>
		</label>
		</div>
		<input type="submit" value="지점 수정">
	</form>
</body>
</html>