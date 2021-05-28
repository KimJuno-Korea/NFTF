<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />

	<div class="row">
		<div class="col-12">
			<div class="account-popup">
				<h2 class="title">로그인</h2>
				<form action="/login" method="post" >
					<div class="cfield">
						<input id="inputId" type="text" name="id" placeholder="아이디"> <i class="la la-user"></i> 
				 	</div>
				 	<div class="cfield">
				 		<input id="inputPw" type="password" name="pw" placeholder="비밀번호"> <i class="la la-key"></i>
					</div>
					<input class="submit" type="submit" id="loginBtn" value="로그인">
				</form>
			</div>
		</div>
	</div>
	
<script>
</script>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
