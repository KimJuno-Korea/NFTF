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
		<div id="data"></div>
			<form id="form" action="${pageContext.request.contextPath}/password" method="post" >
				<div class="row">
					<input id="inputId" type="text" name="id" placeholder="아이디"> <br>
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호" maxlength='14'> <input id="receiveKeyBtn" type="button" value="인증번호 전송" onclick="receiveKey()"> <br>
					<input id="inputKey" type="text" name="key" placeholder="인증번호" disabled="disabled" maxlength='6'> <div id="viewCheckKey"></div>
			 	</div>
			 	
				<div class="row">
					<input id="findPwBtn" value="확인" type="button" onclick="findPwSubmit()">
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(document).on("keyup", "#inputPhone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

	//인증번호 전송 및 아이디와 전화번호 일치 테스트
	function receiveKey() {
		 var phoneData = {
				 "id" : $("#inputId").val(),
				 "phone" : $("#inputPhone").val()
		 }
		$.ajax({
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			url : '${pageContext.request.contextPath}/user/key',
			type : 'POST',
			data : JSON.stringify(phoneData),
			success : function(result) {
				console.log(result);
				if (result == 1) {
					$('#data').data('checkPhone', true);
					
					$('#inputId').attr('disabled', true);
					$("#receiveKeyBtn").attr("disabled", true);
					$("#inputPhone").attr("disabled", true);
				  	$("#inputKey").attr("disabled", false);
				  	
				} else if (result == 0){
					$('#data').data('checkPhone', false);
					alert("아이디와 전화번호가 불일치 합니다.");
					
				} else {
					$('#data').data('checkPhone', false);
					alert("알 수 없는 오류");
				}
			}, error : function() {
				console.log("에러");
			}
		});
	} 
	
	//인증번호 체크
	$("#inputKey").blur(function() {
		if ($("#inputKey").val() != null) {
			$("#receiveKeyBtn").attr("disabled", true);
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
	
	//패스워드 찾기 submit
	function findPwSubmit() {
		var phone = $('#data').data('checkPhone');
		var key = $('#data').data('checkKey');
	
		if (phone) {
			if (key) {
				
				$('[disabled]').attr('disabled', false);
				$('#form').submit();
			} else {
				alert('인증번호를 입력해 주세요.');
			}
		} else {
			alert('전화번호를 입력해 주세요.');
		}
	} 
</script>
</html>