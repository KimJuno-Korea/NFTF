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
				<button onclick="editUserForm();">내 정보 수정</button>
			</div>
			<div class="col-lg-3">
				<button onclick="createLoginQR();">로그인 QR 생성</button>
			</div>
			<div class="col-lg-3">
				<button onclick="getTradingList();">거래 정보 조회</button>
			</div>
			<div class="col-lg-3">
				<button onclick="withdrawalForm();">회원 탈퇴</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<button onclick="back();">뒤로</button>
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
		
		function createLoginQR(){
			location.href=id;
		}
		
		function getTradingList(){
			location.href="/user/trading/"+id;
		}
		
		function withdrawalForm(){
			location.href="/user/withdrawal/"+id;
		}
		
		function back()	{
			location.href="/index";
		}
		
	</script>
</html>
