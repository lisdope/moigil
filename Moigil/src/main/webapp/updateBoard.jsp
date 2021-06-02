<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
var imageFolder; // Usercontroller로 보낼 변수의 이름
// imageFolder가   Usercontroller에 있는   "upload.do"매핑쪽으로 
// 파라미터값으로 보내지게 된다. 

$(document).ready(function() {		
imageFolder = "boardImg"; // userImg ==> 사진이 저장될 실제 폴더이름
            // 그것을 파라미터값으로 쓰일 imageFolder에 대입시켜 이용한다.(그냥 폴더이름을 쓰면 안되는지?) 
});


// upload() 프로필 이미지를 저장하고(?) 미리보기를 하는 함수
// ajaxSubmit함수는 jquery.form.js에 정의된 함수 !

// id속성값이 ajaxform인 요소를 선택하여 ajaxSubmit 함수를 실행 
// jquery.form.js파일에서 93번째 줄부터 834줄까지 ajaxSubmit이 정의되어있어 함수 파악이 안됨..
// ajaxform 역시 같은 파일에 정의해놓은 함수가 있는듯함

// Form 작업을 Ajax로 간단하게 사용하고 싶을 때가 많다.
// 하지만, jQuery에서 지원하는 Form은 일반적으로 Ajax가 불가능하다고 한다.
// 그래서 jQuery로 구성된  jQuery.Form.js 플러그인을 사용해야 한다. 

function upload() { 

$("#ajaxform").ajaxSubmit({ 
type : "POST", 
dataType : 'html',
url : $("#ajaxform").attr("action"), //전송할 페이지 ==> 여기서 upload.do로 보내는건가?
data : $("#ajaxform").serialize(), // 데이터의 전송 방식을 쿼리스트링 형식의 데이터로 변환해 반환한다.
success : function(data) { // 데이터 전송에 성공한 후 실행되는 부분
data2 = data.replace(/"/gi, ""); 
// ??? 
var imageUrl = "${context}/boardImg/" + data2; // 이미지경로를 절대경로로 설정하여 가져오는 방식
$("#pic").attr("src", imageUrl); // 미리보기를 설정하는 부분 => id속성값으로 pic인 요소의 src속성에 imageUrl을 대입시킨다. => 회원이 업로드한 사진의 경로로 설정한다	 
$("#boardImage").val(data2); // userImage에 값을 data2로 설정한다.
},
error : function(xhr, status, error) {
alert(error);
}
});
}
</script>
<style>
body{
	margin-top: 10%;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 상세</title>
</head>
<body>
<div class="container">
	<center>
		<hr>
		<form class="form-inline" action="insertBoard.do" method="post">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="userCode" value="${board.userCode}">
			<input type="hidden" name="grade" value="${board.grade}">
			<input type="hidden" name="boardDate" value="${board.boardDate}">
			<input type="hidden" name="boardHits" value="${board.boardHits}">
			<input type="hidden" name="boardRatingLike" value="${board.boardRatingLike}">  
				<p align="left"><b> 게시글 번호 :</b> ${board.boardNo} </p>
				<br>
			<div class="form-group">
					<label for="exampleInputName2">제목 </label>
					<input type="text" name="boardTitle" value="${board.boardTitle}" class="form-control" style="width: 500px">
			</div>
			<br>
			<select class="form-select" style="width: 100px" name="areaCode">
						<option value="전체">전체</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
					</select>
			<br>
			<div class="form-group">
					<label for="exampleInputName2">내용</label>
					<textarea class="form-control" name="boardContents" rows="5" cols="30" 
						style="width: 500px; height: 300px">${board.boardContents}</textarea>
			</div>
			<div>
			<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/boardImg/${board.boardImage}" onerror="this.style.display='none'" alt='' /><br/>
			</div>
			<br>
			<br>
			<input class="btn btn-default" type="submit" value="수정">
			<input class="btn btn-default" type="button" onclick="history.back(-1);" value="취소">
			<div class="form-group">
					<p>
						<label for="image" class="image"><b>사진</b></label> <img id="pic"
							style="margin-left: 15px;" height="180px" width="150px"
							src="${context}/backgroundImage/defaultpic.png"><br />
					<div class="col-md-6">
						<input type="hidden" id="boardImage" name="boardImage"
							required="required" value="${board.boardImage}" >
					</div>
				</div>
		</form>
		<!-- upload()함수가 먼저 실행면서 upload.do가 실행되는듯하다.-->
		<!-- form 태그의 id속성값으로 ajaxform을 설정하여 전송할 데이터를 묶어준고 action속성으로 upload.do를 설정하여 사진,프로필 이미지를 저장하게 된다. -->		
		<form id="ajaxform" method="post" action="uploadBoard.do"
			enctype="multipart/form-data">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="userCode" value="${board.userCode}">
			<input type="hidden" name="grade" value="${board.grade}">
			<input type="hidden" name="boardDate" value="${board.boardDate}">
			<input type="hidden" name="boardHits" value="${board.boardHits}">
			<input type="hidden" name="boardRatingLike" value="${board.boardRatingLike}">
			<p>                                 
				<label for="tel">사진</label> 
				                  <!-- imageFile => usercontroller로 보내지는 파라미터 값으로 name을 맞춰준다.  -->
				<input type="file" style="width: 200px;" id="imageFile" name="imageFile" onchange="upload()"   />  
				<input type="hidden" id="imageFolder" name="imageFolder" value="boardImg">
			</p>
		</form>
	</center>
	</div>
	<hr>
</body>
</html>
	