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
	<form action="<%=request.getContextPath()%>/test/result" method="post" enctype="multipart/form-data">
		<div class="inputArea">
			<label for="gdsImg">기본이미지</label><br>
			목록에 표시됨
			<input type="file" id="gdsImg" name="file" accept="image/gif,image/jpeg,image/png" />
			<div class="select_img">
				<img src="" />
			</div>
			<div>
				<label for="gdsImg2">이미지-2</label> <input type="file" 	name="file" accept="image/gif,image/jpeg,image/png" />
			</div>
			<br>
			<div>
				<label for="gdsImg3">이미지-3</label> <input type="file" 	name="file" accept="image/gif,image/jpeg,image/png" />
			</div>
		</div>
		<input type="submit" value="전송">
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