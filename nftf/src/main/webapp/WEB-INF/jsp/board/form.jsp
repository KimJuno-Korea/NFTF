<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<h1>게시글 등록 페이지</h1>
	<form action="<%=request.getContextPath()%>/board" method="post" enctype="multipart/form-data">
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
	<div class="inputArea">
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
	</div>
	</form>
</body>
<script>
	$("#gdsImg").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result)
								.width(200);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>
</html>