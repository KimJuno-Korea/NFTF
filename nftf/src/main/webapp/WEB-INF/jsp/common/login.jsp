<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="row">
		<h2>로그인</h2>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<form action="/nftf/login" method="post" >
				<div class="row">
					<input id="inputId" type="text" name="id" placeholder="아이디"> <button type="submit" id="loginBtn">로그인</button> <br>
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호"> <br>
			 	</div>
			</form>
		</div>
	</div>
</body>

<!-- 이거 나중에 바텀에 추가하면된다. -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
</script>
</html>