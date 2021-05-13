<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 등록 페이지</h1>
	<form action="<%=request.getContextPath()%>/nftf/board" method="post">
		아이디 : <input type="text" name="userId" value="${sessionScope.userId }" readonly/><br>
		<select name="division">
			<option value="">구분</option>
			<option value="S">판매자</option>
			<option value="B">구매자</option>
		</select>
		<select name="tradeWay">
			<option value="">거래방식</option>
			<option value="T">거래함</option>
			<option value="P">택배</option>
			<option value="D">직거래</option>
		</select><br>
		제목 : <input type="text" name="title"/><br>
		내용 : <input type="text" name="content"/><br>
		가격 : <input type="text" name="price"/><br>

        <input type="submit" value="전송">
	</form>
</body>
</html>