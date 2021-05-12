<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<form id="form" action="${pageContext.request.contextPath}/user" method="post" >
				<div class="row">
					<input id="inputId" type="text" name="id" placeholder="아이디" maxlength="30" > <div id="viewCheckId" class="checkFont"></div>
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호" maxlength="30"> <br>
					<input id="inputCheckPw" type="text" name="pwCheck" placeholder="비밀번호 확인" maxlength="30"> <div id="viewCheckPw" class="checkFont"></div>
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호" maxlength="30" > <input type="button" id="responseKeyBtn" onclick="receiveKey()" value="인증번호 발송"><br>
					<input id="inputKey" type="text" name="key" placeholder="인증번호" disabled="disabled" maxlength="30" required> <div id="viewCheckKey" class="checkFont"></div>
					<input id="division" type="hidden" name="division" value="M">
					<input id="email" type="hidden" name="email" value="">
					<div id="data"></div>
			 	</div>
				<div class="row">
					<input type="button" id="signupBtn" onclick="signupSubmit()" value="가입하기">
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
//검증 , 정규식 사용해야됨

	$("#inputCheckPw").blur(function() {
		if ($('#inputPw').val() != '') {
			if ($('#inputPw').val() != $(this).val()){
				$('#inputCheckPw').val('');
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
	
	$('#inputId').blur(function() {
		if ($('#inputId') != null) {
			 var id = {
					 "id" : $("#inputId").val()
			 }
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/check',
				type : 'POST',
				data : JSON.stringify(id),
				success : function(result) {
					if (result == true) {
						$("#viewCheckId").text('사용할 수 있는 아이디 입니다.');
						$('#viewCheckId').css('color', 'green');
						$('#data').data("checkId", true);
						
					} else {
						$('#inputId').val('');
						$('#viewCheckId').text('사용할 수 없는 아이디 입니다.');
						$('#viewCheckId').css('color', 'red');
						$('#data').data("checkId", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		}
	});
	
	 function receiveKey() {
		 var phoneData = {
				 "phone" : $("#inputPhone").val()
		 }
		 
		$("#responseKeyBtn").attr("disabled", true);
		$("#inputPhone").attr("disabled", true);
	    $("#inputKey").attr("disabled", false);
		$.ajax({
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			url : '${pageContext.request.contextPath}/user/key',
			type : 'POST',
			data : JSON.stringify(phoneData),
			success : function(result) {
				if (result == true) {
					$('#data').data('checkPhone', true);
				} else {
					$('#data').data('checkPhone', false);
				}
			}, error : function() {
				console.log("에러");
			}
		});
	} 

	 $("#inputKey").blur(function() {
		if ($("#inputKey").val() != null) {
			$("#responseKeyBtn").attr("disabled", true);
		    $("#inputKey").attr("disabled", false);
		    
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/key/check',
				type : 'POST',
				data : JSON.stringify($("#inputKey").val()),
				success : function(result) {
					if (result == true) {
						$("#viewCheckKey").text('인증번호가 일치합니다.');
						$('#viewCheckKey').css('color', 'green');
						$('#data').data("checkKey", true);
						
					} else {
						$('#inputKey').val('');
						$('#viewCheckKey').text('인증번호가 일치하지 않습니다');
						$('#viewCheckKey').css('color', 'red');
						$('#data').data("checkKey", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		}
	});
	 
	function signupSubmit() {
		var phone = $('#data').data('checkPhone');
		var key = $('#data').data('checkKey');
		var id = $('#data').data('checkId');
		var pw = $('#data').data('checkPw');
		
		if (id) {
			if (pw) {
				if (phone) {
					if (key) {
						$('#form').submit();
					} else {
						alert('인증번호를 입력해 주세요.');
					}
				} else {
					alert('전화번호를 입력해 주세요.');
				}
			} else {
				alert('비밀번호를 입력해 주세요');
			}
		} else {
			alert('아이디 중복확인을 해주세요.');
		}
		
		
	} 
</script>
</html>