<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Main Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
</head>

<body>
	<!-- #wrapper 시작 -->
	<div id="wrapper">
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		
		<!-- //#visual 종료 -->
		<!-- #contentsArea 시작 -->
		<div id="contentsArea"> 
		<!-- 로그인 및 배너, 용어설명 관련 콘텐츠 컬럼 시작 -->
		<div id="usefulArea">
			<!-- 로그인 시작 -->
			<section class="login">
				<h1>로그인</h1>

				<c:if test="${empty sessionScope.user.id}">
					<form action="login.do" method="post">
						<fieldset>
							<legend>회원 로그인 폼</legend>
							<p>
								<label for="userId">아이디</label> <input type="text" name="id" required placeholder="아이디">
							</p>
							<p>
								<label for="userPw">비밀번호</label> <input type="password" name="pw" required placeholder="4자이상 8자이하">
							</p>
							<p>
								<button type="submit">로그인</button>
							</p>
						</fieldset>
					</form>
				</c:if>
				<c:if test="${!empty sessionScope.user.id}">
					<h1>[${user.id}]님 환영합니다!</h1>
				</c:if>
				
				<div class="memberLink">
					<a href="createUser.jsp" class="join">회원가입</a>
					<a href="getId.jsp" class="find">아이디/비밀번호 찾기</a>
					
				</div>
			</section>
			<!-- //로그인 종료 -->
		</div>
			<!-- //로그인 및 배너, 용어설명 관련 콘텐츠 컬럼 종료 -->
		<!-- #slogan 시작 -->
		<section id="slogan">
			슬로건 영역
		</section>
		</div>
		<!-- //#slogan 종료 -->
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>