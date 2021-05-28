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
								<h3>아이디 찾기</h3>
								<span>아이디를 찾기위해서 정보를 입력해 주세요.</span>
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
	
	<div id="data"></div>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="account-popup">
					<form>
						<div class="cfield">
							<input id="inputPhone" type="text" name="phone" placeholder="전화번호" maxlength="14">
					 	</div>
						 	<input id="receiveKeyBtn" class="ajax" type="button" value="인증번호 전송" onclick="receiveKey()"> <br>
						<div class="cfield">
							<input id="inputKey" type="text" name="key" placeholder="인증번호" disabled="disabled" maxlength='6'>
					 	</div>
					 		<div id="viewCheckKey" class="checkInput"></div>
							<input id="findIdBtn" class="onclick" type="button" value="찾기" onclick="findId()">
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
<script>
$(document).on("keyup", "#inputPhone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

	function findId() {
		console.log($('#data').data('checkPhone'));
		console.log($('#data').data("checkKey"));
		var phone = $('#data').data('checkPhone');
		var key = $('#data').data('checkKey');
		if (phone){
			if (key){
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
							alert("아이디는" + result.id + '입니다.');
							window.location.href='https://localhost/login';
						}, error : function() {
							alert("아이디 찾기 실패");
						}
					});
			} else {
				alert('인증키를 입력해주세요');
			}
		} else {
			alert('인증을 해주세요');
		}
	}

	 function receiveKey() {
		 var phoneData = {
				 "phone" : $("#inputPhone").val()
		 }
		 
		$("#receiveKeyBtn").attr("disabled", true);
		$("#inputPhone").attr("disabled", true);
	    $("#inputKey").attr("disabled", false);
		$.ajax({
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			url : '${pageContext.request.contextPath}/user/key/findId',
			type : 'POST',
			data : JSON.stringify(phoneData),
			success : function(result) {
				if (result == 1) {
					$('#data').data('checkPhone', true);
					$('#receiveKeyBtn').val('인증키가 전송 되었습니다.');
				} else if (result == 0){
					$('#data').data('checkPhone', false);
					alert("존재하지 않는 전화번호 입니다.");
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
</script>
