<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />

<section>
		<div class="block no-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>로그인</h3>
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

	<div class="row">
		<div class="col-12">
			<div class="account-popup">
				<form action="/login" method="post" autocomplete="off">
					<div class="cfield">
						<input id="inputId" type="text" name="id" placeholder="아이디"> <i class="la la-user"></i> 
				 	</div>
				 	<div class="cfield">
				 		<input id="inputPw" type="password" name="pw" placeholder="비밀번호"> <i class="la la-key"></i>
					</div>
					<input class="submit" type="submit" id="loginBtn" value="로그인">
					<div class="find">
						<a href="${pageContext.request.contextPath}/id/form">아이디 </a> - <a href="${pageContext.request.contextPath}/password/form">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<script>
</script>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
