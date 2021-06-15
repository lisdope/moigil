<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<style type="text/css">
html {
	overflow-y: scroll;
}
</style>
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
		<div id="contentsArea" class="container">

			<!--   콘텐츠 컬럼 시작 -->
			<section id="contents" class="qnaBoard">
				<!-- 현재위치 시작 -->
				<p class="location">
					모이길 &gt; 함께가요(모임) &gt; <strong>이미지 게시판</strong>
				</p>
				<!-- //현재위치 종료 -->
				<h1>이미지 게시판</h1>


		<div class="container">
					<section id="boardview">
						<table class="table table-hover " border="1">
						

							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">제목</label>
									</p></th>
								<td colspan="2" align="left">${gallery.galleryTitle }</td>

							</tr>
							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">번호</label>
									</p></th>
								<td colspan="2" align="left">${gallery.galleryNo }</td>

							</tr>

							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">내용</label>
									</p></th>
								<td colspan="3" align="left">${gallery.galleryContents}</td>
							</tr>
							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">사진</label>
									</p></th>
								<td colspan="3" align="left"><img id="pic"
									style="position: relative; margin-left: 15px;" height="200px"
									width="300px" src="/galleryImg/${gallery.filenames}"
									onerror="this.style.display='none'" alt='' /></td>
							</tr>
						</table>
					</section>
				</div>
				
				<div class="container2" align="center">
					
					<a href="editGallery.do?galleryNo=${gallery.galleryNo}">
					<button type="button" class="btn btn-primary ">글수정</button></a>&nbsp;&nbsp;&nbsp;
					<a href="deleteGallery.do?galleryNo=${gallery.galleryNo}">
					<button type="button" class="btn btn-primary ">글삭제</button></a>&nbsp;&nbsp;&nbsp;
					<a href="createGallery.jsp"><button type="button" class="btn btn-primary ">글등록</button></a>&nbsp;&nbsp;&nbsp; 
					<a href="getGalleryList.do"><button type="button" class="btn btn-primary ">글목록</button></a>&nbsp;&nbsp;&nbsp; 
					<br>

				</div>
			</section>
			
		</div>
	</div>
	<!-- #footer 시작 -->
	<jsp:include page="WEB-INF/footer.jsp" />
	<!-- //#footer 종료 -->
</body>
</html>