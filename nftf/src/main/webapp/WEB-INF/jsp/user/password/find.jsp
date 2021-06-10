<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/common/top.jsp" />

	<section>
		<div class="block no-padding  gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>비밀번호 찾기</h3>
								<span>비밀번호를 찾기위해서 정보를 입력해 주세요.</span>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index" title="">Home</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section>
		<div id="data"></div>
		<div class="container">
			<div class="row">
				<div class="account-popup">
					<form id="form" action="${pageContext.request.contextPath}/password" method="post" autocomplete="off">
						<div class="cfield">
							<input id="inputId" type="text" name="id" placeholder="아이디"> <br>
						</div>
						<div class="cfield">
							<input id="inputPhone" type="text" name="phone" placeholder="전화번호" maxlength='13'> 
						</div>
							<input id="responseKeyBtn" class="ajax" type="button" value="인증번호 전송" onclick="receiveKey()" disabled> <br>
						<div class="cfield">
							<input id="inputKey" type="text" name="key" placeholder="인증번호" disabled="disabled" maxlength='6'> 
					 	</div>
					 	<div class="checkInput" id="viewCheckKey"></div>
						<div class="row">
							<input id="findPwBtn" class="onclick" value="확인" type="button" onclick="findPwSubmit()"
									style="width: 91%">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

<script>
	//인증번호 전송 및 아이디와 전화번호 일치 테스트
	function receiveKey() {
		 if ($('#inputPhone').val() == '' || $('#inputId').val() == '') {
			 alert('전화번호 또는 아이디를 입력해 주세요.')
		 } else {
			 var phoneData = {
					 "id" : $("#inputId").val(),
					 "phone" : $("#inputPhone").val()
			 }
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/key/findPw',
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
					  	$("#receiveKeyBtn").val("전송 완료");
					  	
					} else if (result == 0){
						$('#data').data('checkPhone', false);
						alert("등록된 아이디 또는 전화번호가 아닙니다.");
						
					} else {
						$('#data').data('checkPhone', false);
						alert("알 수 없는 오류");
					}
				}, error : function() {
					console.log("에러");
				}
			});
		 }
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
				alert('핸드폰 인증을 완료해 주세요.');
			}
		} else {
			alert('전화번호를 입력해 주세요.');
		}
	} 
</script>
