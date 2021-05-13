<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>
	<h1> 지점 목록 조회 화면 </h1>
	<table border="1">
		<thead>
			<tr>
			<th>지점 코드</th>
			<th>지점 명</th>
			<th>지점 위도</th>
			<th>지점 경도</th>
			<th>지점 상태</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${branchList}" var="branch">
					<tr>
						<td><c:out value="${branch.code}" /></td>
						<td><a href="/tradingbox/${branch.name}"><c:out value="${branch.name}" /></a></td>
						<td><c:out value="${branch.latitude}" /></td>
						<td><c:out value="${branch.longtitude}" /></td>
						<td><c:out value="${branch.status}" /></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<div id="map" style="width:500px;height:400px;"></div>
	<a href="/branch/form" ><input type="button" value="등록"/></a>
	<div id="data"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9318f30131f6fa4339b2a5103c22a5c&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>

	</body>
			<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
	function setting(name, latitude, longtitude) {
			var geocoder = new kakao.maps.services.Geocoder();
			var coord = new kakao.maps.LatLng(latitude, longtitude);
			var resultr = new Array();
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			    	console.log(name + '_address');
			    	
			    	document.getElementById('data').textContent = result[0].address.address_name;
			    	console.log($("#data").data('detail'));
			    	resultr.push(result[0].address.address_name);
			    }
			};
			console.log(resultr);
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	}

	 
	// 지도에 마커를 표시합니다 

	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var items = new Array();
	<c:forEach items="${branchList}" var="branch"> 
		var branch = {
				name : '${branch.name}',
				latitude : '${branch.latitude}',
				longtitude : '${branch.longtitude}'

					
		};
		items.push(branch);
		
		</c:forEach>
		for(var i = 0; i < items.length; i ++) {
			items[i].name;
			items[i].latitude;
			items[i].longtitude;
	
			console.log(string);
			var content = '<div class="wrap">' + 
		    '    <div class="info">' + 
		    '        <div class="title">' +
		    		items[i].name +
		    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		    '        </div>' + 
		    '        <div class="body">' + 
		    '            <div class="desc">' +
		    '                <div class="jibun ellipsis" id="' + items[i].name + '_address">' + string + '</div>' + 
		    '                <div><a href="/tradingbox/' + items[i].name + '" target="_blank" class="link">지점정보</a></div>' + 
		    '            </div>' + 
		    '        </div>' + 
		    '    </div>' +    
		    '</div>';
	    
			var marker = new kakao.maps.Marker({
			    map: map, 
			    position: new kakao.maps.LatLng(items[i].latitude, items[i].longtitude)
			});
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			content: content,
			map: map,
			position: marker.getPosition()       
			});
			setting(items[i].name, items[i].latitude, items[i].longtitude);
			var string = document.getElementById('data').textContent
			kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다.
			console.log(items[i]);
		}
		

		
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    overlay.setMap(null);     
	}
	

	
	</script>
</html>