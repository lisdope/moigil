<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Main Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<style>
	*{margin: 0;padding: 0;}
	body{font-size: 12px;}
	input{vertical-align: middle;}
	#notice_wrap{
		width: 300px;
		position: absolute;
		left: 900px;
		top: 300px;
		box-shadow:0 0 8px #000;
		cursor:move
	}
	.closeWrap{
		background-color: #000;
		color:#fff;
		text-align: right;
		padding:5px 10px;
	}
	.closeWrap button{
		margin-left: 20px;
		cursor:pointer;
	}	
	.layer_popup{
		position: absolute;left: 50px; top: 50px;
		cursor:move;
		
	}
</style>
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<script src="js/jquery1.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#pw").keydown(function (key){
		if(key.keyCode == 13){
			ajaxLoginCheck();
		}

	});
});

function ajaxLoginCheck(){
	var id = $("#id").val();
	var pw = $("#pw").val();

	var param = {};

	param["id"] = id;
	param["pw"] = pw;

	$.ajax({
		url:"/ajaxLoginCheck.do",
		contentType:"application/json",
		dataType:"json",
		data:param,
		success:function(result){
			if(result['loginYn'] == 'success'){
				alert("로그인에 성공하였습니다.");
				$("#loginFrm").submit();
			}else{
				alert('로그인에 실패하셨습니다.');
				$("#id").val('');
				$("#pw").val('');
			}
		}
	});
}



$(function() {
	if($.cookie("popup") == "none") {
			$("#notice_wrap").hide();
	}

	var $expChk = $("#expiresChk");
	$(".closeBtn").on("click", closePop);
	
	function closePop() {
		if($expChk.is(":checked")) {
			$.cookie("popup","none",{expires:3, path:"/"});
		}
		$("#notice_wrap").fadeOut("fast");
	}    
});

$(function() {
	$(".layer_popup").draggable();
});

</script>  
<style type="text/css">
html { overflow-y:scroll; }
</style>

    
</head>

<body>
	<!-- #wrapper 시작 -->

</script>
	<div id="wrapper">
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		
		<!-- //#visual 종료 -->
		<!-- #contentsArea 시작 -->

	<div id="notice_wrap" class="layer_popup">
		<img src="images/popup.jpg" alt="공지사항">
		<p class="closeWrap">
			<input type="checkbox" name="expiresChk" id="expiresChk">
			<label for="expiresChk">3일 동안 이 창 열지않기</label>
			<button class="closeBtn">닫기</button>
	</p>
	</div>  
		
	

		<div id="contentsArea" class="container"> 
		<!-- 로그인 및 배너, 용어설명 관련 콘텐츠 컬럼 시작 -->
		
		<div id="usefulArea">
		
			<!-- 로그인 시작 -->
			<section class="login">
				<h1>로그인</h1>

				<c:if test="${empty sessionScope.user.id}">
					<form action="login.do" method="post" role="form" id="loginFrm">
						<fieldset>
							<legend>회원 로그인 폼</legend>
							<p>
								<label for="userId">아이디</label> <input type="text" id="id" name="id" required placeholder="아이디">
							</p>
							<p>
								<label for="userPw">비밀번호</label> <input type="password" id="pw" name="pw" required placeholder="4자이상 8자이하">
							</p>
							<p>
								<button type="submit" onclick="ajaxLoginCheck();">로그인</button>
							</p>
						</fieldset>
					</form>
				</c:if>
				<c:if test="${!empty sessionScope.user.id}">
					<h1>[${user.id}]님 환영합니다!</h1>
				</c:if>
				
				<div class="memberLink">
				<c:if test="${empty sessionScope.user.id}">
					<a href="createUser.jsp" class="join">회원가입</a>
					<a href="getId.jsp" class="find">아이디/비밀번호 찾기</a>
					<img src="../images/naver_login.png" width="100px" />
					<img src="../images/kakao_login.png" width="100px" />
					<img src="../images/google.png" width="100px" />
					<img src="../images/face_login.png" width="100px" />
					</c:if>
				</div>
			</section>
			<!-- //로그인 종료 -->
			<!-- //로그인 및 배너, 용어설명 관련 콘텐츠 컬럼 종료 -->
		</div>
		<!-- 메인 페이지 소개 시작 -->
		<section id="infoArea" class="html5Intro">
			<p class="location">Home &gt; 모이길에 대해 &gt; <strong>모이길 소개</strong></p> 
			<h1>모이길 소개</h1>
			<h2>모이길이란?</h2>
			<p>산책, 등산 등을 좋아하는 사람들을 위한 커뮤니티 당일 산책 모임, 채팅 등을 제공하며,</p>
			<br>
        	<p>관련 제품들을 공동구매를 할 수 있는 쇼핑몰 등 토탈 웹 서비스를 제공합니다. 
        	그리고 GPS위치기반으로 산책길 자동 안내 및 실시간 위치공유로 편리함과 안전함을 제공하는 앱 서비스입니다. 
        	</p> 
        	<br>
        	
        	<h2>모이길의 콘텐츠</h2>
        	
			<!-- //HTML5 소개 종료 -->
			</section>
		
		
		</div>
		
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>