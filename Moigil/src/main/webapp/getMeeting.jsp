<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>정보보기</title>

</head>
<body onload="loadview()">
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=682946d5861fe4cad908d7d05104e4bc"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
function loadview(){
	var Point = document.form.startPoint.value;
    // 클릭한 위도, 경도 정보를 가져옵니다 
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(new kakao.maps.LatLng(JSON.parse(Point).Ma, JSON.parse(Point).La));
}
</script>
<div>
		<form method="post" name="form">
		
			<textarea name="startPoint" cols="40" rows="10" style=display:none>${Meeting.startPoint}</textarea>
			<table border="1" cellpadding="0" cellspacing="0">
								<tr>
					<td>인원수
						<input type="text" name="count" value="${Meeting.count}">
					</td>
				</tr>
					<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="meetingTitle" value="${Meeting.meetingTitle}" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left">${Meeting.meetingContents}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value=" 새글 등록 " /></td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>