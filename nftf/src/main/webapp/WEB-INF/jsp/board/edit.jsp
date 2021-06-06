<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<section>
		<div class="block no-padding  gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>게시글 수정</h3>
								<span>상품에 관한 정보를 수정할 수 있습니다.</span>
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
				 		<form action="<%=request.getContextPath() %>/board/${board.no }" method="post" enctype="multipart/form-data">
				 		<input type="hidden" name="_method" value="PUT" />
				 		<div class="padding-left">
					 		<div class="manage-jobs-sec">
						 		<div class="resumeadd-form">
						 			<div class="row">
						 				<div class="col-lg-12">
					 						<span class="pf-title">제목</span>
					 						<div class="pf-field">
					 							<input type="text" name="title" value="${board.title }" placeholder="제목을 입력해주세요" />
					 						</div>
					 					</div>
					 					
					 					<input type="hidden" name="userId" value="${sessionScope.id }" />
					 					
					 					<div class="col-lg-6">
											<div class="dropdown-field">
												<select data-placeholder="Please Select Specialism" class="chosen"
													 name="division">
													<option value="">거래 구분을 선택하세요.</option>
													<option value="S" <c:if test="${board.division eq 'S'}">selected</c:if>>판매</option>
													<option value="B" <c:if test="${board.division eq 'B'}">selected</c:if>>구매</option>
												</select>
											</div>
										</div>
										
					 					<div class="col-lg-6">
					 						<div class="dropdown-field">
												<select data-placeholder="Please Select Specialism" class="chosen"
													 name="tradeWay">
													<option value="">거래 방식을 선택하세요.</option>
													<option value="T" <c:if test="${board.tradeWay eq 'T'}">selected</c:if>>거래함</option>
													<option value="P" <c:if test="${board.tradeWay eq 'P'}">selected</c:if>>택배</option>
													<option value="D" <c:if test="${board.tradeWay eq 'D'}">selected</c:if>>직거래</option>
												</select>
											</div>
					 					</div>
					 					
					 					<div class="col-lg-6">
					 						<span class="pf-title">가격</span>
					 						<div class="pf-field">
					 							<input type="text" name="price" value="${board.price }" placeholder="가격을 입력해주세요.">
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<span class="pf-title">내용</span>
					 						<div class="pf-field">
					 							<textarea name="content" placeholder="내용을 입력해주세요">${board.content }</textarea>
					 						</div>
					 					</div>
						 			
						 				<div class="col-lg-12">
						 					<p><b style="color: red;">※ 주의! 일부 사진은 모바일 환경에서 다르게 보일 수 있습니다.</b></p>
					 						<p>사진의 파일 크기는 10MB가 최대입니다.<b> 사진은 최소 1장, 최대 3장까지 등록이 가능합니다.</b></p>
					 						<p>최적의 이미지는 320x280이며 .jpg 또는 .png 확장자명으로 등록이 가능합니다.</p>
					 						<p style="color: red;">※ 게시글 수정시 게시글의 사진을 <b>재등록</b>해야 합니다. </p>
					 					</div>
					 					<div class="col-lg-12">
					 						<div class="upload-portfolio">
					 							<div class="pf-field">
					 								<div class="select_img1">
															<img src="" style="border-radius: 8px"/>
													</div>
													<input type="file" id="upload1" name="file" accept="image/gif,image/jpeg,image/png" />
					 							</div>
					 							
					 							<div class="pf-field">
					 								<div class="select_img2">
															<img src="" style="border-radius: 8px"/>
													</div>
													<input type="file" id="upload2" name="file" accept="image/gif,image/jpeg,image/png" />
							 					</div>
					 							<div class="pf-field">
					 								<div class="select_img3">
															<img src="" style="border-radius: 8px"/>
													</div>
													<input type="file" id="upload3" name="file" accept="image/gif,image/jpeg,image/png" />
							 					</div>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						 <button type="submit">확인</button>
					 					</div>
					 				</div>
						 		</div><!-- resumeadd-form -->
						 		
					 		</div><!-- manage-jobs-sec -->
					 		
					 	</div>
					 	</form>
					</div>
				 </div>
			</div>
		</div>
</body>
<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
<script>
	$("#upload1").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img1 img").attr("src", data.target.result)
								.width(200);
						$(".select_img1 img").attr("src", data.target.result)
								.height(150);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	
	$("#upload2").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img2 img").attr("src", data.target.result)
								.width(200);
						$(".select_img2 img").attr("src", data.target.result)
								.height(150);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	
	$("#upload3").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img3 img").attr("src", data.target.result)
								.width(200);
						$(".select_img3 img").attr("src", data.target.result)
								.height(150);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>
</html>