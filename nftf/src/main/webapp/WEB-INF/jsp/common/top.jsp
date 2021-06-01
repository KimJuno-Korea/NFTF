<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
 <!-- HTTP에서 HTTPS로 마이그레이션하려는 도메인 example.com에 위의 헤더가 설정되어 있으면 비 탐색적인 안전하지 않은 리소스 요청이 자동으로 업그레이드됩니다 (타사 및 타사 요청). -->
<meta charset="UTF-8">
<title>Trading 365</title>  
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="CreativeLayers">

	<!-- Styles -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-grid.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chosen.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/colors/colors.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom/input.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom/top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-park.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom/mypage.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom/index.css" />
</head>
<body>


<div class="theme-layout">
	<div class="top-hidden" id="topHidden" style="margin-bottom:150px"></div>
	
	<div class="simple-header" >
		<div class="row">
			<div class="col-9" style="text-align: left">
				<a class="logo" href="${pageContext.request.contextPath}/index" >
					<img class="logo-color" src="${pageContext.request.contextPath}/customimages/TRADING365_.png" alt=""
							style="margin:20px 0px 0px 50px">
				</a>
			</div>
			<div class="col-3">
				<a class="open-menu" id="openMenu">
					<img class="menu-icon" id="menuIcon" src="${pageContext.request.contextPath}/customimages/menu.png" style="margin-top:40px;">
				</a>
			</div>
		</div>
	</div>
	
	<header class="style4" >
		<div class="menu-sec">
			<div class="container">
				<div class="btn-extars">
					<ul class="account-btns">
						<c:if test="${sessionScope.id eq null}">
							<li class="signin-popup" style="margin-right: 10px">
								<a href="${pageContext.request.contextPath}/user/form">회원가입</a>
								<i class="la la-key"></i>
							</li>
							<li class="signin-popup">
								<a href="${pageContext.request.contextPath}/login">로그인</a>
								<div class="top-menu-la">
									<i class="la la-external-link-square"></i>
								</div>
							</li>
						</c:if>
						
						<c:if test="${sessionScope.id ne null}">
							<li class="signin-popup">
								<a  style="text-decoration: underline;" href="${pageContext.request.contextPath}/user/form/${sessionScope.id}"> ${sessionScope.id} 님</a>
							</li>
							<li class="signin-popup">
								<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
								<div class="top-menu-la">
									<i class="la la-external-link-square"></i>
								</div>
							</li>
						</c:if>
					</ul>
				</div><!-- Btn Extras -->
				<nav>
					<ul>
						<li class="menu-item-has-children">
							<a class="logo" href="${pageContext.request.contextPath}/index" ><img class="logo-color" src="${pageContext.request.contextPath}/customimages/TRADING365_.png" alt=""></a>
						</li>
						<li class="menu-item-has-children">
							<a href="${pageContext.request.contextPath}/index">서비스 소개</a>
						</li>
						<li class="menu-item-has-children">
							<a href="${pageContext.request.contextPath}/branch" >지점 조회</a>
						</li>
						<li class="menu-item-has-children">
							<a href="${pageContext.request.contextPath}/board?num=1" >중고 거래</a>
						</li>
					</ul>
				</nav><!-- Menus -->
			</div>
		</div>
	</header>
	<div class="top-menu" id="topMenu">
		<div class="row">
		</div>
		<div class="row">
			<div class="col-7">
				<nav>
					<ul>
						<li class="top-menu-children" style="boder-bottom: 1px solid #c0c0c0">
							<a href="#">- 서비스 소개</a>
						</li>
						<li class="top-menu-children">
							<a href="${pageContext.request.contextPath}/branch" >- 지점 조회</a>
						</li>
						<li class="top-menu-children">
							<a href="${pageContext.request.contextPath}/board?num=1" >- 중고 거래</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-5">
				<ul class="account-btns">
					<c:if test="${sessionScope.id eq null}">
						<li class="signin-popup" style="margin-right: 10px; margin-top: 20px">
							<a href="${pageContext.request.contextPath}/user/form">회원가입</a>
							<i class="la la-key" style="color: #ffffff"></i>
						</li>
						<li class="signin-popup" style="margin-right: 40px; margin-top: 20px">
							<a href="${pageContext.request.contextPath}/login">로그인</a>
							<i class="la la-external-link-square" style="color: #ffffff"></i>
						</li>
					</c:if>
					
					<c:if test="${sessionScope.id ne null}">
						<li class="signin-popup" style="margin-top: 20px">
							<a  style="text-decoration: underline;" href="${pageContext.request.contextPath}/user/form/${sessionScope.id}"> ${sessionScope.id} 님</a>
						</li>
						<li class="signin-popup" style="margin-right: 40px; margin-top: 20px">
							<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
							<i class="la la-external-link-square"></i>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>


