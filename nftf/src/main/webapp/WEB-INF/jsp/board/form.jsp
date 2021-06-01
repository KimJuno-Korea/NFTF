<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<section>
		<div class="block no-padding  gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>게시글 등록</h3>
								<span>상품에 관한 정보를 입력해주세요.</span>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index" title="">Home</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<div class="block remove-top">
			<div class="container">
				 <div class="row no-gape">
				 	<div class="col-lg-10 column">
				 		<div class="padding-left">
					 		
					 		<div class="manage-jobs-sec">
						 		<div class="resumeadd-form">
						 			<div class="row">
						 				<div class="col-lg-12">
					 						<span class="pf-title">Title</span>
					 						<div class="pf-field">
					 							<input placeholder="제목을 입력해주세요" type="text">
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<span class="pf-title">Writer</span>
					 						<div class="pf-field">
					 							<input type="text" name="userId" value="${sessionScope.id }" readonly/>
					 						</div>
					 					</div>
					 					
					 					<div class="col-lg-6">
											<div class="dropdown-field">
												<select data-placeholder="Please Select Specialism" class="chosen"
													 name="division">
													<option value="">거래 구분을 선택하세요.</option>
													<option value="S">판매</option>
													<option value="B">구매</option>
												</select>
											</div>
										</div>
										
					 					<div class="col-lg-6">
					 						<div class="dropdown-field">
												<select data-placeholder="Please Select Specialism" class="chosen"
													 name="tradeWay">
													<option value="">거래 방식을 선택하세요.</option>
													<option value="T">거래함</option>
													<option value="P">택배</option>
													<option value="D">직거래</option>
												</select>
											</div>
					 					</div>
					 					
					 					<div class="col-lg-6">
					 						<span class="pf-title">Price</span>
					 						<div class="pf-field">
					 							<input type="text" placeholder="가격을 입력해주세요.">
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<span class="pf-title">Content</span>
					 						<div class="pf-field">
					 							<textarea placeholder="내용을 입력해주세요"></textarea>
					 						</div>
					 					</div>
						 			
						 				<div class="col-lg-12">
					 						<p>Max file size is 1MB, Minimum dimension: 270x210 And Suitable files are .jpg &amp; .png</p>
					 					</div>
					 					<div class="col-lg-12">
					 						<div class="upload-portfolio">
					 							<div class="uploadbox">
					 								<label for="file-upload" class="custom-file-upload">
													    <i class="la la-cloud-upload"></i> <span>Upload Image</span>
													</label>
													<input id="file-upload" type="file" style="display: none;">
					 							</div>
					 							<div class="uploadfield">
							 						<span class="pf-title">Title</span>
							 						<div class="pf-field">
							 							<input placeholder="Tooms.." type="text">
							 						</div>
							 					</div>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						 <button type="submit">Save</button>
					 					</div>
					 				</div>
						 		</div><!-- resumeadd-form -->
						 		
					 		</div><!-- manage-jobs-sec -->
					 		
					 	</div>
					</div>
				 </div>
			</div>
		</div>



<h1>게시글 등록 페이지</h1>
	<form action="<%=request.getContextPath()%>/board" method="post" enctype="multipart/form-data">
		아이디 : <input type="text" name="userId" value="${sessionScope.id }" readonly/><br>
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
<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
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