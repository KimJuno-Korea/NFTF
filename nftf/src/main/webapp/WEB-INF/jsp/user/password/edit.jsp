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
		<div id="data"></div>
			<form id="form" action="${pageContext.request.contextPath}/password/${id}" method="post" >
				<div class="row">
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호"><div id="viewPw"></div>
					<input id="inputCheckPw" type="text" name="pwCheck" placeholder="비밀번호 확인"><div id="viewCheckPw"></div>
			 	</div>
				<div class="row">
					<input id="submitBtn" type="button" onclick="editPwSubmit()" value="확인">
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
				$('#viewCheckPw').text('비밀번호가 일치하지 않습니다');
				$('#viewCheckPw').css('color', 'red');
				$('#data').data('checkPw', false);
			} else {
				$("#viewCheckPw").text('비밀번호가 일치합니다.');
				$('#viewCheckPw').css('color', 'green');
				$('#data').data('checkPw', true);
			} 
		}
	});
	
	$("#inputPw").blur(function(){
		if($("#inputPw").val() != '') {
			$('#inputCheckPw').val('');			
			if ($('#inputPw').val() == '${pw}') {
				$('#viewPw').text('기존의 비밀번호와 일치합니다.');
				$('#viewPw').css('color', 'red');
				$('#data').data('editPw', false);
			} else {
				$("#viewPw").text('사용할 수 있는 비밀번호 입니다.');
				$('#viewPw').css('color', 'green');
				$('#data').data('editPw', true);
			}
		}
	});
	
	function editPwSubmit() {
		
		if ($('#data').data('checkPw')) {
			
			if ($('#data').data('editPw')) {
				$('#form').submit();
				
			} else {
				alert('기존의 비밀번호와 일치하면 안됩니다.')
			}
			
		} else {
			alert('비밀번호가 일치 하지 않습니다.');
		}
	}
	
</script>
</html>