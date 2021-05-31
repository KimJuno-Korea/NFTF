<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
	<section>
		<div class="block no-padding  gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>마이페이지</h3>
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
		<div class="mypage-index">
			<div class="container">
				<div class="mypage-row">
					<div class="row">
						<div class="col-lg-3">
							<div class="box">
								<p>회원가입시 입력한 내 정보를 수정할 수 있습니다.</p>
								<input class="mypage-button" value="내 정보 수정" type="button" onclick="editUserForm()">
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<p>거래함에 로그인을 하기 위한 QR 코드를 생성합니다.</p>
								<input class="mypage-button" value="로그인 QR 생성" type="button" onclick="createLoginQR()">
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<p>다른 사용자와 거래했던 내역을 확인할 수 있습니다.</p>
								<input class="mypage-button" value="거래 정보 조회" type="button" onclick="getTradingList()">
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<p>Trading 365 회원을 탈퇴할 수 있습니다.</p> <br>
								<input class="withdrawal-button" id="withdrawal" value="회원탈퇴" type="button">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="modal qr" id="qrModal" 
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
<!-- 				<div class="modal-header"> -->
<!-- 				</div> -->
				<div class="modal-body">
					<div class="col-12">
						<img class='login-qr' src="${pageContext.request.contextPath}/user/qr/${sessionScope.id}"
								align="middle">
					</div>
				</div>
<!-- 				<div class="modal-footer"> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
	
	<div class="modal withdrawal" id="withdrawalModal" 
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
<!-- 				<div class="modal-header"> -->
<!-- 				</div> -->
				<div class="modal-body">
					<section>
						<div id="data"></div>
						<div class="container">
							<div class="row">
								<div class="account-popup">
									<form id="form" action='${pageContext.request.contextPath}/user/${sessionScope.id}' method='post'>
										
										<div class="cfield">
											<input id="inputPw" name="pw" type="text"placeholder="비밀번호" maxlength="30"> 
										</div>
										<div class="cfield">
											<input id="inputCheckPw" type="text" placeholder="비밀번호 확인" maxlength="30"> 
									 	</div>
									 	<div id="viewCheckPw"></div>
									 	<input type="hidden" name='id' value='${sessionScope.id}'>
										<input type='hidden' name='_method' value='delete'>
										<input type='submit' value="탈퇴">
									</form>
								</div>
							</div>
						</div>
					</section>
				</div>
<!-- 				<div class="modal-footer"> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
	<div class="modal qr" id="qrModal" 
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
<!-- 				<div class="modal-header"> -->
<!-- 				</div> -->
				<div class="modal-body">
					<div class="col-12">
						<img class='login-qr' src="${pageContext.request.contextPath}/user/qr/${sessionScope.id}"
								align="middle">
					</div>
				</div>
<!-- 				<div class="modal-footer"> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
	
	<script>
	$(document).ready(function()	{
		var result = "${param.result}"
		if (result == "false") {
			alert('비밀번호를 다시 입력해 주세요.');
			$('#withdrawalModal').modal('show');
		}
	})
	
		var withdrawal = $('#withdrawal');
		var id = "${sessionScope.id}";
		var form = $('#form');
	
		function editUserForm()	{
			location.href="/user/"+id+"/form";
		}
		
		function createLoginQR() {
			$('#qrModal').modal('show');
		}
		
		function getTradingList() {
			location.href="/user/trading/"+id;
		}
		
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
		
		withdrawal.click(function(){
			
			if (confirm("회원 탈퇴를 진행 합니까?")) {
				$('#withdrawalModal').modal('show');
				
			} else {
				return false;
			}
		});
	</script>
