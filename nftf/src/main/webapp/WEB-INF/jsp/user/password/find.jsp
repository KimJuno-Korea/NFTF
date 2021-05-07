<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="row">
		<h2>비밀번호 찾기</h2>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<form action="${pageContext.request.contextPath}/password" method="post" >
				<div class="row">
					<input id="inputId" type="text" name="id" placeholder="아이디"><br>
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호"> <button id="responseKey">인증번호 발송</button><br>
					<input id="inputKey" type="text" name="key" placeholder="인증번호"> <button id="checkKey">인증번호 확인</button><br>
			 	</div>
				<div class="row">
					<button id="findPwBtn" type="submit">다음</button>
				</div>
			</form>
		</div>
	</div>
</body>

<script>
</script>
</html>