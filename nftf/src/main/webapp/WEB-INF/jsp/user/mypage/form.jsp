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
								<h3>마이페이지</h3>
								<span>마이페이지 접속을 위해 비밀번호를 입력해 주세요</span>
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
	
	<section>
		<div class="container">
			<div class="row">
				<div class="account-popup">
					<form id="form" action="${pageContext.request.contextPath}/user/form/${id}" method="post" >
						<div class="cfield">
							<input id="inputPw" type="password" name="pw" placeholder="비밀번호">
					 	</div>
							<input type="button" class="onclick" onclick="pwSubmit()" value="확인">
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
<script>
	function pwSubmit() {

		if ($('#inputPw').val() != '') {
				$('#form').submit();
		}
		else {
			alert('비밀번호를 입력해 주세요');
		}
	}
</script>
