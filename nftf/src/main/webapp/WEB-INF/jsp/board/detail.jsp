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
	
	<form action="<%=request.getContextPath()%>/nftf/board/${board.no}" method="post" id="deleteAction">
		<input type="hidden" name="_method" value="DELETE" />
		<input type="button" onClick="location.href='/nftf/board'" value="목록으로" />
		<c:if test="${sessionScope.userId == board.userId }">
		<input type="button" onClick="location.href='/nftf/board/${board.no}/form'" value="수정" />
		<button onClick="del()">삭제</button>
		</c:if>
	</form>
	<!-- 댓글 -->
	<table>
		<c:if test="${replyList != null }">
			<c:forEach var="reply" items="${replyList }">
				<tr>
					<!-- 아이디 및 작성 날짜 -->
					<td> 
						${reply.userId }<br>
						${reply.registrateDate }
					</td>
					
					<!-- 댓글 내용 -->
					<td>
						${reply.content }
					</td>
					
					<!-- 옵션 -->
					<td>
						<c:if test="${reply.userId == sessionScope.userId }">
							<a href="">수정</a><br>
							<a href="">삭제</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
<script>
	function del() {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			document.deleteAction.submit;
		}
}	
</script>
</html>