<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
<body>
	<h1> 지점 등록 화면 </h1>
	<form action="/branch" method="post">
		
		<div class="title">
			<label>지점 코드
				<input type="text" name="code" placeholder="TEST_XX_0X"/>
			</label>
		</div>
		<div>
			<label>지점 명
				<input type="text" name="name" placeholder="제주 ㅁㅁ점"/>
			</label>
		</div>
		<div>
			<label>지점 위도
				<input type="text" name="latitude" id="input_latitude" placeholder="xxx.xxx"/>
			</label>
			<label>지점 경도
				<input type="text" name="longtitude" id="input_longtitude" placeholder="xxx.xxx"/>
			</label>
			<input type="button" value="지도로 조회" onClick="panTo()"/>
		</div>
		<div>
			<label>거래함 갯수
				<input type="number" name="tradingBoxCount" placeholder="1"/>
			</label>
		</div>
		<div>
		<label>지점 상태
			<select name="status" >
				<option value="Y" selected> Y </option>
				<option value="N"> N </option>
			</select>
		</label>
		</div>
		<input type="submit" value="지점 등록">
	</form>
<body>
	<div id="map" style="width:100%;height:350px;"></div>
	<div id="clickLatlng"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9318f30131f6fa4339b2a5103c22a5c&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var geocoder = new kakao.maps.services.Geocoder();
		var marker = new kakao.maps.Marker({ 
		    position: map.getCenter() 
		}); 
		
		var infowindow = new kakao.maps.InfoWindow({zindex:1});
		marker.setMap(map);
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {        
		    
		    var latlng = mouseEvent.latLng; 
		  
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' + detailAddr + '</div>';
		        };
		        
			    marker.setPosition(latlng);
			    marker.setMap(map);
			    
		        infowindow.setContent(content);
		        infowindow.open(map, marker);
			    
			    document.getElementById('input_latitude').value = latlng.getLat();
			    document.getElementById('input_longtitude').value = latlng.getLng();
			    
			    panTo();
			});
		});
		
		 function setMarker (latitude, longtitude) {        
				 var coord = new kakao.maps.LatLng(latitude, longtitude); 
			  
			   	 searchDetailAddrFromCoords(coord, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			            
			            var content = '<div class="bAddr">' + detailAddr + '</div>';
			        };
			        
				    marker.setPosition(coord);
				    marker.setMap(map);
				    
			        infowindow.setContent(content);
			        infowindow.open(map, marker);
				});
		 };
		
	    function searchDetailAddrFromCoords(coords, callback) {
	        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    }
	    
	    function searchAddrFromCoords(coords, callback) {
	        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	    }
	    
	    function panTo() {
	    	var latitude = document.getElementById('input_latitude').value;
	    	var longtitude = document.getElementById('input_longtitude').value;
		    var moveLatLon = new kakao.maps.LatLng(latitude, longtitude);
		    map.panTo(moveLatLon);  
		    setMarker (latitude, longtitude);
		};
	</script>
</body>
</html>