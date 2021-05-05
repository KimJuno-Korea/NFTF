<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<div class="row">
		<h2>회원 가입</h2>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<form action="/nftf/user" method="post" >
				<div class="row">
					<!-- 중복확인 url 필요 -->
					<input id="inputId" type="text" name="id" placeholder="아이디"> <button id="checkId">중복 확인</button> <br>
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호"> <br>
					<input id="inputCheckPw" type="text" name="pwCheck" placeholder="비밀번호 확인"> <input id="checkPw" type="text" disabled="disabled"></input><br>
					<!-- 인증번호 보내는 url 필요 -->
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호"> <button id="responseKey">인증번호 발송</button><br>
					<!-- 인증번호 확인 url 필요 -->
					<input id="inputKey" type="text" name="key" placeholder="인증번호"> <button id="checkKey">인증번호 확인</button><br>
					<!-- 위에 3개다 비동기로 처리해야함 -->
					<input id="division" type="hidden" name="division" value="M">
					<input id="email" type="hidden" name="email" value="">
			 	</div>
				<div class="row">
					<button id="signupBtn" type="submit">가입 하기</button>
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$("#inputCheckPw").blur(function() {
		if ($('#inputPw').val() != '') {
			if ($('#inputPw').val() != $(this).val()){
				$('#inputCheckPw').val('');
				$('#checkPw').val('비밀번호가 일치하지 않습니다');
				$('#checkPw').css('color', 'red');
			} else {
				$("#checkPw").val('비밀번호가 일치합니다.');
				$('#checkPw').css('color', 'green');
			} 
		}
	});
</script>
</html>