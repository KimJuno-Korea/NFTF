<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 QR</title>
</head>
	<body>
		<h3>로그인 QR 생성</h3>
		<div class="row">
			<div class="col-lg-12">
				<img class='img-responsive' src="${pageContext.request.contextPath}/user/qr/${sessionScope.id}"  alt="1">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<input onclick="back()" type="button" value="뒤로">
			</div>
		</div>
	</body>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
		function back()	{
			history.go(-1);
		}
		
	</script>
</html>