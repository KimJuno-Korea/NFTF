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
	<h1>게시글 상세 페이지</h1>
		번호 : ${board.no } <br>
		아이디 : ${board.userId }<br>
		제목 : ${board.title }<br>
		내용 : ${board.content }<br>
		가격 : ${board.price }<br>
		구분 : ${board.division }<br>
		거래방식 : ${board.tradeWay }<br>
		상태 : ${board.status }<br>
		작성일자 : ${board.registrateDate }<br>

</body>
</html>