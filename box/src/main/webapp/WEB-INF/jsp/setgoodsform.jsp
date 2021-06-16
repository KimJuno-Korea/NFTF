<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>

<body>
    <div class="common__top">
        <img src="${pageContext.request.contextPath}/images/logo.png"/>
    </div>
    <div class="common__center">
        <div class="common__center__column">
            <select id="boardSelect" class="selectbox">
            	<option value="none">선택</option>
            	<c:forEach items="${boardList}" var="board">
					<option value="${board.no}/${board.price}/${board.title}">${board.title}</option>
				</c:forEach>
            </select>
    	</div>
    </div>
        <form action="../goods" method="post" class="common__bottom">
    		<input id="tradingBoxNo" type="hidden" name="no" value="${tradingBox.no}"/>
    		
    		<input id="boardNo" type="hidden" name="boardNo"/>
    		<input id="boardPrice" type="hidden" name="price" />
    		<input id="boardTitle" type="hidden" name="boardTitle" /> 
    		
            <input type="button" class="button back__button" onclick="location.href='./index'" value="처음으로"/>
		 	<input type="submit" class="button confirm__button" value="선택완료" />
		</form>
</body>

<script>
	$('#boardSelect').on('change', function(){
		var selected = $('#boardSelect option:selected').val(); 
		var board = selected.split("/");
		
		$('#boardNo').val(board[0]);
		$('#boardPrice').val(board[1]);
		$('#boardTitle').val(board[2]);
		
		console.log(board[0]+ '/'+board[1]+'/'+board[2]);
	})
</script>
</html>