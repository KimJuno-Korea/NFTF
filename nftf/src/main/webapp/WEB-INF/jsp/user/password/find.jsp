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
					<input id="inputId" type="text" name="id" placeholder="아이디"> <div id="viewCheckId"></div>
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호"> <input id="receiveKeyBtn" value="인증번호 전송"> <br>
					<input id="inputKey" type="text" name="key" placeholder="인증번호"> <div id="viewCheckKey"></div>
			 	</div>
			 	
			 	
			 	
				<div class="row">
					<input id="findPwBtn" value="확인" type="submit">
				</div>
			</form>
		</div>
	</div>
</body>

<script>
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
</script>
</html>