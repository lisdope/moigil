<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">W
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<style type="text/css">
#header, #contentsArea, #slogan, #footerInner {
    width: 1151px;
    margin: 0 auto;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
#contentsArea {
    overflow: hidden;
    min-height: 600px;
    padding: 30px 0 30px 30px;
    background-color: #fff;
    border-radius: 15px 15px 0 0;

}
</style>
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">


function upload() { 
	
	$("#ajaxform").ajaxSubmit({ 
		type : "POST", 
		dataType : 'text',
		url : $("#ajaxform").attr("action"), //전송할 페이지 ==> 여기서 upload.do로 보내는건가?
		data : $("#ajaxform").serialize(), // 데이터의 전송 방식을 쿼리스트링 형식의 데이터로 변환해 반환한다.
		success : function(data) { // 데이터 전송에 성공한 후 실행되는 부분
			data2 = data.replace(/"/gi, ""); 
			// ??? 
			var imageUrl = "${context}/galleryImg/" + data2; // 이미지경로를 절대경로로 설정하여 가져오는 방식
			$("#pic").attr("src", imageUrl); // 미리보기를 설정하는 부분 => id속성값으로 pic인 요소의 src속성에 imageUrl을 대입시킨다. => 회원이 업로드한 사진의 경로로 설정한다	 
			$("#filenames").val(data2); // userImage에 값을 data2로 설정한다.
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}

</script>


<title>getGallery</title>
</head>
<body>
	<div id="wrapper">
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
				<div id="contentsArea"> 
		
		<!--   콘텐츠 컬럼 시작 -->
		
		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>이미지 게시판</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>이미지 게시판 </h1>
		
	<center>	
	<div class="container" style="margin-left: -39px;">
			<section id="boardview">
				<table class="table table-striped " border="1">
				<tbody>
					<tr class="table-info">
						<th colspan="2" class="table-condensed">제목</th>
						<td colspan="2" align="left">${gallery.galleryTitle }</td>
						
					</tr>
					<tr class="table-info">
						<th colspan="2" class="table-condensed">번호</th>
						<td colspan="2" align="left">${gallery.galleryNo }</td>
						
					</tr>
					</tbody>
					<tfoot>
					<tr>
						<th class="table-info">내용</th>
						<td colspan="3" align="left"><textarea rows="3" cols="120" readonly="readonly">${gallery.galleryContents}</textarea>
						</td>
					</tr>
					</tfoot>
				</table>
				<div>
			<img id="pic" style="position: relative; margin-left: 15px;" height="180px" width="150px" src="/galleryImg/${gallery.filenames}" onerror="this.style.display='none'" alt='' /><br/>
			</div>
				</section>
		</div>
		<div class="container2" style="margin-left: 235px; position: relative;">
		<a href="editGallery.do?galleryNo=${gallery.galleryNo}"><button type="button" class="btn btn-primary btn-sm">글수정</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="deleteGallery.do?galleryNo=${gallery.galleryNo}"><button type="button" class="btn btn-primary btn-sm">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="createGallery.jsp"><button type="button" class="btn btn-primary btn-sm">글등록</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="getGalleryList.do"><button type="button" class="btn btn-primary btn-sm">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		<br><br>
		
		</div>
		
		</section>
	</center>	
		</div>
	</div>
			<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
</body>
</html>