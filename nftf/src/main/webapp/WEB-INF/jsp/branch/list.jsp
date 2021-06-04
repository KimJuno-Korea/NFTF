<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
	<head>
		<style>
			.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:610px;}
			#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: center;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;}
			#placesList li {list-style: none;}
			#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
			#placesList .item span {display: block;margin-top:4px;}
			#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
			#placesList .item .info{padding:10px 0 10px 55px;}
			#placesList .info .gray {color:#8a8a8a;}
			#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
			#placesList .info .tel {color:#009900;}
			#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
			#placesList .item .marker_1 {background-position: 0 -10px;}
			#placesList .item .marker_2 {background-position: 0 -56px;}
			#placesList .item .marker_3 {background-position: 0 -102px}
			#placesList .item .marker_4 {background-position: 0 -148px;}
			#placesList .item .marker_5 {background-position: 0 -194px;}
			#placesList .item .marker_6 {background-position: 0 -240px;}
			#placesList .item .marker_7 {background-position: 0 -286px;}
			#placesList .item .marker_8 {background-position: 0 -332px;}
			#placesList .item .marker_9 {background-position: 0 -378px;}
			#placesList .item .marker_10 {background-position: 0 -423px;}
			#placesList .item .marker_11 {background-position: 0 -470px;}
			#placesList .item .marker_12 {background-position: 0 -516px;}
			#placesList .item .marker_13 {background-position: 0 -562px;}
			#placesList .item .marker_14 {background-position: 0 -608px;}
			#placesList .item .marker_15 {background-position: 0 -654px;}
			#pagination {margin:10px auto;text-align: center;}
			#pagination a {display:inline-block;margin-right:10px;}
			#pagination .on {font-weight: bold; cursor: default;color:#777;}
			#btnRoadview,  #btnMap {position:absolute;top:5px; background-color : white; left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
			#btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
		</style>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
	<body>
	<section>
		<div class="block no-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>지점 조회</h3>
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
	
		<div class="block" style="margin-top:0px !important">
			<div class="container fluid">
				<div class="row" style="height:100%">
					<div class="map_wrap" style="width:66%;">
						<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						<div class="shortlists" style="position:absolute;top:10px;left:20px;padding:7px 12px;z-index:1;">
							<c:if test="${sessionScope.division eq 'A'}">
						 		<a href="/branch/form" >지점 등록</a>
						 	</c:if>
						 </div>
					</div>
				 	<div class="padding-left" style="width:33%;">
					 	<div class="emply-resume-sec">
					 		<c:forEach items="${branchList}" var="branch" varStatus="status">
					 			<input type="hidden"  id="data_${status.index}" />
						 		<div class="emply-resume-list round">
						 			<div class="emply-resume-info">
						 				<h3><a href="/tradingbox/${branch.name}" title="">${branch.name}</a></h3>
						 				<span><i>${branch.status}</i></span>
						 				<p id="detail_addtess_${status.index}"><i class="la la-map-marker"></i ></p>
						 			</div>
						 			<div class="shortlists" >
						 				<a href="javascript:void(0);" onclick="panTo(${branch.latitude}, ${branch.longtitude})" title=""> 지도 보기</a>
						 			</div>
						 		</div>
							</c:forEach>
<!-- 					 			<div class="pagination">
									<ul>
										<li class="prev"><a href=""><i class="la la-long-arrow-left"></i> Prev</a></li>
										<li><a href="">1</a></li>
										<li class="active"><a href="">2</a></li>
										<li><a href="">3</a></li>
										<li><span class="delimeter">...</span></li>
										<li><a href="">14</a></li>
										<li class="next"><a href="">Next <i class="la la-long-arrow-right"></i></a></li>
									</ul>
								</div>Pagination -->
					 	</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9318f30131f6fa4339b2a5103c22a5c&libraries=services,drawing,clusterer"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
		<script type="text/javascript">
		function setting(name, latitude, longtitude, index) {
			var geocoder = new kakao.maps.services.Geocoder();
			var coord = new kakao.maps.LatLng(latitude, longtitude);
			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {	
					document.getElementById('data_' + index).value = result[0].address.address_name.toString();
					document.getElementById('detail_addtess_' + index).textContent = result[0].address.address_name.toString();
				}
			};
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		};
		var items = new Array();
		<c:forEach items="${branchList}" var="branch" varStatus="status"> 
			var branch = {
				name : '${branch.name}',
				latitude : '${branch.latitude}',
				longtitude : '${branch.longtitude}'	
			};
			items.push(branch);
			setting(items['${status.index}'].name, items['${status.index}'].latitude, items['${status.index}'].longtitude, ['${status.index}']);
		</c:forEach>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
		
		function setMarkerInfo(items) {
			for(var i = 0; i < items.length; i ++) {
				var marker = new kakao.maps.Marker({
				    map: map,
				    position: new kakao.maps.LatLng(items[i].latitude, items[i].longtitude)
				});
			    var iwPosition = new kakao.maps.LatLng(items[i].latitude, items[i].longtitude);
				var iwContent = '<div style="padding:5px;">'+ items[i].name +
				'<br><a href="/tradingbox/' + items[i].name + '" style="color:blue" target="_blank">지점 조회</a>' +
				'<div class="jibun ellipsis" id="' + items[i].name + '_address">' + document.getElementById('data_' + [i]).value + '</div>' +
				'</div>';
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				infowindow.open(map, marker);
			}
		};
		window.onload = function() {
			setMarkerInfo(items);
		};
		
		function panTo(latitude,longtitude) {
		    var moveLatLon = new kakao.maps.LatLng(latitude, longtitude);
		    map.panTo(moveLatLon);            
		}        
		</script>