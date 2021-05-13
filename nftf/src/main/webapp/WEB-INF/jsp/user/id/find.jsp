<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<div class="row">
		<h2>아이디 찾기</h2>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<div id="data"></div>
			<form action="${pageContext.request.contextPath}/id" method="post">
				<div class="row">
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호" maxlength="14"> <input id="receiveKeyBtn" type="button" value="인증번호 전송" onclick="receiveKey()"> <br>
					<input id="inputKey" type="text" name="key" placeholder="인증번호" disabled="disabled" maxlength='6'>	<div id="viewCheckKey"></div>
			 	</div>
				<div class="row">
					<input id="findIdBtn" type="button" value="찾기" onclick="findId()">
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(document).on("keyup", "#inputPhone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

	function findId() {
		if ($('#data').data('phone') && $('#data').data('key')){
			var userData = {
					"phone" : $("#inputPhone").val()
				}
				
				$.ajax({
					dataType : 'json',
					contentType : 'application/json; charset=utf-8',
					url : '${pageContext.request.contextPath}/id',
					type : 'POST',
					data : JSON.stringify(userData),
					success : function(result) {
						alert("아이디는" + result + '입니다.');
					}, error : function() {
						alert("아이디 찾기 실패");
					}
				});
		} else {
			alert('인증을 해주세요');
		}
	}

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
				if (result == 1) {
					$('#data').data('checkPhone', true);
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
	 
	function findIdSubmit() {
		var phone = $('#data').data('checkPhone');
		var key = $('#data').data('checkKey');
		
		if (phone) {
			if (key) {
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