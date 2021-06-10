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
				 		<form action="<%=request.getContextPath()%>/board" method="post" enctype="multipart/form-data" name="boardForm"
				 		data-parsley-validate novalidate>
				 		<div class="padding-left">
					 		<div class="manage-jobs-sec">
						 		<div class="resumeadd-form">
						 			<div class="row">
						 				<div class="col-lg-12">
					 						<span class="pf-title">제목</span>
					 						<span id="titleValid" style="color: red;"></span>
					 						<div class="pf-field">
					 							<input type="text" name="title" placeholder="제목을 입력해주세요" />
					 						</div>
					 						
					 					</div>
					 					
					 					<input type="hidden" name="userId" value="${sessionScope.id }" />
					 					
					 					<div class="col-lg-6">
											<div class="dropdown-field">
												<select data-placeholder="Please Select Specialism" class="chosen"
													 name="division">
													<option value="">거래 구분을 선택하세요.</option>
													<option value="S">판매</option>
													<option value="B">구매</option>
												</select>
												<div id="divisionValid" style="color: red;"></div>
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
												<div id="tradeWayValid" style="color: red;"></div>
											</div>
					 					</div>
					 					
					 					<div class="col-lg-6">
					 						<span class="pf-title">가격</span>
					 						<span id="priceValid" style="color: red;"></span>
					 						<div class="pf-field">
					 							<input type="text" name="price" placeholder="가격을 입력해주세요." numberOnly>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<span class="pf-title">내용</span>
					 						<span id="contentValid" style="color: red;"></span>
					 						<div class="pf-field">
					 							<textarea name="content" placeholder="내용을 입력해주세요"></textarea>
					 						</div>
					 					</div>
						 			
						 				<div class="col-lg-12">
						 					<p><b style="color: red;">주의! 일부 사진은 모바일 환경에서 다르게 보일 수 있습니다.</b></p>
					 						<p>사진의 파일 크기는 10MB가 최대입니다.<b> 사진은 최소 1장, 최대 3장까지 등록이 가능합니다.</b></p>
					 						<p>최적의 이미지는 320x280이며 .jpg 또는 .png 확장자명으로 등록이 가능합니다.</p>
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
					 						 <button type="button" onClick="validCheck()">확인</button>
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
$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});
function validCheck(){
	var msg = "";
	var titleValid = document.getElementById('titleValid');
	var divisionValid = document.getElementById('divisionValid');
	var tradeWayValid = document.getElementById('tradeWayValid');
	var priceValid = document.getElementById('priceValid');
	var contentValid = document.getElementById('contentValid');
	
	if(document.boardForm.title.value==''){
		msg = "※제목은 필수 입력 항목입니다.";
		titleValid.innerHTML = msg;
		return;
	}else if(document.boardForm.title.value!=''){
		titleValid.innerHTML = "";
	}
	
	if(document.boardForm.division.value==''){
		msg = "※거래 구분은 필수 선택 항목입니다.";
		divisionValid.innerHTML = msg;
		return;
	}else if(document.boardForm.division.value!=''){
		divisionValid.innerHTML = "";
	}
	
	if(document.boardForm.tradeWay.value==''){
		msg = "※거래 방식은 필수 선택 항목입니다.";
		tradeWayValid.innerHTML = msg;
		return;
	}else if(document.boardForm.tradeWay.value!=''){
		tradeWayValid.innerHTML = "";
	}
	
	if(document.boardForm.price.value==''){
		msg = "※가격은 필수 입력 항목입니다.";
		priceValid.innerHTML = msg;
		return;
	}else if(document.boardForm.price.value!=''){
		priceValid.innerHTML = "";
	}
	
	if(document.boardForm.content.value==''){
		msg = "※내용은 필수 입력 항목입니다.";
		contentValid.innerHTML = msg;
		return;
	}else if(document.boardForm.content.value!=''){
		contentValid.innerHTML = "";
	}
	
	if(document.boardForm.file.value==''){
		alert("사진은 최소 1장을 첨부해야합니다.");
		return;
	}
	
	document.registForm.submit();
}
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