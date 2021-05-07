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
	
	<c:if test="${sessionScope.userId == board.userId }">	
		<button onClick="location.href='/nftf/board/${board.no}/form'">수정</button>
		<form action="<%=request.getContextPath()%>/nftf/board/${board.no}" method="post" id="deleteAction">
			<input type="hidden" name="_method" value="DELETE" />
			<button onClick="del(${board.no})">삭제</button>
          </form>
	</c:if>
	<button onClick="location.href='/nftf/board'">목록으로</button>

</body>
<script>
	function del(no) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			document.deleteAction.submit;
		}
}	
</script>
</html>