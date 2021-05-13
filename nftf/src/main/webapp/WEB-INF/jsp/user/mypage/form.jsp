<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
	<div class="row">
		<h2>마이 페이지</h2><br>
		<h4>비밀번호 확인</h4>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<form id="form" action="${pageContext.request.contextPath}/user/form/${id}" method="post" >
				<div class="row">
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호"> <br>
			 	</div>
				<div class="row">
					<input id="signupBtn" type="button" onclick="pwSubmit()" value="확인">
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	function pwSubmit() {

		if ($('#inputPw').val() != '') {
				$('#form').submit();
		}
		else {
			alert('비밀번호를 입력해 주세요');
		}
	}
</script>
</html>