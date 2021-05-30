<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
	
	
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.userInfo.roadFullAddr.value = roadFullAddr;
		document.userInfo.zipNo.value = zipNo;
	}
	
	function idchk() {
		var id = document.getElementById("id").value;
		window.open("/idChk.do?id=" + id, "pop",
				"width=400,height=300, scrollbars=no, resizable=no");
	}

	// inputIdChk() => 아이디 중복체크 함수
	// 값을 체크하여 비교하는 팝업창을 띄울 경우 체크 하고난 결과 값을 다시 부모 창으로 돌려줄 때 
	// "opener.document.폼네임.필드네임.value=값 "의 형식으로 돌려준다 
	
	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.	
	function inputIdChk() {		
		document.userInfo.idDuplication.value = "uncheck";
	}

	function checkValue() {
		var form = document.userInfo;
		if (!form.id.value) {
			alert("아이디을 입력해주세요");
			return false;
		}
		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if (!form.pw.value) {
			alert("비번을 입력해주세요");
			return false;
		}

	}

	var imageFolder; // Usercontroller로 보낼 변수의 이름
	                 // imageFolder가   Usercontroller에 있는   "upload.do"매핑쪽으로 
	                 // 파라미터값으로 보내지게 된다. 
	
	$(document).ready(function() {		
		imageFolder = "userImg"; // userImg ==> 사진이 저장될 실제 폴더이름
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
				var imageUrl = "${context}/userImg/" + data2; // 이미지경로를 절대경로로 설정하여 가져오는 방식
				$("#pic").attr("src", imageUrl); // 미리보기를 설정하는 부분 => id속성값으로 pic인 요소의 src속성에 imageUrl을 대입시킨다. => 회원이 업로드한 사진의 경로로 설정한다	 
				$("#userImage").val(data2); // userImage에 값을 data2로 설정한다.
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	}
</script>
<title>회원가입</title>
</head>
<body>

	<div id="contentsArea">
		<!-- #contents 시작 -->
		<!-- 회원가입 시작 -->
		<section id="contents" class="memberJoin"> <!-- 현재위치 시작 -->
		<p class="location">
			Home &gt; <strong>회원가입</strong>
		</p>
		<!-- //현재위치 종료 -->
		<h1>회원가입</h1>
		<p class="formSign">
			<strong class="require">필수</strong> 는 반드시 입력하여야 하는 항목입니다.
		</p>

		<form action="createUser.do" name="userInfo" id="joinForm"
			method="post" onsubmit="return checkValue()">
			<fieldset>
				<legend>회원가입 정보 입력 폼</legend>
				<p>
					<label for="id">아이디<strong class="require">필수</strong></label>
					<input type="text" style="width: 100px;" name="id" id="id" onkeydown="inputIdChk()" /> 
					<input type="button" onClick="idchk();" value="중복체크" /> 
					<input type="hidden" name="idDuplication" value="uncheck">
				<p>
					<label for="password">비밀번호<strong class="require">필수</strong></label><input
						type="password" style="width: 100px;" name="pw" id="pw" />
				<p>
					<label for="name">이름<strong class="require">필수</strong></label><input
						type="text" style="width: 50px;" name="name" id="name" />
				<p>
					<label for="birth">생일</label><input type="date" name="birth"
						id="birth" />
				<p>
					<label for="email">이메일</label><input type="text"
						style="width: 200px;" name="email" id="email" />
				<p>
					<label for="tel">번호</label><select name="phoneCd" id="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>
					</select><input type="text" style="width: 100px;" name="phoneNum" />
				<p>
					<label for="postNum">우편번호 </label><input type="text"  style="width:100px;" id="zipNo"  name="postNum" readonly/>
					<input type="button" onClick="goPopup();" value="주소검색"/><br>
					<label for="address">도로명주소</label><input type="text"  style="width:600px;" id="roadFullAddr"  name="address" readonly/>
				</p>
					
				<!-- 프로필 이미지가 미리보기로 보여지는 곳 -->	
				<div class="form-group">
					<p>
						<label for="image" class="image"><b>사진</b></label> <img id="pic"
							style="margin-left: 15px;" height="180px" width="150px"
							src="${context}/backgroundImage/defaultpic.png"><br />
					<div class="col-md-6">
						<input type="hidden" id="userImage" name="userImage"
							required="required">
					</div>
				</div>
				<input type="hidden" id="flag" name="flag" value="false"><br>


		</form>

		<!-- upload()함수가 먼저 실행면서 upload.do가 실행되는듯하다.-->
		<!-- form 태그의 id속성값으로 ajaxform을 설정하여 전송할 데이터를 묶어준고 action속성으로 upload.do를 설정하여 사진,프로필 이미지를 저장하게 된다. -->		
		<form id="ajaxform" method="post" action="upload.do"
			enctype="multipart/form-data">
			<p>                                 
				<label for="tel">프로필</label> 
				                  <!-- imageFile => usercontroller로 보내지는 파라미터 값으로 name을 맞춰준다.  -->
				<input type="file" style="width: 200px;" id="imageFile" name="imageFile" onchange="upload()" />  
				<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
			</p>
		</form>
					<div class="btnJoinArea">
						<button type="submit" class="btnOk">회원가입</button>
						<button type="button" class="btnCancel">취소</button>
					</div>
			</fieldset>


		</section>
</body>
</html>