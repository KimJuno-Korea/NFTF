<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
	</head>
	<body>
		<h3>마이 페이지</h3>
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
	</body>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
</html>
