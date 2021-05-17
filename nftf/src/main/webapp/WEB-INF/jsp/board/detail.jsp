<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 div.goods div.goodsImg { float:left; width:350px; }
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
 div.goods div.goodsInfo p { margin:0 0 20px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
</style>
</head>
<body>
<c:set var="board" value="${board }" />
<h1>게시글 상세 페이지</h1>

	<div class="goods">
		<div class="goodsImg">
			<c:forEach var="photo" items="${photoList }">
				<img src="<%=request.getContextPath() %>/photo/${photo.no}" />
			</c:forEach>
		</div>
	</div>
	<div class="goodsInfo">
		번호 : ${board.no } <br>
		아이디 : ${board.userId }<br>
		제목 : ${board.title }<br>
		내용 : ${board.content }<br>
		가격 : ${board.price }<br>
		구분 : <c:choose>
				<c:when test="${board.division eq 'S'}">
					구매
				</c:when>
				<c:when test="${board.division eq 'B'}">
					판매
				</c:when>
			  </c:choose><br>
		거래방식 :<c:choose>
					<c:when test="${board.tradeWay eq 'D'}">
						직거래
					</c:when>
					<c:when test="${board.tradeWay eq 'P'}">
						택배
					</c:when>
					<c:when test="${board.tradeWay eq 'T'}">
						거래함
					</c:when>
				</c:choose><br>
		상태 : <c:choose>
				<c:when test="${board.status eq 'S'}">
					거래완료
				</c:when>
				<c:when test="${board.status eq 'M'}">
					거래중
				</c:when>
			  </c:choose><br>
		작성일자 : ${board.registrateDate }<br>
		</div>
	
	<form action="<%=request.getContextPath()%>/board/${board.no}" method="post" id="deleteAction">
		<input type="hidden" name="_method" value="DELETE" />
		<input type="button" onClick="location.href='/board'" value="목록으로" />
		<c:if test="${sessionScope.userId == board.userId }">
			<input type="button" onClick="location.href='/board/${board.no}/form'" value="수정" />
			<button onClick="del()">삭제</button>
		</c:if>
	</form>
	<br>
	<div class="container">
        <label for="content"></label>
        <form name="replyInsertForm">
            <div class="input-group">
               <input type="hidden" name="boardNo" value="${board.no}"/>
               <input type="hidden" name="userId" value="${sessionScope.userId}"/>
               <textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
               <span class="input-group-btn">
                    <button type="button" name="replyInsertBtn">등록</button>
               </span>
              </div>
              <hr>
        </form>
    </div>
	<div class="container">
        <div class="replyList"></div>
    </div>
	
	<%@ include file="../board/reply.jsp" %>
	
</body>
<script>
	function del() {
		var chk = confirm("해당 게시글을 삭제하시겠습니까?");
		if (chk) {
			document.deleteAction.submit;
		}
	}
</script>
</html>