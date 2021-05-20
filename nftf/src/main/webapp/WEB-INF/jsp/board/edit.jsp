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
	<form action="<%=request.getContextPath() %>/board/${board.no }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_method" value="PUT" />
		아이디 : <input type="text" name="userId" value="${sessionScope.userId }" readonly/><br>
		<select name="division">
			<option value="">구분</option>
			<option value="S" <c:if test="${board.division eq 'S'}">selected</c:if>>판매자</option>
			<option value="B" <c:if test="${board.division eq 'B'}">selected</c:if>>구매자</option>
			<c:if test="${board.division eq B}"></c:if>
		</select>
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
        
        <!-- <div class="inputArea">
		<label for="gdsImg">기본이미지-(목록에 표시됨)</label><br>
			<input type="file" id="gdsImg" name="file" accept="image/gif,image/jpeg,image/png" />
			<div class="select_img">
				<img src="" />
			</div>
			<div>
				이미지-2<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
			</div>
			<br>
			<div>
				이미지-3<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
			</div>
		</div> -->
		<c:forEach var="photo" items="${photoList }" varStatus="status" >
			<c:choose>
			<c:when test="${status.count == 1 }">
				<div class="inputArea">
					<label for="gdsImg">기본이미지-(목록에 표시됨)</label><br>
					<p>기존 파일명 : ${photo.logicalName }</p>
					<input type="file" id="gdsImg" name="file"
						accept="image/gif,image/jpeg,image/png" />
					<div class="select_img">
						<img src="" />
					</div>
				</div>
			</c:when>
			<c:when test="${status.count == 2 }">
				<div class="inputArea">
					<p>기존 파일명 : ${photo.logicalName }</p>
					이미지-${status.count }<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
				</div>
			</c:when>
			<c:when test="${status.index == 3 }">
				<div class="inputArea">
					<div>
						이미지-${count.count }<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
					</div>
				</div>
			</c:when>
			</c:choose>
		</c:forEach>
		<c:choose>
		<c:when test="${size == 1 }">
			<div class="inputArea">
				<div>
					이미지-2<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
				</div>
			</div>
			<div class="inputArea">
				<div>
					이미지-3<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
				</div>
			</div>
		</c:when>
		<c:when test="${size == 2 }">
			<div class="inputArea">
				<div>
					이미지-3<input type="file" name="file" accept="image/gif,image/jpeg,image/png" />
				</div>
			</div>
		</c:when>
		</c:choose>
	</form>
</body>
</html>