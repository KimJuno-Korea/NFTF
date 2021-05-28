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
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<input value="내 정보 수정" type="button" onclick="editUserForm()">
				</div>
				<div class="col-lg-3">
					<input value="로그인 QR 생성" type="button" onclick="createLoginQR()">
				</div>
				<div class="col-lg-3">
					<input value="거래 정보 조회" type="button" onclick="getTradingList()">
				</div>
				<div class="col-lg-3">
					<input value="회원탈퇴" type="button" onclick="withdrawalForm()">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<input value="뒤로" type="button" onclick="back()">
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
	
	<script>
		var id = "${sessionScope.id}";
	
		function editUserForm()	{
			location.href="/user/"+id+"/form";
		}
		
		function createLoginQR() {
			location.href="/user/"+id+"/qr";
		}
		
		function getTradingList() {
			location.href="/user/trading/"+id;
		}
		
		function withdrawalForm() {
			location.href="/user/withdrawal/"+id;
		}
		
		function back()	{
			history.go(-1);
		}
		
	</script>
