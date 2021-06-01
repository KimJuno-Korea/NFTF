<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<footer class="gray">
		<div class="block">
			<div class="row">
				<div class="col-lg-12">
					<div class="widget">
						<div class="mega-widget">
							<div class="row">
								<div class="col-lg-2" style="vertical-align: middle;">
									<div class="image-area">
									<a class="logo" href="${pageContext.request.contextPath}/index" ><img class="logo-black" src="${pageContext.request.contextPath}/customimages/TRADING365__.png" alt=""></a>
									</div>
								</div>
								<div class="col-lg-4">
									<span>종합 프로젝트 2021</span>
									<span>비 대면 중고거래 시스템 Trading 365</span>
								</div>
								<div class="col-lg-6">
									<span>팀 삼위일체</span>
									<span>@김준오 @박주현 @김도현</span>
									<span>#선문대학교</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-line style2">
			<span>© 2021 Trading 365 All rights reserved. Design by Creative Layers</span>
			<a href="#scrollup" class="scrollup" title=""><i class="la la-arrow-up"></i></a>
		</div>
	</footer>
</body>

 <!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap Js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Slick Js -->
<script defer src="${pageContext.request.contextPath}/js/slick.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<!-- Add Main JS -주현 -->

<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/modernizr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/script.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/slick.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/parallax.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/select-chosen.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.scrollbar.min.js" type="text/javascript"></script>
<script>
	var openBtn = $('#openMenu');
	var topMenu = $('#topMenu');
	var topHidden = $('#topHidden');
	var menuIcon = $('#menuIcon');

	openBtn.click(function(){
		if (topMenu.css('visibility') != 'hidden') {
			topMenu.css('visibility', 'hidden');
			topMenu.css('opacity', '0');
			topMenu.css('height', '0');
			topHidden.css('margin-bottom', '150px');
			menuIcon.attr('src', '${pageContext.request.contextPath}/customimages/menu.png');
			
		} else {
			topMenu.css('visibility', 'visible');
			topMenu.css('opacity', '1');
			topMenu.css('height', '300px');
			topHidden.css('margin-bottom', '450px');
			menuIcon.attr('src', '${pageContext.request.contextPath}/customimages/menu-close.png');
		}
	});
</script>
</html>