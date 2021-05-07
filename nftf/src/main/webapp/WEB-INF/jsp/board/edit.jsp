<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="board" value="${board }" />
<h1>게시글 수정 페이지</h1>
	<form action="<%=request.getContextPath() %>/nftf/board/${board.no }" method="post">
		<input type="hidden" name="_method" value="PUT" />
		아이디 : <input type="text" name="userId" value="${sessionScope.userId }" readonly/><br>
		<select name="division">
			<option value="">구분</option>
			<option value="S" <c:if test="${board.division eq 'S'}">selected</c:if>>판매자</option>
			<option value="B" <c:if test="${board.division eq 'B'}">selected</c:if>>구매자</option>
			<c:if test="${board.division eq B}"></c:if>
		</select>
		${board.division }
		${board.tradeWay }
		<select name="tradeWay">
			<option value="">거래방식</option>
			<option value="T" <c:if test="${board.tradeWay eq 'T'}">selected</c:if>>거래함</option>
			<option value="P" <c:if test="${board.tradeWay eq 'P'}">selected</c:if>>택배</option>
			<option value="D" <c:if test="${board.tradeWay eq 'D'}">selected</c:if>>직거래</option>
		</select><br>
		제목 : <input type="text" name="title" value="${board.title }"/><br>
		내용 : <input type="text" name="content" value="${board.content }"/><br>
		가격 : <input type="text" name="price" value="${board.price }"/><br>

        <input type="submit" value="수정">
	</form>
</body>
</html>