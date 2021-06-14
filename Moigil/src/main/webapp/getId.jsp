<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
<script>

		function findId() {
            if(joinForm1.name.value == '') { alert('이름이 입력되지 않았습니다.'); joinForm1.name.focus(); return false;}
            if(joinForm1.email.value == '') { alert('이메일이 입력되지 않았습니다.'); joinForm1.email.focus(); return false;}
		}
		
        function findPassword() {
            if(joinForm2.id.value == '') { alert('아이디가 입력되지 않았습니다.'); joinForm2.id.focus(); return false;}
            if(joinForm2.email.value == '') { alert('이메일이 입력되지 않았습니다.'); joinForm2.email.focus(); return false;}
		}
</script>

</head>
<body>
	
<div id="wrapper">
	<jsp:include page="WEB-INF/header.jsp" />

<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<!-- 회원가입 시작 -->
      	<section id="contents" class="memberJoin">
        		<!-- 현재위치 시작 -->
        		<p class="location">Home &gt; <strong>회원아이디&비밀번호 찾기</strong></p> 
        		<!-- //현재위치 종료 -->
        		<a href="index.jsp">홈으로</a>
        		<h1>회원아이디&비밀번호 찾기</h1>
				
        		<p class="formSign"><strong class="require">필수</strong> 는 반드시 입력하여야 하는 항목입니다.</p>
	
	<form action="getId.do" id="joinForm" name="joinForm1" method="post" >
		<fieldset>
			<legend>회원아이디&비밀번호 찾기 정보 입력 폼</legend>
			<p>
			<label for="name">성명<strong class="require">필수</strong></label> 
			<input type="text" id="name" name="name">
			<p>
			<label for="email">이메일<strong class="require">필수</strong></label> 
			<input type="text" id="email" name="email">				
			<p>
			<div class="btnJoinArea"> <button type="submit" class="btnOk" onclick="findId()">아이디찾기</button></div>
			</fieldset>
		</form>
		<form action="getPw.do" id="joinForm" name="joinForm2" method="post">
			<legend>비밀번호 찾기</legend>
			<p>
			<label for="id">아이디<strong class="require">필수</strong></label>
			<input type="text" id="id" name="id">
			<p>
			<label for="email">이메일<strong class="require">필수</strong></label> 
			<input type="text" id="email" name="email">
			<p>
			
				 <div class="btnJoinArea"> <button type="submit" class="btnOk" onclick="findPassword()">비밀번호찾기</button></div>
				
		</form>
		
		</section>
	</div>
		<!-- //#contentsArea 종료 -->
	
		
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>