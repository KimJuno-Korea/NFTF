<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>요청한 페이지를 찾을 수 없습니다.</title>
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
	
</head>
<body>

<div class="theme-layout" id="scrollup">

	<section>
		<div class="block no-padding">
			<div class="container fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="main-featured-sec witherror">
							<ul class="main-slider-sec text-arrows">
								<li><img src="${request.getContextPath() }/mslider2.jpg" alt="" /></li>
							</ul>
							<div class="error-sec">
								<span>현재 서버에 문제가 생겨 요청한 페이지를 처리할 수 없습니다.</span>
								<h6><a href="${request.getContextPath() }/index" title="">메인 페이지로 돌아가기</a></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	

</div>


<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/modernizr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/script.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/slick.min.js" type="text/javascript"></script>

</body>
</html>