<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 지점 등록 화면 </h1>
	<form action="/branch" method="post">
		
		<div>
		<label>지점 코드
			<input type="text" name="code" placeholder="TEST_XX_0X"/>
		</label>
		</div>
		<div>
		<label>지점 명
			<input type="text" name="name" placeholder="제주 ㅁㅁ점"/>
		</label>
		</div>
		<div>
		<label>지점 위도
			<input type="text" name="latitude" placeholder="xxx.xxx"/>
		</label>
		</div>
		<div>
		<label>지점 경도
			<input type="text" name="longtitude" placeholder="xxx.xxx"/>
		</label>
		<label>거래함 갯수
			<input type="number" name="tradingBoxCount" placeholder="1"/>
		</label>
		</div>
		<div>
		<label>지점 상태
			<select name="status" >
				<option value="Y" selected> Y </option>
				<option value="N"> N </option>
			</select>
		</label>
		</div>
		<input type="submit" value="지점 등록">
	</form>
</body>
</html>