<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>당일모임 글정보</title>
    
</head>
<script>

</script>
<body>
<div id="map" style="width:700px;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=682946d5861fe4cad908d7d05104e4bc&libraries=services"></script>

<div>
		<form method="post" name="form">
		<textarea id="mapX" name="mapX" cols="40" rows="10" style=display:none>${Meeting.mapX}</textarea>
		<textarea id="mapY" name="mapY" cols="40" rows="10" style=display:none>${Meeting.mapY}</textarea>
			<textarea id="startpointX" name="startpointX" cols="40" rows="10" style=display:none>${Meeting.startpointX}</textarea>
			<textarea id="startpointY" name="startpointY" cols="40" rows="10" style=display:none>${Meeting.startpointY}</textarea>
			<textarea id="endpointX" name="endpointX" cols="40" rows="10" style=display:none>${Meeting.endpointX}</textarea>
			<textarea id="endpointY" name="endpointY" cols="40" rows="10" style=display:none>${Meeting.endpointY}</textarea>
			<table border="1">
								<tr>
					<td>인원수
						<input type="text" name="count" value="${Meeting.count}">
					</td>
					<td>지역
						<input type="text" name=areaCode value="${Meeting.areaCode}">
					</td>
				</tr>
					<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="meetingTitle" value="${Meeting.meetingTitle}" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left">${Meeting.meetingContents}</td>
				</tr>
			</table>
		</form>
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq Meeting.userCode)}">
		 <a href="editMeeting.do?meetingNo=${Meeting.meetingNo}"><button class="btn btn-primary">글수정</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>					
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq Meeting.userCode)}">
		<a href="deleteMeeting.do?meetingNo=${Meeting.meetingNo }"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		<c:import url="/getJoinList.do">
		</c:import>
</div>
</body>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(document.getElementById('mapX').value, document.getElementById('mapY').value), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  


// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var pos =  map.getCenter();
kakao.maps.event.addListener(map, 'center_changed', function() {
    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();
    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    pos = latlng;
});


// 장소 검색 객체를 생성합니다

// 키워드로 장소를 검색합니다

var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
startOption = { 
    offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//출발 마커 이미지를 생성합니다
var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
startDragOption = { 
    offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//출발 마커의 드래그 이미지를 생성합니다
var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

//출발 마커가 표시될 위치입니다 
var startPosition = new kakao.maps.LatLng(document.getElementById('startpointX').value, document.getElementById('startpointY').value);    
//출발 마커를 생성합니다
var startMarker = new kakao.maps.Marker({
map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
position: startPosition,
draggable: false, // 출발 마커가 드래그 가능하도록 설정합니다
image: startImage // 출발 마커이미지를 설정합니다
});


var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
arriveOption = { 
offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//도착 마커 이미지를 생성합니다
var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
arriveDragOption = { 
    offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//도착 마커의 드래그 이미지를 생성합니다
var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

//도착 마커가 표시될 위치입니다 
var arrivePosition = new kakao.maps.LatLng(document.getElementById('endpointX').value, document.getElementById('endpointY').value);    

//도착 마커를 생성합니다 

var arriveMarker = new kakao.maps.Marker({  
	map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
	position: arrivePosition,
	draggable: false, // 도착 마커가 드래그 가능하도록 설정합니다
	image: arriveImage // 도착 마커이미지를 설정합니다
	});
</script>
</html>
