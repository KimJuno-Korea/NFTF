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
								<h3>로그인 QR</h3>
								<span>무인 거래함에서 로그인할 수 있는 QR코드 입니다.</span>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index">Home</a></li>
									<li><a href="${pageContext.request.contextPath}/user/form/${sessionScope.id}">MyPage</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="row">
		<div class="col-12">
			<img class='login-qr' src="${pageContext.request.contextPath}/user/qr/${sessionScope.id}"
					align="middle">
		</div>
	</div>
	
<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
	