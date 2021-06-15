<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<style type="text/css">
#joinForm p {
    position: relative;
    overflow: hidden;
    border-bottom: 0px solid #ccc;
}
tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
    border-width: 3px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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


<title>file upload</title>
</head>
<body>
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />
<div id="contentsArea"> 
	
		<!--   콘텐츠 컬럼 시작 -->
<form action="galleryUpload.do" name="userInfo" id="joinForm" method="post" >
			<fieldset>
				<table class="table table-hover" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="table-primary" width="70" for="galleryNo"><p><label for="filenames" class="filenames">글번호</label></p></td>
					<td align="left"><input type="text" style="width: 200px;" name="galleryNo" id="galleryNo" value="${gallery.galleryNo}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="table-primary" width="200" for="galleryTitle"><p><label for="filenames" class="filenames">글제목</label></p></td>
					<td align="left"><input type="text" style="width: 200px;" name="galleryTitle" id="galleryTitle" value="${gallery.galleryTitle}"/></td>
				</tr>
				<tr>
					<td class="table-primary" for="galleryContents"><p><label for="filenames" class="filenames">글내용</label></p></td>
					<td align="left"><input type="text" style="width: 200px; " name="galleryContents" id="galleryContents" value="${gallery.galleryTitle}"/></td>
				</tr>
				
				<tr>
					<td class="table-primary" for="filenames"><p><label for="filenames" class="filenames">이미지 파일명</label></p></td>
					<td align="left"><input style="width: 300px; height: 30;" name="filenames" id="filenames" value="${gallery.filenames}" /></td>
				</tr>
				<!-- 갤러리 이미지가 미리보기로 보여지는 곳 -->	
				<tr>
				<td class="table-primary" for="filenames">
					<p>
						<label for="filenames" class="filenames"><b>사진이미지</b></label> 
						<td align="left"><img id="pic" style="width: 400;
    margin-left: 100px;
    height: 300;" src="/galleryImg/${gallery.filenames}"></td><br />
				</tr>																								
				
				<input type="hidden" id="flag" name="flag" value="false"><br>

		</form>
		
		<!-- upload()함수가 먼저 실행면서 upload.do가 실행되는듯하다.-->
		<!-- form 태그의 id속성값으로 ajaxform을 설정하여 전송할 데이터를 묶어준고 action속성으로 upload.do를 설정하여 사진,프로필 이미지를 저장하게 된다. -->		
		<form id="ajaxform" method="post" action="imageUpload.do"
			enctype="multipart/form-data">
			<tr>
			<td class="table-primary" for="filenames">
			<p>                                 
				<label for="tel">프로필</label></td> 
				                  <!-- imageFile => usercontroller로 보내지는 파라미터 값으로 name을 맞춰준다.  -->
			<td align="left"><input type="file" style="width: 300; height: 30;" id="imageFile" name="imageFile" onchange="upload()" />  
				<input type="hidden" id="galleryImg" name="galleryImg" value="galleryImg"></td>
			</p>
			</tr>	
		</form>
				</table>
		
		<div class="btns" style="margin-left: 400;">
		<button type="submit" class="btn btn-primary btn-sm">글 수정</button>
		<a href="getGalleryList.do"><button type="button" class="btn btn-primary btn-sm">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		</div>
	
		</fieldset>
		
	</div>
	</div>	
	<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
</body>
</html>