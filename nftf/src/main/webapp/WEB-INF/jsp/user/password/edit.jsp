<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div class="row">
		<h2>비밀번호 변경</h2>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<form action="${pageContext.request.contextPath}/password/${id}" method="post" >
				<div class="row">
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호"><input id="checkPw" type="text" disabled="disabled"></input><br>
					<input id="inputCheckPw" type="text" name="pwCheck" placeholder="비밀번호 확인"><br>
			 	</div>
				<div class="row">
					<button id="editPwBtn" type="submit">확인</button>
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