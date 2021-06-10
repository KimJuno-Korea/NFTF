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
								<h3>비밀번호 변경</h3>
								<span>비밀번호를 변경하기위해 비밀번호를 입력해 주세요.</span>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index" title="">Home</a></li>
									<li><a href="${pageContext.request.contextPath}/user/${sessionScope.id}" title="">My Page</a></li>
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
					<form id="form" action="${pageContext.request.contextPath}/password/${id}" method="post" autocomplete="off">
						<div class="cfield">
							<input id="inputPw" type="password" name="pw" placeholder="비밀번호" maxlength="20">
					 	</div>
					 	<div class="checkInput" id="viewPw"></div>
						<div class="cfield">
							<input id="inputCheckPw" type="password" name="pwCheck" placeholder="비밀번호 확인"  maxlength="20">
					 	</div>
					 	<div id="viewCheckPw" class="checkInput"></div>	
				 		<input id="submitBtn" class="onclick" type="button" onclick="editPwSubmit()" value="확인">
					</form>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

<script>
	$("#inputPw").blur(function(){
		if($("#inputPw").val() != '' && $('#inputPw').val.length >= 7) {
			$('#inputCheckPw').val('');			
			if ($('#inputPw').val() == '${pw}') {
				$('#viewPw').text('기존의 비밀번호와 일치합니다.');
				$('#viewPw').css('color', 'red');
				$('#data').data('checkPw', false);
				$('#data').data('editPw', false);
			} else {
				$("#viewPw").text('');
				$('#viewPw').css('color', 'green');
				$('#data').data('editPw', true);
			}
		}
	});
	
	$("#inputCheckPw").blur(function() {
		if ($('#inputPw').val() != '' && $('#inputPw').val.length >= 7) {
			if ($('#inputPw').val() != $(this).val()){
				$('#viewCheckPw').text('비밀번호가 일치하지 않습니다');
				$('#viewCheckPw').css('color', 'red');
				$('#data').data('checkPw', false);
				$('#data').data('editPw', false);
			} else {
				$("#viewCheckPw").text('비밀번호가 일치합니다.');
				$('#viewCheckPw').css('color', 'green');
				$('#data').data('checkPw', true);
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
