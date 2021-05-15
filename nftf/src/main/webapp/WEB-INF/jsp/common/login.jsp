<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
</head>
<body>
	<div class="account-popup">
		<h2 class="title">로그인</h2>
			<form action="/login" method="post" >
				<div class="cfield">
					<input id="inputId" type="text" name="id" placeholder="아이디"> <i class="la la-user"></i> 
			 	</div>
			 	<div class="cfield">
			 		<input id="inputPw" type="text" name="pw" placeholder="비밀번호"> <i class="la la-key"></i>
				</div>
				<input type="submit" id="loginBtn" value="로그인">
			</form>
	</div>
</body>

<!-- 이거 나중에 바텀에 추가하면된다. -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
</script>
</html>